-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2019 at 11:27 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `research`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `listRepeatedAnimal` ()  BEGIN
	SELECT animal_name as Animal, MAX(Frequency) as Frequency FROM (
		SELECT animal_name, COUNT(animal_id) as Frequency
		FROM individuals i
		JOIN contact_and_morph cm
		ON cm.animal_id = i.id
		GROUP BY animal_name
	) AS maximumNumber;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listYear` ()  BEGIN
	SELECT contact_year as Contact_Year, MAX(Frequency) as Frequency FROM (
		SELECT EXTRACT(YEAR FROM contact_date) as contact_year, COUNT(EXTRACT(YEAR FROM contact_date)) as Frequency
		FROM individuals i
		JOIN contact_and_morph cm
		ON cm.animal_id = i.id
		GROUP BY contact_year
	) AS maximumContact;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `catches`
--

CREATE TABLE `catches` (
  `catch_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `body_temp` int(5) DEFAULT NULL,
  `torso` int(5) DEFAULT NULL,
  `jaw_width` int(5) DEFAULT NULL,
  `tail_girth` int(5) DEFAULT NULL,
  `weight` int(5) DEFAULT NULL,
  `morphology` varchar(5) NOT NULL,
  `lfl` varchar(5) DEFAULT NULL,
  `lhl` varchar(5) DEFAULT NULL,
  `ufl` varchar(5) DEFAULT NULL,
  `uhl` varchar(5) DEFAULT NULL,
  `tail_length` int(5) DEFAULT NULL,
  `jaw_length` int(5) DEFAULT NULL,
  `tail` varchar(5) DEFAULT NULL,
  `blood` varchar(5) DEFAULT NULL,
  `faces` varchar(5) DEFAULT NULL,
  `skin` varchar(5) DEFAULT NULL,
  `hematology` varchar(5) DEFAULT NULL,
  `swab_skin` varchar(5) DEFAULT NULL,
  `swab_oral` varchar(5) DEFAULT NULL,
  `swab_cloacal` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catches`
--

INSERT INTO `catches` (`catch_id`, `contact_id`, `body_temp`, `torso`, `jaw_width`, `tail_girth`, `weight`, `morphology`, `lfl`, `lhl`, `ufl`, `uhl`, `tail_length`, `jaw_length`, `tail`, `blood`, `faces`, `skin`, `hematology`, `swab_skin`, `swab_oral`, `swab_cloacal`) VALUES
(1, 2, 0, 0, 0, 0, 0, 'FALSE', '', '', '', '', 0, 0, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(2, 897, 0, 240, 40, 120, 850, 'TRUE', '', '', '', '', 0, 0, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(3, 898, 0, 250, 41, 110, 790, 'TRUE', '', '', '', '', 0, 0, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE');

-- --------------------------------------------------------

--
-- Table structure for table `contact_and_morph`
--

CREATE TABLE `contact_and_morph` (
  `contact_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `contact_date` date NOT NULL,
  `contact_time` varchar(20) DEFAULT NULL,
  `lat` varchar(20) NOT NULL,
  `longi` varchar(20) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `field_recorded_by` varchar(5) NOT NULL,
  `gravid` varchar(5) DEFAULT NULL,
  `diseased` varchar(5) DEFAULT NULL,
  `data_entry_by` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_and_morph`
--

INSERT INTO `contact_and_morph` (`contact_id`, `animal_id`, `type_id`, `contact_date`, `contact_time`, `lat`, `longi`, `location`, `notes`, `field_recorded_by`, `gravid`, `diseased`, `data_entry_by`) VALUES
(2, 5, 1, '2011-03-16', '7 am - 10 am', '', '', 'RAINFST', '', 'CF', 'FALSE', 'FALSE', ''),
(3, 6, 2, '2011-03-18', '7 am - 10 am', '767', '139', 'SPEC', '', 'CF', 'FALSE', 'FALSE', ''),
(4, 6, 2, '2011-03-24', '7 am - 10 am', '736', '135', '', '', 'CF', 'FALSE', 'FALSE', ''),
(7, 7, 2, '2011-03-18', '7 am - 10 am', '767', '139', 'SPEC', '', 'CF', 'FALSE', 'FALSE', ''),
(13, 10, 2, '2011-04-05', '10 am - 1 pm', '788', '173', 'SPEC', '', 'CF', 'FALSE', 'FALSE', ''),
(15, 11, 2, '2011-03-14', '7 am - 10 am', '776', '152', '', '', 'CF', 'FALSE', 'FALSE', ''),
(22, 11, 2, '2011-04-13', '1 pm - 3 pm', '782', '140', '', '', 'CF', 'FALSE', 'FALSE', ''),
(29, 14, 2, '2011-03-28', '7 am - 10 am', '722', '043', 'RAINFST', '', 'CF', 'FALSE', 'FALSE', ''),
(233, 1, 2, '2011-03-21', '7 am - 10 am', '785', '136', 'SPEC', '', 'CF', 'FALSE', 'FALSE', ''),
(897, 2, 1, '2011-03-16', '7 am - 10 am', '747', '148', 'BROMS', '', 'CF', 'FALSE', 'FALSE', ''),
(898, 4, 1, '2011-03-16', '7 am - 10 am', '762', '155', 'BROMS', '', 'CF', 'FALSE', 'FALSE', ''),
(3914, 9, 2, '2013-01-23', '7 am - 10 am', '756', '133', 'SPEC', '', 'HM', 'FALSE', 'FALSE', 'RG'),
(9660, 5, 2, '2014-10-13', '7 am - 10 am', '730', '043', 'RAINFST', '', 'DN', 'FALSE', 'FALSE', 'KS');

-- --------------------------------------------------------

--
-- Table structure for table `contact_photos`
--

CREATE TABLE `contact_photos` (
  `cp_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_photos`
--

INSERT INTO `contact_photos` (`cp_id`, `contact_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 7),
(5, 13),
(6, 15),
(7, 22),
(8, 29),
(9, 233),
(10, 897),
(11, 898),
(12, 3914),
(13, 9660);

