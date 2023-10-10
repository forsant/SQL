-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 10 oct. 2023 à 17:48
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
-- Base de données : `journal`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `ID_ARTICLE` int NOT NULL,
  `CONTENU` varchar(50) NOT NULL,
  `ID_SUJET` int NOT NULL,
  `ID_JOURNALISTE` int NOT NULL,
  PRIMARY KEY (`ID_ARTICLE`),
  KEY `ID_SUJET` (`ID_SUJET`),
  KEY `ID_JOURNALISTE` (`ID_JOURNALISTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`ID_ARTICLE`, `CONTENU`, `ID_SUJET`, `ID_JOURNALISTE`) VALUES
(1, 'POUR TOUS', 1, 2),
(2, 'POUR SORTIR', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `a_tavailler_pour`
--

DROP TABLE IF EXISTS `a_tavailler_pour`;
CREATE TABLE IF NOT EXISTS `a_tavailler_pour` (
  `ID_JOURNALISTE` int NOT NULL,
  `ID_JOURNAL` int NOT NULL,
  KEY `ID_JOURNALISTE` (`ID_JOURNALISTE`),
  KEY `ID_JOURNAL` (`ID_JOURNAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `interview`
--

DROP TABLE IF EXISTS `interview`;
CREATE TABLE IF NOT EXISTS `interview` (
  `ID_JOURNALISTE` int NOT NULL,
  `ID_PERSONNALITE` int NOT NULL,
  KEY `ID_JOURNALISTE` (`ID_JOURNALISTE`),
  KEY `ID_PERONNALITE` (`ID_PERSONNALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

DROP TABLE IF EXISTS `journal`;
CREATE TABLE IF NOT EXISTS `journal` (
  `ID_JOURNAL` int NOT NULL,
  `TITRE` varchar(50) NOT NULL,
  `ADRESSE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_JOURNAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `journal`
--

INSERT INTO `journal` (`ID_JOURNAL`, `TITRE`, `ADRESSE`) VALUES
(1, 'LE SPORT', 'ORLEANS'),
(2, 'LA NATURE', 'SULLY-SUR-LOIRE');

-- --------------------------------------------------------

--
-- Structure de la table `journaliste`
--

DROP TABLE IF EXISTS `journaliste`;
CREATE TABLE IF NOT EXISTS `journaliste` (
  `ID_JOURNALISTE` int NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `DATE_NAISSANCE` date NOT NULL,
  PRIMARY KEY (`ID_JOURNALISTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `journaliste`
--

INSERT INTO `journaliste` (`ID_JOURNALISTE`, `NOM`, `DATE_NAISSANCE`) VALUES
(1, 'DUPONT', '1993-01-23'),
(2, 'MARCEL', '1998-10-13');

-- --------------------------------------------------------

--
-- Structure de la table `numero`
--

DROP TABLE IF EXISTS `numero`;
CREATE TABLE IF NOT EXISTS `numero` (
  `ID_NUMERO` int NOT NULL,
  `DATE_NUMERO` date NOT NULL,
  PRIMARY KEY (`ID_NUMERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `numero`
--

INSERT INTO `numero` (`ID_NUMERO`, `DATE_NUMERO`) VALUES
(1, '2023-10-02'),
(2, '2023-10-06');

-- --------------------------------------------------------

--
-- Structure de la table `parait_dans`
--

DROP TABLE IF EXISTS `parait_dans`;
CREATE TABLE IF NOT EXISTS `parait_dans` (
  `ID_NUMERO` int NOT NULL,
  `ID_ARTICLE` int NOT NULL,
  KEY `ID_NUMERO` (`ID_NUMERO`),
  KEY `ID_ARTICLE` (`ID_ARTICLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personnalite`
--

DROP TABLE IF EXISTS `personnalite`;
CREATE TABLE IF NOT EXISTS `personnalite` (
  `ID_PERSONALITE` int NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `NATION` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_PERSONALITE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `personnalite`
--

INSERT INTO `personnalite` (`ID_PERSONALITE`, `NOM`, `PRENOM`, `NATION`) VALUES
(1, 'DACOSTA', 'VALERIE', 'FRANCE'),
(2, 'PICHON', 'MAURICE', 'ANGLETERRE');

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

DROP TABLE IF EXISTS `sujet`;
CREATE TABLE IF NOT EXISTS `sujet` (
  `ID_SUJET` int NOT NULL,
  `LIBELLE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_SUJET`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sujet`
--

INSERT INTO `sujet` (`ID_SUJET`, `LIBELLE`) VALUES
(1, 'LE BIEN ETRE'),
(2, 'LES SORTIES DU DIMANCHE');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `ID_JOURNALISTE` FOREIGN KEY (`ID_JOURNALISTE`) REFERENCES `journaliste` (`ID_JOURNALISTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_SUJET` FOREIGN KEY (`ID_SUJET`) REFERENCES `sujet` (`ID_SUJET`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `a_tavailler_pour`
--
ALTER TABLE `a_tavailler_pour`
  ADD CONSTRAINT `ID_JOURNAL` FOREIGN KEY (`ID_JOURNAL`) REFERENCES `journal` (`ID_JOURNAL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_JOURNALISTE##` FOREIGN KEY (`ID_JOURNALISTE`) REFERENCES `journaliste` (`ID_JOURNALISTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `interview`
--
ALTER TABLE `interview`
  ADD CONSTRAINT `ID_JOURNALISTE#` FOREIGN KEY (`ID_JOURNALISTE`) REFERENCES `journaliste` (`ID_JOURNALISTE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_PERSONNALITE` FOREIGN KEY (`ID_PERSONNALITE`) REFERENCES `personnalite` (`ID_PERSONALITE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `parait_dans`
--
ALTER TABLE `parait_dans`
  ADD CONSTRAINT `ID_ARTICLE` FOREIGN KEY (`ID_ARTICLE`) REFERENCES `article` (`ID_ARTICLE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ID_NUMERO` FOREIGN KEY (`ID_NUMERO`) REFERENCES `numero` (`ID_NUMERO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
