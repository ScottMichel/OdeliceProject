-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 07 oct. 2019 à 16:09
-- Version du serveur :  10.1.30-MariaDB
-- Version de PHP :  7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `odelice`
DROP DATABASE IF EXISTS odelice;
CREATE DATABASE odelice DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `idcommentaire` int(10) UNSIGNED NOT NULL,
  `texte` text CHARACTER SET latin1 NOT NULL,
  `auteur` varchar(45) CHARACTER SET latin1 NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 NOT NULL,
  `note` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `idIngredient` int(10) UNSIGNED NOT NULL,
  `NomIngredient` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient_recette`
--

CREATE TABLE `ingredient_recette` (
  `idRecette` int(10) UNSIGNED NOT NULL,
  `Quantite` varchar(50) CHARACTER SET latin1 NOT NULL,
  `idIngredient` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `idRecette` int(10) UNSIGNED NOT NULL,
  `Titre` varchar(50) CHARACTER SET armscii8 NOT NULL,
  `Cuisson` varchar(50) CHARACTER SET armscii8 DEFAULT NULL,
  `Repos` varchar(50) CHARACTER SET armscii8 DEFAULT NULL,
  `Difficulté` varchar(50) CHARACTER SET armscii8 NOT NULL,
  `Image` varchar(255) CHARACTER SET armscii8 NOT NULL,
  `Preparation` text CHARACTER SET armscii8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `recette_tag`
--

CREATE TABLE `recette_tag` (
  `idRecette` int(10) UNSIGNED NOT NULL,
  `idTag` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `idTag` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `idTheme` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) CHARACTER SET latin1 NOT NULL,
  `famille` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `theme_recette`
--

CREATE TABLE `theme_recette` (
  `idTheme` int(10) UNSIGNED NOT NULL,
  `idRecette` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`idcommentaire`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`idIngredient`);

--
-- Index pour la table `ingredient_recette`
--
ALTER TABLE `ingredient_recette`
  ADD KEY `ingredientToRecette` (`idIngredient`),
  ADD KEY `recetteToIngredient` (`idRecette`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`idRecette`);

--
-- Index pour la table `recette_tag`
--
ALTER TABLE `recette_tag`
  ADD KEY `tagToRecette` (`idTag`),
  ADD KEY `recetteToTag` (`idRecette`);

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`idTag`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`idTheme`);

--
-- Index pour la table `theme_recette`
--
ALTER TABLE `theme_recette`
  ADD KEY `themeToRecette` (`idTheme`),
  ADD KEY `recetteToTheme` (`idRecette`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `idcommentaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `idIngredient` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `idRecette` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `idTag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `idTheme` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorieToRecette` FOREIGN KEY (`idCategorie`) REFERENCES `recette` (`idRecette`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaireToRecette` FOREIGN KEY (`idcommentaire`) REFERENCES `recette` (`idRecette`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ingredient_recette`
--
ALTER TABLE `ingredient_recette`
  ADD CONSTRAINT `ingredientToRecette` FOREIGN KEY (`idIngredient`) REFERENCES `ingredient` (`idIngredient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `recetteToIngredient` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `recette_tag`
--
ALTER TABLE `recette_tag`
  ADD CONSTRAINT `recetteToTag` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tagToRecette` FOREIGN KEY (`idTag`) REFERENCES `tag` (`idTag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `theme_recette`
--
ALTER TABLE `theme_recette`
  ADD CONSTRAINT `recetteToTheme` FOREIGN KEY (`idRecette`) REFERENCES `recette` (`idRecette`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `themeToRecette` FOREIGN KEY (`idTheme`) REFERENCES `theme` (`idTheme`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