-- --------------------------------------------------------

--
-- Table structure for table `individuals`
--

CREATE TABLE `individuals` (
  `id` int(11) NOT NULL,
  `animal_name` varchar(55) NOT NULL,
  `photo` varchar(5) DEFAULT NULL,
  `profile` varchar(5) DEFAULT NULL,
  `photo_locaiton` varchar(2) DEFAULT NULL,
  `original_id_by` varchar(4) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `well` varchar(255) DEFAULT NULL,
  `notes` varchar(500) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `general_location` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `individuals`
--

INSERT INTO `individuals` (`id`, `animal_name`, `photo`, `profile`, `photo_locaiton`, `original_id_by`, `sex`, `well`, `notes`, `age`, `general_location`) VALUES
(1, 'Acer', 'FALSE', 'L & R', '2', 'UQ', 'M', 'G10', 'Scar on tail base behind left hind leg.', 'Adult', 'SPEC'),
(2, 'Admiral', 'TRUE', 'R', '2', 'UQ', 'M', 'H10', '', 'Adult', 'BROMS'),
(3, 'Ajax', 'TRUE', 'R', '1', 'UQ', 'M', 'F9-C12', '', 'Adult', 'RAINFST'),
(4, 'Adrian', 'TRUE', 'L & R', '2', 'CF', 'M', 'A11', '', 'Adult', 'BROMS'),
(5, 'Aladdin', 'TRUE', 'L & R', '1', 'UQ', 'F', 'B11', '', 'Juvenile', 'RAINFST'),
(6, 'Albert', 'TRUE', 'L & R', '2', 'UQ', 'M', '', '', 'Adult', 'SPEC'),
(7, 'Alfred', 'TRUE', 'L', '2', 'UQ', 'M', '', '', 'Adult', 'SPEC'),
(9, 'Amigo', 'TRUE', 'R', '1', 'UQ', 'M', 'D10', '', 'Adult', 'RAINFST'),
(10, 'Amy', 'TRUE', 'L', '2', 'UQ', 'F', '', '', 'Adult', 'SPEC'),
(11, 'Andy', 'TRUE', 'L & R', '2', 'UQ', 'M', 'A9', 'Missing an ear', 'Adult', 'SPEC'),
(13, 'Angie', 'TRUE', 'L & R', '1', 'UQ', 'F', 'B12', '', 'Adult', 'RAINFST'),
(14, 'Angus', 'TRUE', 'R', '1', 'UQ', 'M', 'E10', 'Not enough sample left to genotype', 'Adult', 'RAINFST');

-- --------------------------------------------------------

--
-- Table structure for table `morphology`
--

CREATE TABLE `morphology` (
  `morphology_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `tail` varchar(5) DEFAULT NULL,
  `blood` varchar(5) DEFAULT NULL,
  `skin` varchar(5) DEFAULT NULL,
  `faces` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `morphology`
--

INSERT INTO `morphology` (`morphology_id`, `animal_id`, `tail`, `blood`, `skin`, `faces`) VALUES
(1, 1, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(2, 2, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(3, 3, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(4, 4, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(5, 5, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(6, 6, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(7, 7, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(8, 9, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(9, 10, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(10, 11, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(11, 13, 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(12, 14, 'FALSE', 'FALSE', 'FALSE', 'FALSE');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `photo_id_by` varchar(4) NOT NULL,
  `photo` int(10) DEFAULT NULL,
  `i3s_match` int(50) DEFAULT NULL,
  `i3s_manta_score` decimal(8,5) DEFAULT NULL,
  `photo_quality` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`photo_id`, `cp_id`, `photo_id_by`, `photo`, `i3s_match`, `i3s_manta_score`, `photo_quality`) VALUES
(3, 12, 'RG', 6986, 15, '1.21800', 'POOR'),
(4, 13, 'KS', 0, 0, '0.00000', '');

-- --------------------------------------------------------

--
-- Table structure for table `sightings`
--

CREATE TABLE `sightings` (
  `sight_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `dominance` varchar(5) DEFAULT NULL,
  `hb` varchar(5) DEFAULT NULL,
  `aw` varchar(5) DEFAULT NULL,
  `ts` varchar(5) DEFAULT NULL,
  `ch` varchar(5) DEFAULT NULL,
  `f` varchar(5) DEFAULT NULL,
  `e` varchar(5) DEFAULT NULL,
  `hb_fast` varchar(5) DEFAULT NULL,
  `hb_slow` varchar(5) DEFAULT NULL,
  `aw_left` varchar(5) DEFAULT NULL,
  `aw_right` varchar(5) DEFAULT NULL,
  `f_contact` varchar(5) DEFAULT NULL,
  `f_non_contact` varchar(5) DEFAULT NULL,
  `n` varchar(5) DEFAULT NULL,
  `l` varchar(5) DEFAULT NULL,
  `body_temp` varchar(5) DEFAULT NULL,
  `t` varchar(5) DEFAULT NULL,
  `r` varchar(5) DEFAULT NULL,
  `dewlap` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sightings`
--

INSERT INTO `sightings` (`sight_id`, `contact_id`, `dominance`, `hb`, `aw`, `ts`, `ch`, `f`, `e`, `hb_fast`, `hb_slow`, `aw_left`, `aw_right`, `f_contact`, `f_non_contact`, `n`, `l`, `body_temp`, `t`, `r`, `dewlap`) VALUES
(1, 3, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(2, 4, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(3, 7, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(4, 13, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(5, 15, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(6, 22, 'TRUE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(7, 233, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(8, 3914, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE'),
(9, 9660, 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE', 'FALSE');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `pit_tag` int(10) DEFAULT NULL,
  `date_tagged` date DEFAULT NULL,
  `tag30by9` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `animal_id`, `pit_tag`, `date_tagged`, `tag30by9`) VALUES
(1, 1, 0, '0000-00-00', ''),
(2, 2, 2298306, '0000-00-00', ''),
(3, 3, 3174266, '0000-00-00', ''),
(4, 4, 2298370, '0000-00-00', ''),
(5, 5, 2298336, '0000-00-00', ''),
(6, 6, 2293279, '2013-03-20', ''),
(7, 7, 0, '0000-00-00', ''),
(8, 9, 3180604, '0000-00-00', ''),
(9, 10, 0, '0000-00-00', ''),
(10, 11, 3185785, '0000-00-00', ''),
(11, 13, 2298390, '0000-00-00', ''),
(12, 14, 3176165, '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  `dna` varchar(5) DEFAULT NULL,
  `sample` varchar(10) DEFAULT NULL,
  `cu_sample` varchar(50) DEFAULT NULL,
  `dna_plate` int(3) DEFAULT NULL,
  `date_dna_taken` date DEFAULT NULL,
  `genotyped` varchar(5) DEFAULT NULL,
  `date_genotyped` date DEFAULT NULL,
  `genotype_sample_no` varchar(5) DEFAULT NULL,
  `extracted` varchar(5) NOT NULL,
  `date_extracted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `animal_id`, `dna`, `sample`, `cu_sample`, `dna_plate`, `date_dna_taken`, `genotyped`, `date_genotyped`, `genotype_sample_no`, `extracted`, `date_extracted`) VALUES
(1, 1, 'TRUE', '114', '', 2, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(2, 2, 'TRUE', '115', '', 2, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(3, 3, 'TRUE', '66', 'AA60357/358', 1, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(4, 4, 'TRUE', '116', '', 2, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(5, 5, 'TRUE', '117', '', 2, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(6, 6, 'TRUE', '237', '', 0, '2013-03-20', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(7, 7, 'FALSE', '', '', 0, '0000-00-00', 'FALSE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(8, 9, 'TRUE', '72', 'AA60369/370', 1, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(9, 10, 'FALSE', '', '', 0, '0000-00-00', 'FALSE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(10, 11, 'TRUE', '62', 'AA60349/350', 1, '0000-00-00', 'FALSE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(11, 13, 'TRUE', '126', '', 2, '0000-00-00', 'TRUE', '0000-00-00', '', 'FALSE', '0000-00-00'),
(12, 14, 'TRUE', '73', 'AA60371/372', 1, '0000-00-00', 'FALSE', '0000-00-00', '', 'FALSE', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`type_id`, `name`) VALUES
(1, 'Catches'),
(2, 'Sightings');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `initials` varchar(4) NOT NULL,
  `super_user` varchar(3) NOT NULL,
  `active` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `initials`, `super_user`, `active`) VALUES
('Bethan Littleford', 'BL', 'NO', 'NO'),
('Celine Frere', 'CF', 'YES', 'YES'),
('Carme Piza Roca', 'CP', 'NO', 'NO'),
('Dan Nugent', 'DN', 'NO', 'NO'),
('Eric Doran', 'ED', 'NO', 'NO'),
('Evie P', 'EP', 'NO', 'NO'),
('Harry McDonald', 'HM', 'NO', 'NO'),
('Kasha Strickland', 'KS', 'NO', 'YES'),
('Nicola Kent', 'NK', 'NO', 'YES'),
('Nicola Peterson', 'NP', 'NO', 'NO'),
('Riana Gardiner', 'RG', 'NO', 'YES'),
('Sarah Ball', 'SB', 'NO', 'YES'),
('Sinta Frere', 'SF', 'YES', 'YES'),
('University Qld Stude', 'UQ', 'NO', 'NO'),
('Volunteer', 'V', 'NO', 'YES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catches`
--
ALTER TABLE `catches`
  ADD PRIMARY KEY (`catch_id`),
  ADD KEY `fk_catch_contact_id` (`contact_id`);

--
-- Indexes for table `contact_and_morph`
--
ALTER TABLE `contact_and_morph`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `fk_animal_id` (`animal_id`),
  ADD KEY `fk_type_id` (`type_id`),
  ADD KEY `fk_user` (`field_recorded_by`);

--
-- Indexes for table `contact_photos`
--
ALTER TABLE `contact_photos`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `fk_contact_id` (`contact_id`);

--
-- Indexes for table `individuals`
--
ALTER TABLE `individuals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_individual` (`animal_name`);

--
-- Indexes for table `morphology`
--
ALTER TABLE `morphology`
  ADD PRIMARY KEY (`morphology_id`),
  ADD KEY `fk_individual_morphology` (`animal_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photo_id`),
  ADD KEY `fk_cp_id` (`cp_id`),
  ADD KEY `fk_photo_user` (`photo_id_by`);

--
-- Indexes for table `sightings`
--
ALTER TABLE `sightings`
  ADD PRIMARY KEY (`sight_id`),
  ADD KEY `fk_sight_contact_id` (`contact_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `fk_individual_tag` (`animal_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `fk_individual_test` (`animal_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`initials`),
  ADD UNIQUE KEY `u_users` (`initials`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catches`
--
ALTER TABLE `catches`
  MODIFY `catch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_photos`
--
ALTER TABLE `contact_photos`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `morphology`
--
ALTER TABLE `morphology`
  MODIFY `morphology_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sightings`
--
ALTER TABLE `sightings`
  MODIFY `sight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catches`
--
ALTER TABLE `catches`
  ADD CONSTRAINT `fk_catch_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contact_and_morph` (`contact_id`);

--
-- Constraints for table `contact_and_morph`
--
ALTER TABLE `contact_and_morph`
  ADD CONSTRAINT `fk_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `individuals` (`id`),
  ADD CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`type_id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`field_recorded_by`) REFERENCES `users` (`initials`);

--
-- Constraints for table `contact_photos`
--
ALTER TABLE `contact_photos`
  ADD CONSTRAINT `fk_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contact_and_morph` (`contact_id`);

--
-- Constraints for table `morphology`
--
ALTER TABLE `morphology`
  ADD CONSTRAINT `fk_individual_morphology` FOREIGN KEY (`animal_id`) REFERENCES `individuals` (`id`);

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `fk_cp_id` FOREIGN KEY (`cp_id`) REFERENCES `contact_photos` (`cp_id`),
  ADD CONSTRAINT `fk_photo_user` FOREIGN KEY (`photo_id_by`) REFERENCES `users` (`initials`);

--
-- Constraints for table `sightings`
--
ALTER TABLE `sightings`
  ADD CONSTRAINT `fk_sight_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `contact_and_morph` (`contact_id`);

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_individual_tag` FOREIGN KEY (`animal_id`) REFERENCES `individuals` (`id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk_individual_test` FOREIGN KEY (`animal_id`) REFERENCES `individuals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
