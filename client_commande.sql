-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 10 oct. 2023 à 18:27
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
-- Base de données : `client_commande`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `CODE_CATEGORIE` int NOT NULL,
  `DESIGNATION_CATEGORIE` varchar(50) NOT NULL,
  PRIMARY KEY (`CODE_CATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `CODE_CLIENT` int NOT NULL,
  `NOM_CLIENT` varchar(50) NOT NULL,
  `ADRESSE_CLIENT` varchar(50) NOT NULL,
  PRIMARY KEY (`CODE_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `NUM_COMMANDE` int NOT NULL,
  `DATE_COMMANDE` date NOT NULL,
  `CODE_FOURNISSEUR` int NOT NULL,
  `CODE_CLIENT` int NOT NULL,
  PRIMARY KEY (`NUM_COMMANDE`),
  KEY `CODE_FOURNISSEUR` (`CODE_FOURNISSEUR`),
  KEY `CODE_CLIENT` (`CODE_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `CODE_FOURNISSEUR` int NOT NULL,
  `NOM_FOURNISSEUR` varchar(50) NOT NULL,
  `ADRESSE_FOURNISSEUR` varchar(50) NOT NULL,
  PRIMARY KEY (`CODE_FOURNISSEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `porter_sur_qualite`
--

DROP TABLE IF EXISTS `porter_sur_qualite`;
CREATE TABLE IF NOT EXISTS `porter_sur_qualite` (
  `NUM_COMMANDE` int NOT NULL,
  `REF_PRODUIT` int NOT NULL,
  KEY `NUM_COMMANDE` (`NUM_COMMANDE`),
  KEY `REF_PRODUIT` (`REF_PRODUIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `REF_PRODUIT` int NOT NULL,
  `DESIGNATION_DU_PRODUIT` varchar(50) NOT NULL,
  `PRIX` double NOT NULL,
  `CODE_CATEGORIE` int NOT NULL,
  PRIMARY KEY (`REF_PRODUIT`),
  KEY `CODE_CATEGORIE` (`CODE_CATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `CODE_CLIENT` FOREIGN KEY (`CODE_CLIENT`) REFERENCES `client` (`CODE_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CODE_FOURNISSEUR` FOREIGN KEY (`CODE_FOURNISSEUR`) REFERENCES `fournisseur` (`CODE_FOURNISSEUR`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `porter_sur_qualite`
--
ALTER TABLE `porter_sur_qualite`
  ADD CONSTRAINT `NUM_COMMANDE` FOREIGN KEY (`NUM_COMMANDE`) REFERENCES `commande` (`NUM_COMMANDE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `REF_PRODUIT` FOREIGN KEY (`REF_PRODUIT`) REFERENCES `produit` (`REF_PRODUIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `CODE_CATEGORIE` FOREIGN KEY (`CODE_CATEGORIE`) REFERENCES `categorie` (`CODE_CATEGORIE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
