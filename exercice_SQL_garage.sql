CREATE DATABASE IF NOT EXISTS garage;
	CREATE TABLE article(
		article_id int(11) NOT NULL AUTO_INCREMENT,
		reference VARCHAR(20) NOT NULL,
		designation VARCHAR(30) NOT NULL,
		marque_article VARCHAR(25) NOT NULL,
		quantite int(5) NOT NULL DEFAULT 0,
		PRIMARY KEY(article_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

	CREATE TABLE voiture(
		voiture_id int(11) NOT NULL AUTO_INCREMENT,
		marque VARCHAR(20) NOT NULL,
		type VARCHAR(20) NOT NULL,
		energie VARCHAR(20) NOT NULL,
		fk_article_id int(11) REFERENCES article(article_id)
		PRIMARY KEY(voiture_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

	INSERT INTO article (article_id, reference, designation, marque_article, quantite)
	VALUES (NULL,'7CK215G', 'Filtre à air', 'MAN FILTER', 120),
	(NULL,'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 52),
	(NULL,'7CK215G', 'Filtre à air', 'MAN FILTER', 11),
	(NULL,'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 77),
	(NULL,'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 149),
	(NULL,'7CK215G', 'Filtre à air', 'MAN FILTER', 35),
	(NULL,'W7FGJ2S', 'Filtre à huile', 'MAN FILTER', 18),
	(NULL,'DBAYMQE', 'Filtre à huile', 'BOSCH', 72);

	INSERT INTO voiture (voiture_id, marque, type, energie, fk_article_id)
	VALUES (NULL, 'FIAT', '500', 'ESSENCE', 1),
	(NULL,'TOYOTA', 'YARIS', 'DIESEL', 2),
	(NULL,'PEUGEOT', '208', 'ESSENCE', 3),
	(NULL,'RENAULT', 'CLIO', 'ESSENCE', 4),
	(NULL,'RENAULT', 'MEGANE', 'ESSENCE', 5),
	(NULL,'CITROEN', 'C3', 'ESSENCE', 6),
	(NULL,'PEUGEOT', '308', 'DIESEL', 7),
	(NULL,'MERCEDES', 'A180', 'DIESEL', 8);

	SELECT reference, marque_article, energie
	FROM article
	INNER JOIN voiture ON article.article_id = voiture.fk_article_id;

	INSERT INTO article (article_id, reference, designation, marque_article, quantite)
	VALUES (NULL,'7CK215G', 'Filtre à air', 'MAN FILTER', 3),
	(NULL,'Q9DREJ6', 'Filtre à pollen', 'BOSCH', 666);

	SELECT reference, marque_article, energie
	FROM article
	LEFT JOIN voiture ON article.article_id = voiture.fk_article_id;

	SELECT reference, marque_article, energie
	FROM article
	RIGHT JOIN voiture ON article.article_id = voiture.fk_article_id;

	SELECT reference, designation, quantite, marque_article, type
	FROM article
	INNER JOIN voiture ON article.article_id = voiture.fk_article_id
	WHERE reference = '7CK215G';

	SELECT reference, designation, marque_article, type
	FROM article
	INNER JOIN voiture ON article.article_id = voiture.fk_article_id
	GROUP BY reference

	UPDATE article
	SET quantite = 1
	WHERE article_id = 1;

ALTER TABLE voiture  DROP FOREIGN KEY fk_article_id;

ALTER TABLE `voiture` ADD CONSTRAINT `article` FOREIGN KEY (`fk_article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE ON DELETE CASCADE;
 
 DELETE FROM article
 	WHERE article_id = 2