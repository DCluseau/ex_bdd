-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 nov. 2025 à 14:25
-- Version du serveur : 8.4.7
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `garage`
--

-- --------------------------------------------------------

--
-- Structure de la table `alimente`
--

DROP TABLE IF EXISTS `alimente`;
CREATE TABLE IF NOT EXISTS `alimente` (
  `m_id` int NOT NULL,
  `e_id` int NOT NULL,
  PRIMARY KEY (`m_id`,`e_id`),
  KEY `e_id` (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_designation` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `c_adresse` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_numero_telephone` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_plaque` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_nom` (`c_nom`),
  UNIQUE KEY `c_plaque` (`c_plaque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `energie`
--

DROP TABLE IF EXISTS `energie`;
CREATE TABLE IF NOT EXISTS `energie` (
  `e_id` int NOT NULL AUTO_INCREMENT,
  `e_nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE KEY `e_nom` (`e_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
CREATE TABLE IF NOT EXISTS `equipe` (
  `s_id` int NOT NULL,
  `m_id` int NOT NULL,
  `eq_quantite` int DEFAULT NULL,
  PRIMARY KEY (`s_id`,`m_id`),
  KEY `m_id` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE IF NOT EXISTS `factures` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_tx_horaire` decimal(6,2) DEFAULT NULL,
  `f_total_main_doeuvre` decimal(6,2) DEFAULT NULL,
  `f_montant_total` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque_article`
--

DROP TABLE IF EXISTS `marque_article`;
CREATE TABLE IF NOT EXISTS `marque_article` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `b_nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`b_id`),
  UNIQUE KEY `b_nom` (`b_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marque_voiture`
--

DROP TABLE IF EXISTS `marque_voiture`;
CREATE TABLE IF NOT EXISTS `marque_voiture` (
  `mv_id` int NOT NULL AUTO_INCREMENT,
  `mv_nom` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`mv_id`),
  UNIQUE KEY `mv_nom` (`mv_nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `modele`
--

DROP TABLE IF EXISTS `modele`;
CREATE TABLE IF NOT EXISTS `modele` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mv_id` int NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `mv_id` (`mv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ordre_reparation`
--

DROP TABLE IF EXISTS `ordre_reparation`;
CREATE TABLE IF NOT EXISTS `ordre_reparation` (
  `ro_numero` int NOT NULL AUTO_INCREMENT,
  `ro_temps_reparation` int DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  `v_id` int DEFAULT NULL,
  PRIMARY KEY (`ro_numero`),
  KEY `f_id` (`f_id`),
  KEY `v_id` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

DROP TABLE IF EXISTS `possede`;
CREATE TABLE IF NOT EXISTS `possede` (
  `c_id` int NOT NULL,
  `v_id` int NOT NULL,
  PRIMARY KEY (`c_id`,`v_id`),
  KEY `v_id` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_reference` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `s_prix_unitaire` decimal(19,2) NOT NULL DEFAULT '0.00',
  `b_id` int NOT NULL,
  `a_id` int NOT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `s_reference` (`s_reference`),
  KEY `b_id` (`b_id`),
  KEY `a_id` (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `utilise`
--

DROP TABLE IF EXISTS `utilise`;
CREATE TABLE IF NOT EXISTS `utilise` (
  `ro_numero` int NOT NULL,
  `s_id` int NOT NULL,
  `u_quantite_utilisee` int DEFAULT NULL,
  PRIMARY KEY (`ro_numero`,`s_id`),
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_annee` int DEFAULT NULL,
  `m_id` int NOT NULL,
  `c_id` int DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  UNIQUE KEY `c_id` (`c_id`),
  KEY `m_id` (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `alimente`
--
ALTER TABLE `alimente`
  ADD CONSTRAINT `alimente_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `modele` (`m_id`),
  ADD CONSTRAINT `alimente_ibfk_2` FOREIGN KEY (`e_id`) REFERENCES `energie` (`e_id`);

--
-- Contraintes pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD CONSTRAINT `equipe_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `stock` (`s_id`),
  ADD CONSTRAINT `equipe_ibfk_2` FOREIGN KEY (`m_id`) REFERENCES `modele` (`m_id`);

--
-- Contraintes pour la table `modele`
--
ALTER TABLE `modele`
  ADD CONSTRAINT `modele_ibfk_1` FOREIGN KEY (`mv_id`) REFERENCES `marque_voiture` (`mv_id`);

--
-- Contraintes pour la table `ordre_reparation`
--
ALTER TABLE `ordre_reparation`
  ADD CONSTRAINT `ordre_reparation_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `factures` (`f_id`),
  ADD CONSTRAINT `ordre_reparation_ibfk_3` FOREIGN KEY (`v_id`) REFERENCES `voiture` (`v_id`);

--
-- Contraintes pour la table `possede`
--
ALTER TABLE `possede`
  ADD CONSTRAINT `possede_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `client` (`c_id`),
  ADD CONSTRAINT `possede_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `voiture` (`v_id`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `marque_article` (`b_id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`a_id`) REFERENCES `article` (`a_id`);

--
-- Contraintes pour la table `utilise`
--
ALTER TABLE `utilise`
  ADD CONSTRAINT `utilise_ibfk_1` FOREIGN KEY (`ro_numero`) REFERENCES `ordre_reparation` (`ro_numero`),
  ADD CONSTRAINT `utilise_ibfk_2` FOREIGN KEY (`s_id`) REFERENCES `stock` (`s_id`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `modele` (`m_id`),
  ADD CONSTRAINT `voiture_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `client` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
