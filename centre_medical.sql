-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 05 oct. 2023 à 13:23
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `centre_medical`
--

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id_Consultation` int NOT NULL AUTO_INCREMENT,
  `Numero` int NOT NULL,
  `Date_consultation` date NOT NULL,
  `id_Patient` int NOT NULL,
  `id_Medecin` int NOT NULL,
  PRIMARY KEY (`id_Consultation`),
  KEY `id_Patient` (`id_Patient`),
  KEY `id_Medecin` (`id_Medecin`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id_Consultation`, `Numero`, `Date_consultation`, `id_Patient`, `id_Medecin`) VALUES
(1, 1, '2023-10-03', 1, 1),
(2, 2, '2023-10-04', 2, 1),
(3, 3, '2023-10-05', 3, 3),
(4, 4, '2023-10-17', 5, 3),
(5, 5, '2023-10-16', 4, 8),
(6, 6, '2023-10-11', 7, 5),
(7, 7, '2023-10-13', 6, 9),
(8, 8, '2023-10-08', 8, 7),
(9, 9, '2023-10-10', 9, 10),
(10, 10, '2023-10-02', 10, 6);

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `id_Medecin` int NOT NULL AUTO_INCREMENT,
  `Matricule` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Medecin`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medecin`
--

INSERT INTO `medecin` (`id_Medecin`, `Matricule`, `Nom`) VALUES
(1, 'MED1', 'DUPONT'),
(2, 'MED2', 'HELLION'),
(3, 'MED3', 'MARTIN'),
(4, 'MED4', 'BERNARD'),
(5, 'MED5', 'PETIT'),
(6, 'MED6', 'DUBOIS'),
(7, 'MED7', 'MOREAU'),
(8, 'MED8', 'SIMON'),
(9, 'MED9', 'LEROY'),
(10, 'MED10', 'FAURE');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
CREATE TABLE IF NOT EXISTS `medicament` (
  `id_Medicament` int NOT NULL AUTO_INCREMENT,
  `Code` int NOT NULL,
  `Libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Medicament`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id_Medicament`, `Code`, `Libelle`) VALUES
(1, 11, 'DOLIPRANE'),
(2, 12, 'SPASFON'),
(3, 13, 'VOLTARENE'),
(4, 14, 'ACUPAN'),
(5, 15, 'EFFERALGAN'),
(6, 16, 'IMODIUM'),
(7, 17, 'ANTARENE'),
(8, 88, 'ORELOX'),
(9, 99, 'INEXIUM'),
(10, 100, 'ADVIL');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id_Patient` int NOT NULL AUTO_INCREMENT,
  `Matricule` varchar(50) NOT NULL,
  `Numero_SS` int NOT NULL,
  `Nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Patient`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`id_Patient`, `Matricule`, `Numero_SS`, `Nom`) VALUES
(1, 'PAT1', 111111111, 'JADE'),
(2, 'PAT2', 222222222, 'EMMA'),
(3, 'PAT3', 333333333, 'LOUIS'),
(4, 'PAT4', 444444444, 'MIA'),
(5, 'PAT5', 555555555, 'HUGO'),
(6, 'PAT6', 666666666, 'JULES'),
(7, 'PAT7', 777777777, 'ARTHUR'),
(8, 'PAT8', 888888888, 'ROSE'),
(9, 'PAT9', 999999999, 'ALICE'),
(10, 'PAT10', 101010101, 'ADAM');

-- --------------------------------------------------------

--
-- Structure de la table `prescrit`
--

DROP TABLE IF EXISTS `prescrit`;
CREATE TABLE IF NOT EXISTS `prescrit` (
  `id_Medicament` int NOT NULL,
  `id_Consultation` int NOT NULL,
  `Nb_prises` decimal(5,1) NOT NULL,
  PRIMARY KEY (`id_Medicament`,`id_Consultation`),
  KEY `id_Consultation` (`id_Consultation`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `prescrit`
--

INSERT INTO `prescrit` (`id_Medicament`, `id_Consultation`, `Nb_prises`) VALUES
(1, 1, '5.0'),
(2, 2, '1.0'),
(3, 3, '3.0'),
(4, 4, '6.0'),
(5, 5, '2.5'),
(6, 6, '1.5'),
(7, 7, '1.0'),
(8, 8, '0.5'),
(9, 9, '8.0'),
(10, 10, '4.0');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
