-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 nov. 2025 à 09:48
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

--
-- Déchargement des données de la table `alimente`
--

INSERT INTO `alimente` (`m_id`, `e_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(7, 1),
(2, 2),
(6, 2),
(8, 2);

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`a_id`, `a_designation`) VALUES
(1, 'Filtre à air'),
(2, 'Filtre pollen'),
(3, 'Filtre à huile');

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`c_id`, `c_nom`, `c_adresse`, `c_numero_telephone`, `c_plaque`) VALUES
(1, 'Luke Skywalker', '1 rue Yavinn 50240 Dagobah', '0591253485', 'EB-GHK-BV'),
(2, 'Dark Vador', '3 avenue de l\'étoile noire 90250 Tatouine', '0666925123', 'AM-IDA-LA');

--
-- Déchargement des données de la table `energie`
--

INSERT INTO `energie` (`e_id`, `e_nom`) VALUES
(2, 'DIESEL'),
(1, 'ESSENCE');

--
-- Déchargement des données de la table `equipe`
--

INSERT INTO `equipe` (`s_id`, `m_id`, `eq_quantite`) VALUES
(1, 1, 119),
(1, 3, 10),
(1, 5, 34),
(2, 2, 52),
(2, 4, 77),
(2, 7, 149),
(3, 6, 16),
(4, 8, 72);

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`f_id`, `f_tx_horaire`, `f_total_main_doeuvre`, `f_montant_total`) VALUES
(1, 50.00, 50.00, 70.00),
(2, 50.00, 100.00, 120.00);

--
-- Déchargement des données de la table `marque_article`
--

INSERT INTO `marque_article` (`b_id`, `b_nom`) VALUES
(2, 'BOSCH'),
(1, 'MAN FILTER');

--
-- Déchargement des données de la table `marque_voiture`
--

INSERT INTO `marque_voiture` (`mv_id`, `mv_nom`) VALUES
(5, 'CITROEN'),
(1, 'FIAT'),
(6, 'MERCEDES'),
(3, 'PEUGEOT'),
(4, 'RENAULT'),
(2, 'TOYOTA');

--
-- Déchargement des données de la table `modele`
--

INSERT INTO `modele` (`m_id`, `m_nom`, `mv_id`) VALUES
(1, '500', 1),
(2, 'YARIS', 2),
(3, '208', 3),
(4, 'CLIO', 4),
(5, 'C3', 5),
(6, '308', 3),
(7, 'MEGANE', 4),
(8, 'A180', 6);

--
-- Déchargement des données de la table `ordre_reparation`
--

INSERT INTO `ordre_reparation` (`ro_numero`, `ro_temps_reparation`, `f_id`, `v_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2);

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`s_id`, `s_reference`, `s_prix_unitaire`, `b_id`, `a_id`) VALUES
(1, '7CK215G', 20.00, 1, 1),
(2, 'Q9DREJ6', 25.00, 2, 2),
(3, 'W7FGJ2S', 10.00, 1, 3),
(4, 'DBAYMQE', 50.00, 2, 3);

--
-- Déchargement des données de la table `utilise`
--

INSERT INTO `utilise` (`ro_numero`, `s_id`, `u_quantite_utilisee`) VALUES
(1, 1, 1),
(2, 3, 2);

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`v_id`, `v_annee`, `m_id`, `c_id`) VALUES
(1, 1998, 7, 1),
(2, 1979, 2, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
