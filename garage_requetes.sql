-- -- -- -- -- -- -- -- -- -- -- -- --
-- BDD solo
-- -- -- -- -- -- -- -- -- -- -- -- --

-- Afficher les articles comme montré dans les consignes
SELECT stock.s_reference, article.a_designation, marque_article.b_nom, marque_voiture.mv_nom, equipe.eq_quantite, modele.m_nom, energie.e_nom
FROM modele
LEFT OUTER JOIN alimente ON modele.m_id = alimente.m_id
LEFT OUTER JOIN energie ON alimente.e_id = energie.e_id
LEFT OUTER JOIN marque_voiture ON modele.mv_id = marque_voiture.mv_id
LEFT OUTER JOIN equipe ON equipe.m_id = modele.m_id
LEFT OUTER JOIN stock ON equipe.s_id = stock.s_id
LEFT OUTER JOIN marque_article ON stock.b_id = marque_article.b_id
LEFT OUTER JOIN article ON stock.a_id = article.a_id;

-- Màj quantité en stock
UPDATE equipe
SET eq_quantite = eq_quantite - 1
WHERE s_id = 1;

UPDATE equipe
SET eq_quantite = eq_quantite - 2
WHERE s_id = 3;

-- Calculer le total de la main d'oeuvre et le mettre dans la facture
UPDATE factures
INNER JOIN ordre_reparation ON factures.f_id = ordre_reparation.f_id
SET f_total_main_doeuvre = ro_temps_reparation * f_tx_horaire
WHERE factures.f_id = 1;

UPDATE factures
INNER JOIN ordre_reparation ON factures.f_id = ordre_reparation.f_id
SET f_total_main_doeuvre = ro_temps_reparation * f_tx_horaire
WHERE factures.f_id = 2;

-- Calculer le montant total de la facture
UPDATE factures
INNER JOIN ordre_reparation ON ordre_reparation.f_id = factures.f_id
INNER JOIN utilise ON utilise.ro_numero = ordre_reparation.ro_numero
INNER JOIN stock ON stock.s_id = utilise.s_id
SET f_montant_total = f_total_main_doeuvre + (utilise.u_quantite_utilisee * stock.s_prix_unitaire)
WHERE factures.f_id = 1;

UPDATE factures
INNER JOIN ordre_reparation ON ordre_reparation.f_id = factures.f_id
INNER JOIN utilise ON utilise.ro_numero = ordre_reparation.ro_numero
INNER JOIN stock ON stock.s_id = utilise.s_id
SET f_montant_total = f_total_main_doeuvre + (utilise.u_quantite_utilisee * stock.s_prix_unitaire)
WHERE factures.f_id = 2;

-- Calculer le montant total de toutes les factures
SELECT f_id, SUM(f_montant_total) AS montant_total
FROM factures
GROUP BY f_id

-- Calculer le montant total des factures par client
SELECT c_nom, f_montant_total
FROM client
INNER JOIN ordre_reparation ON ordre_reparation.v_id = voiture.v_id
INNER JOIN factures ON factures.f_id = ordre_reparation.f_id
GROUP BY client.c_id

-- Calculer la somme des quantités utilisées
SELECT s_reference, eq_quantite AS quantite_en_stock, SUM(u_quantite_utilisee)
FROM stock
INNER JOIN utilise ON utilise.s_id = stock.s_id
INNER JOIN equipe ON equipe.s_id = stock.s_id
GROUP BY utilise.s_id

-- Quantités des articles en stock
SELECT s_reference AS reference, a_designation AS designation, b_nom AS marque, SUM(eq_quantite) AS quantite
FROM article
INNER JOIN stock ON article.a_id = stock.a_id
INNER JOIN marque_article ON stock.b_id = marque_article.b_id
INNER JOIN equipe ON equipe.s_id = stock.s_id
GROUP BY s_reference;

-- Quantité des articles utilisés
SELECT s_reference AS reference, a_designation AS designation, b_nom AS marque, SUM(utilise.u_quantite_utilisee) AS quantite_utilisee
FROM article
INNER JOIN stock ON article.a_id = stock.a_id
INNER JOIN marque_article ON stock.b_id = marque_article.b_id
INNER JOIN utilise ON utilise.s_id = stock.s_id
GROUP BY s_reference;

-- Moyenne des prix des filtres par référence
SELECT article.a_designation, stock.s_reference, AVG(stock.s_prix_unitaire) AS moyenne_prix
FROM article
INNER JOIN stock ON article.a_id = stock.a_id
WHERE article.a_designation LIKE 'Filtre%'
GROUP BY stock.s_reference

-- Moyenne des prix des filtres par marque
SELECT article.a_designation, marque_article.b_nom, AVG(stock.s_prix_unitaire) AS moyenne_prix 
FROM article 
INNER JOIN stock ON article.a_id = stock.a_id 
INNER JOIN marque_article ON marque_article.b_id = stock.b_id 
WHERE article.a_designation LIKE 'Filtre%' 
GROUP BY marque_article.b_id; 

-- Moyenne des prix des filtres par référence en utilisant les ID
SELECT article.a_designation, stock.s_reference, AVG(stock.s_prix_unitaire) AS moyenne_prix
FROM article
INNER JOIN stock ON article.a_id = stock.a_id
WHERE article.a_id IN (1, 2, 3)
GROUP BY stock.s_reference

-- Moyenne des prix des filtres par marque en utilisant les ID
SELECT article.a_designation, marque_article.b_nom, AVG(stock.s_prix_unitaire) AS moyenne_prix 
FROM article 
INNER JOIN stock ON article.a_id = stock.a_id 
INNER JOIN marque_article ON marque_article.b_id = stock.b_id 
WHERE article.a_id IN (1, 2, 3)
GROUP BY marque_article.b_id;

-- -- -- -- -- -- -- -- -- -- -- -- --
-- Requêtes pour le travail en groupe
-- -- -- -- -- -- -- -- -- -- -- -- --

-- articles et références
SELECT a_ref, a_quantite
FROM g_article;

-- quantités par référence
SELECT a_ref, a_quantite FROM g_article GROUP BY a_ref; 

-- quantités par marques
SELECT a_marque, SUM(a_quantite)
FROM g_article
WHERE a_designation LIKE 'Filtre%'
GROUP BY a_marque;

-- quantité totale des articles
SELECT SUM(a_quantite) AS quantite_totale
FROM g_article;

-- moyenne des prix par référence
SELECT a_ref, AVG(g_article.a_prix) AS moyenne
FROM g_article
GROUP BY a_ref

-- moyenne des prix par marque
SELECT a_marque, AVG(g_article.a_prix) AS moyenne
FROM g_article
GROUP BY a_marque

-- moyenne des prix des filtres par référence
SELECT a_ref, AVG(g_article.a_prix) AS moyenne
FROM g_article
WHERE a_type LIKE 'Filtre%'
GROUP BY a_ref

-- moyenne des prix des filtres par marque
SELECT a_marque, AVG(g_article.a_prix) AS moyenne
FROM g_article
WHERE a_type LIKE 'Filtre%'
GROUP BY a_marque