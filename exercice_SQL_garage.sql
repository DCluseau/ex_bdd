CREATE DATABASE IF NOT EXISTS garage;
	CREATE TABLE ARTICLE(
		article_id int(11) NOT NULL AUTO_INCREMENT,
		reference VARCHAR(20) NOT NULL,
		designation VARCHAR(30) NOT NULL,
		quantite int(5) NOT NULL DEFAULT 0,
		PRIMARY KEY(article_id)
		) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

	CREATE TABLE VOITURE(
		voiture_id int(11) PRIMARY KEY,
		marque VARCHAR(20) NOT NULL,
		type VARCHAR(20) NOT NULL,
		energie VARCHAR(20) NOT NULL,
		fk_article_id int(11) REFERENCES ARTICLE(article_id)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;