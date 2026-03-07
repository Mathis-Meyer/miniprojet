-- Données de base pour le projet Pharmacie
-- Le fichier est chargé au démarrage de l'application (Profil PostgreSQL)

-- Insertion des catégories de médicaments
INSERT INTO CATEGORIE (CODE, LIBELLE, DESCRIPTION) VALUES
(1, 'Antalgiques et Antipyrétiques', 'Médicaments contre la douleur et la fièvre'),
(2, 'Anti-inflammatoires', 'Médicaments réduisant l''inflammation'),
(3, 'Antibiotiques', 'Médicaments pour traiter les infections bactériennes'),
(4, 'Antihypertenseurs', 'Médicaments pour traiter l''hypertension artérielle'),
(5, 'Antidiabétiques', 'Médicaments pour traiter le diabète'),
(6, 'Antihistaminiques', 'Médicaments pour traiter les allergies'),
(7, 'Vitamines et Compléments', 'Suppléments nutritionnels'),
(8, 'Médicaments Cardiovasculaires', 'Médicaments pour le cœur et la circulation'),
(9, 'Médicaments Gastro-intestinaux', 'Médicaments pour les troubles digestifs'),
(10, 'Médicaments Respiratoires', 'Médicaments pour les troubles respiratoires');

-- CORRECTION POUR POSTGRESQL : On utilise SEQUENCE
ALTER SEQUENCE categorie_code_seq RESTART WITH 11;

-- Catégorie 1: Antalgiques et Antipyrétiques
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Paracétamol 500mg', 1, 'Boîte de 16 comprimés', 2.50, 50, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Paracetamol_500mg_pills.jpg/800px-Paracetamol_500mg_pills.jpg'),
('Paracétamol 1000mg', 1, 'Boîte de 8 comprimés', 3.20, 30, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ibuprofène 200mg', 1, 'Boîte de 20 comprimés', 3.80, 400, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Ibuprofen_200mg.jpg/800px-Ibuprofen_200mg.jpg'),
('Ibuprofène 400mg', 1, 'Boîte de 12 comprimés', 4.50, 320, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Aspirine 500mg', 1, 'Boîte de 20 comprimés', 2.90, 450, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Aspirin-Bayer.jpg/800px-Aspirin-Bayer.jpg'),
('Codéine 30mg', 1, 'Boîte de 16 comprimés', 8.90, 150, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Tramadol 50mg', 1, 'Boîte de 20 gélules', 12.50, 180, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Morphine 10mg', 1, 'Boîte de 14 comprimés', 25.80, 80, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Doliprane Effervescent 1g', 1, 'Boîte de 8 comprimés', 3.50, 280, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Doliprane_1000_mg_boite.jpg/800px-Doliprane_1000_mg_boite.jpg'),
('Efferalgan Vitamine C', 1, 'Boîte de 16 comprimés', 4.20, 220, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Efferalgan_1000mg.jpg/800px-Efferalgan_1000mg.jpg');

-- Catégorie 2 à 10 (Images types Wikipedia pour éviter Unsplash)
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Diclofénac 50mg', 2, 'Boîte de 20 comprimés', 5.60, 300, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Kétoprofène 100mg', 2, 'Boîte de 12 gélules', 6.80, 250, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Amoxicilline 500mg', 3, 'Boîte de 12 gélules', 5.90, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Amlodipine 5mg', 4, 'Boîte de 30 comprimés', 4.80, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Metformine 500mg', 5, 'Boîte de 60 comprimés', 3.50, 500, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Cétirizine 10mg', 6, 'Boîte de 15 comprimés', 3.80, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Vitamine C 1000mg', 7, 'Boîte de 30 comprimés', 5.90, 500, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Atorvastatine 20mg', 8, 'Boîte de 30 comprimés', 12.50, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Oméprazole 20mg', 9, 'Boîte de 14 gélules', 3.80, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Salbutamol Spray', 10, 'Spray de 200 doses', 6.50, 300, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Asthma_inhaler.jpg/800px-Asthma_inhaler.jpg');

-- Insertion des dispensaires
INSERT INTO DISPENSAIRE (CODE, NOM, CONTACT, FONCTION, ADRESSE, CODE_POSTAL, VILLE, REGION, PAYS, TELEPHONE, FAX) VALUES
('DSP01', 'Dispensaire Central Dakar', 'Dr. Amadou Diop', 'Directeur', '15 Avenue Léopold Sédar Senghor', '10200', 'Dakar', 'Dakar', 'Sénégal', '+221-33-821-5555', '+221-33-821-5556'),
('DSP02', 'Dispensaire Saint-Louis', 'Dr. Fatou Sall', 'Chef de Service', '42 Rue de la République', '32000', 'Saint-Louis', 'Saint-Louis', 'Sénégal', '+221-33-961-2345', '+221-33-961-2346');

-- Insertion des commandes
INSERT INTO COMMANDE (NUMERO, SAISIELE, ENVOYEELE, DISPENSAIRE_CODE, PORT, REMISE, DESTINATAIRE, ADRESSE, CODE_POSTAL, VILLE, REGION, PAYS) VALUES
(1, '2024-01-15', '2024-01-18', 'DSP01', 15.00, 5.00, 'Dispensaire Central Dakar', '15 Avenue Léopold Sédar Senghor', '10200', 'Dakar', 'Dakar', 'Sénégal');

-- CORRECTION POUR POSTGRESQL : On utilise SEQUENCE
ALTER SEQUENCE commande_numero_seq RESTART WITH 2;

-- Insertion des lignes de commande
INSERT INTO LIGNE (COMMANDE_NUMERO, MEDICAMENT_REFERENCE, QUANTITE) VALUES
(1, 1, 100);

-- AJOUT DES FOURNISSEURS
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (1, 'Pfizer', 'senebrous.senebrous+pfizer@gmail.com');
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (2, 'Sanofi', 'senebrous.senebrous+sanofi@gmail.com');
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (3, 'Bayer', 'senebrous.senebrous+bayer@gmail.com');

-- CORRECTION POUR POSTGRESQL : On utilise SEQUENCE
ALTER SEQUENCE fournisseur_id_seq RESTART WITH 4;

-- Liaison Fournisseurs <-> Catégories
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 1), (2, 1), (2, 2), (3, 2), (1, 3), (3, 3), (1, 4), (1, 5), (1, 6), (2, 4), (2, 5), (2, 7), (2, 8), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (1, 9), (1, 10);