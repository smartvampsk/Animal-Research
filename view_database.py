from flask import Flask, render_template
from flaskext.mysql import MySQL


app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'research'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

mysql = MySQL()
mysql.init_app(app)


@app.route('/', methods=['GET', 'POST'])
@app.route('/home', methods=['GET', 'POST'])
def home():
    conn = mysql.connect()
    cur = conn.cursor()
    cur.execute("SELECT animal_name, general_location, contact_date, contact_time FROM individuals i JOIN contact_and_morph cm  ON cm.animal_id = i.id")
    fetchdata = cur.fetchall()

    cur.execute("SELECT animal_name, COUNT(animal_id) as Frequency FROM individuals i JOIN contact_and_morph cm ON cm.animal_id = i.id GROUP BY animal_name")
    fetchdata1 = cur.fetchall()

    cur.execute("CALL listRepeatedAnimal")
    fetchdata2 = cur.fetchall()

    cur.execute("CALL listYear")
    fetchdata3 = cur.fetchall()

    cur.close()

    return render_template("view_database.html", animals = fetchdata, countAnimals = fetchdata1, greatAnimal = fetchdata2, greatYear = fetchdata3)

@app.route("/about")
def about():
    return 'About Page'

if __name__ == '__main__':
    app.run()
