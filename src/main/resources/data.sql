-- Données de base pour le projet Pharmacie
-- Dispensaire (Etablissements de santé qui passent commande de médicaments)
-- Le fichier est chargé au démarrage de l''application

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
ALTER TABLE Categorie ALTER COLUMN code RESTART WITH 11;

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

-- Catégorie 2: Anti-inflammatoires
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Diclofénac 50mg', 2, 'Boîte de 20 comprimés', 5.60, 300, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Kétoprofène 100mg', 2, 'Boîte de 12 gélules', 6.80, 250, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Naproxène 550mg', 2, 'Boîte de 16 comprimés', 7.20, 200, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Célécoxib 200mg', 2, 'Boîte de 30 gélules', 15.90, 180, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Indométacine 25mg', 2, 'Boîte de 30 gélules', 8.50, 150, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Piroxicam 20mg', 2, 'Boîte de 10 gélules', 9.30, 120, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Méloxicam 15mg', 2, 'Boîte de 14 comprimés', 11.20, 160, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Acéclofénac 100mg', 2, 'Boîte de 20 comprimés', 8.90, 140, 0, 17, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Étodolac 400mg', 2, 'Boîte de 14 comprimés', 12.50, 110, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Flurbiprofène 100mg', 2, 'Boîte de 30 comprimés', 10.80, 130, 0, 16, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 3: Antibiotiques
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Amoxicilline 500mg', 3, 'Boîte de 12 gélules', 5.90, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Amoxicilline + Acide Clavulanique 1g', 3, 'Boîte de 8 comprimés', 8.50, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Azithromycine 250mg', 3, 'Boîte de 6 comprimés', 9.80, 280, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ciprofloxacine 500mg', 3, 'Boîte de 10 comprimés', 12.30, 220, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Clarithromycine 500mg', 3, 'Boîte de 14 comprimés', 14.60, 180, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Métronidazole 500mg', 3, 'Boîte de 20 comprimés', 6.70, 300, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Doxycycline 100mg', 3, 'Boîte de 15 comprimés', 8.90, 250, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Céfixime 200mg', 3, 'Boîte de 10 comprimés', 11.40, 190, 0, 22, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Lévofloxacine 500mg', 3, 'Boîte de 7 comprimés', 15.80, 160, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Clindamycine 300mg', 3, 'Boîte de 16 gélules', 13.20, 140, 0, 16, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg');

-- Catégorie 4: Antihypertenseurs
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Amlodipine 5mg', 4, 'Boîte de 30 comprimés', 4.80, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Amlodipine 10mg', 4, 'Boîte de 30 comprimés', 6.20, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Losartan 50mg', 4, 'Boîte de 28 comprimés', 8.90, 420, 0, 42, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ramipril 5mg', 4, 'Boîte de 30 comprimés', 7.50, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Énalapril 10mg', 4, 'Boîte de 28 comprimés', 6.80, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Valsartan 80mg', 4, 'Boîte de 28 comprimés', 9.20, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Candésartan 8mg', 4, 'Boîte de 30 comprimés', 10.50, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Bisoprolol 5mg', 4, 'Boîte de 30 comprimés', 5.90, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Métoprolol 50mg', 4, 'Boîte de 60 comprimés', 8.40, 340, 0, 34, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Hydrochlorothiazide 25mg', 4, 'Boîte de 30 comprimés', 4.20, 420, 0, 42, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 5: Antidiabétiques
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Metformine 500mg', 5, 'Boîte de 60 comprimés', 3.50, 500, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Metformine 850mg', 5, 'Boîte de 60 comprimés', 4.80, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Gliclazide 30mg', 5, 'Boîte de 30 comprimés', 6.90, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Glimépiride 2mg', 5, 'Boîte de 30 comprimés', 7.20, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Sitagliptine 100mg', 5, 'Boîte de 28 comprimés', 45.80, 150, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Vildagliptine 50mg', 5, 'Boîte de 56 comprimés', 42.50, 180, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Empagliflozine 10mg', 5, 'Boîte de 30 comprimés', 48.90, 120, 0, 12, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Insuline Rapide', 5, 'Flacon de 10ml', 25.00, 200, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Insulin_vial.jpg/800px-Insulin_vial.jpg'),
('Insuline Lente', 5, 'Flacon de 10ml', 28.50, 180, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Insulin_vial.jpg/800px-Insulin_vial.jpg'),
('Pioglitazone 30mg', 5, 'Boîte de 28 comprimés', 38.60, 100, 0, 10, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 6: Antihistaminiques
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Cétirizine 10mg', 6, 'Boîte de 15 comprimés', 3.80, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Loratadine 10mg', 6, 'Boîte de 10 comprimés', 3.20, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Desloratadine 5mg', 6, 'Boîte de 30 comprimés', 5.90, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Lévocétirizine 5mg', 6, 'Boîte de 28 comprimés', 6.40, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Fexofénadine 120mg', 6, 'Boîte de 20 comprimés', 8.50, 250, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Bilastine 20mg', 6, 'Boîte de 30 comprimés', 9.20, 220, 0, 22, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Hydroxyzine 25mg', 6, 'Boîte de 30 comprimés', 4.80, 180, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Diphénhydramine 25mg', 6, 'Boîte de 24 comprimés', 5.20, 200, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Prométhazine 25mg', 6, 'Boîte de 20 comprimés', 6.80, 150, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Rupatadine 10mg', 6, 'Boîte de 30 comprimés', 10.50, 140, 0, 14, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 7: Vitamines et Compléments
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Vitamine C 1000mg', 7, 'Boîte de 30 comprimés effervescents', 5.90, 500, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Vitamine D3 1000 UI', 7, 'Flacon de 20ml', 8.50, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Cough_syrup.jpg/800px-Cough_syrup.jpg'),
('Complexe Vitamine B', 7, 'Boîte de 60 comprimés', 12.80, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Fer + Acide Folique', 7, 'Boîte de 30 comprimés', 6.90, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Calcium + Vitamine D', 7, 'Boîte de 60 comprimés', 9.50, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Magnésium 300mg', 7, 'Boîte de 30 comprimés', 7.20, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Multivitamines', 7, 'Boîte de 90 comprimés', 15.80, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Oméga 3', 7, 'Boîte de 60 capsules', 18.90, 250, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Zinc 15mg', 7, 'Boîte de 30 comprimés', 6.50, 220, 0, 22, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Sélénium 50mcg', 7, 'Boîte de 30 gélules', 8.90, 180, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg');

-- Catégorie 8: Médicaments Cardiovasculaires
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Atorvastatine 20mg', 8, 'Boîte de 30 comprimés', 12.50, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Simvastatine 40mg', 8, 'Boîte de 28 comprimés', 10.80, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Rosuvastatine 10mg', 8, 'Boîte de 30 comprimés', 15.20, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Clopidogrel 75mg', 8, 'Boîte de 30 comprimés', 18.90, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Aspirine Cardio 100mg', 8, 'Boîte de 30 comprimés', 3.80, 500, 0, 50, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Aspirin-Bayer.jpg/800px-Aspirin-Bayer.jpg'),
('Digoxine 0.25mg', 8, 'Boîte de 30 comprimés', 5.40, 200, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Furosémide 40mg', 8, 'Boîte de 30 comprimés', 4.20, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Spironolactone 25mg', 8, 'Boîte de 30 comprimés', 6.80, 250, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ivabradine 5mg', 8, 'Boîte de 56 comprimés', 32.50, 150, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Isosorbide Dinitrate 20mg', 8, 'Boîte de 60 comprimés', 8.90, 220, 0, 22, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 9: Médicaments Gastro-intestinaux
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Oméprazole 20mg', 9, 'Boîte de 14 gélules', 3.80, 450, 0, 45, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Pantoprazole 40mg', 9, 'Boîte de 28 comprimés', 6.50, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ésoméprazole 20mg', 9, 'Boîte de 14 comprimés', 5.90, 380, 0, 38, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Ranitidine 150mg', 9, 'Boîte de 24 comprimés', 4.80, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Dompéridone 10mg', 9, 'Boîte de 30 comprimés', 3.50, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Métoclopramide 10mg', 9, 'Boîte de 20 comprimés', 2.90, 300, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Lopéramide 2mg', 9, 'Boîte de 12 gélules', 3.20, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Smecta', 9, 'Boîte de 30 sachets', 4.50, 420, 0, 42, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Lactulose Sirop', 9, 'Flacon de 200ml', 5.80, 250, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Cough_syrup.jpg/800px-Cough_syrup.jpg'),
('Mébévérine 135mg', 9, 'Boîte de 60 comprimés', 8.90, 200, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Catégorie 10: Médicaments Respiratoires
INSERT INTO MEDICAMENT (NOM, CATEGORIE_CODE, QUANTITE_PAR_UNITE, PRIX_UNITAIRE, UNITES_EN_STOCK, UNITES_COMMANDEES, NIVEAU_DE_REAPPRO, INDISPONIBLE, imageURL) VALUES
('Salbutamol Spray 100mcg', 10, 'Spray de 200 doses', 6.50, 300, 0, 30, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Asthma_inhaler.jpg/800px-Asthma_inhaler.jpg'),
('Budésonide Spray 200mcg', 10, 'Spray de 200 doses', 12.80, 250, 0, 25, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Asthma_inhaler.jpg/800px-Asthma_inhaler.jpg'),
('Fluticasone Spray 125mcg', 10, 'Spray de 120 doses', 15.90, 220, 0, 22, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Asthma_inhaler.jpg/800px-Asthma_inhaler.jpg'),
('Tiotropium 18mcg', 10, 'Boîte de 30 gélules', 42.50, 180, 0, 18, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Montelukast 10mg', 10, 'Boîte de 28 comprimés', 18.90, 200, 0, 20, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Carbocistéine 375mg', 10, 'Boîte de 30 gélules', 4.80, 350, 0, 35, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Capsules.jpg/800px-Capsules.jpg'),
('Acétylcystéine 600mg', 10, 'Boîte de 20 sachets', 6.20, 320, 0, 32, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Bromhexine 8mg', 10, 'Sirop 200ml', 5.50, 280, 0, 28, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/25/Cough_syrup.jpg/800px-Cough_syrup.jpg'),
('Théophylline 200mg', 10, 'Boîte de 30 comprimés', 8.90, 150, 0, 15, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg'),
('Prednisone 20mg', 10, 'Boîte de 20 comprimés', 3.80, 400, 0, 40, false, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Pills_in_blister_pack.jpg/800px-Pills_in_blister_pack.jpg');

-- Insertion des dispensaires
INSERT INTO DISPENSAIRE (CODE, NOM, CONTACT, FONCTION, ADRESSE, CODE_POSTAL, VILLE, REGION, PAYS, TELEPHONE, FAX) VALUES
('DSP01', 'Dispensaire Central Dakar', 'Dr. Amadou Diop', 'Directeur', '15 Avenue Léopold Sédar Senghor', '10200', 'Dakar', 'Dakar', 'Sénégal', '+221-33-821-5555', '+221-33-821-5556'),
('DSP02', 'Dispensaire Saint-Louis', 'Dr. Fatou Sall', 'Chef de Service', '42 Rue de la République', '32000', 'Saint-Louis', 'Saint-Louis', 'Sénégal', '+221-33-961-2345', '+221-33-961-2346'),
('DSP03', 'Dispensaire Thiès', 'Mme Aïssatou Kane', 'Pharmacienne', '28 Boulevard El Hadji Malick Sy', '21000', 'Thiès', 'Thiès', 'Sénégal', '+221-33-951-7890', '+221-33-951-7891'),
('DSP04', 'Dispensaire Kaolack', 'Dr. Mamadou Ba', 'Médecin Chef', '56 Avenue Valdiodio Ndiaye', '25000', 'Kaolack', 'Kaolack', 'Sénégal', '+221-33-941-3456', '+221-33-941-3457'),
('DSP05', 'Dispensaire Ziguinchor', 'Dr. Mariama Diallo', 'Directrice', '18 Rue du Commerce', '27000', 'Ziguinchor', 'Ziguinchor', 'Sénégal', '+221-33-991-6789', '+221-33-991-6780'),
('DSP06', 'Dispensaire Rufisque', 'M. Ousmane Sow', 'Gestionnaire', '34 Avenue Blaise Diagne', '11000', 'Rufisque', 'Dakar', 'Sénégal', '+221-33-836-4321', '+221-33-836-4322'),
('DSP07', 'Dispensaire Louga', 'Dr. Khady Ndiaye', 'Médecin', '67 Rue Abdoulaye Wade', '50000', 'Louga', 'Louga', 'Sénégal', '+221-33-967-8901', '+221-33-967-8902'),
('DSP08', 'Dispensaire Tambacounda', 'Dr. Ibrahima Sarr', 'Chef de Poste', '23 Avenue Demba Diop', '23000', 'Tambacounda', 'Tambacounda', 'Sénégal', '+221-33-981-2345', '+221-33-981-2346'),
('DSP09', 'Dispensaire Kolda', 'Mme Ndeye Diagne', 'Infirmière Chef', '45 Rue de la Paix', '26000', 'Kolda', 'Kolda', 'Sénégal', '+221-33-996-5678', '+221-33-996-5679'),
('DSP10', 'Dispensaire Mbour', 'Dr. Abdoulaye Thiam', 'Directeur Médical', '89 Route de Saly', '22000', 'Mbour', 'Thiès', 'Sénégal', '+221-33-957-9012', '+221-33-957-9013');

-- Insertion des commandes
INSERT INTO COMMANDE (NUMERO, SAISIELE, ENVOYEELE, DISPENSAIRE_CODE, PORT, REMISE, DESTINATAIRE, ADRESSE, CODE_POSTAL, VILLE, REGION, PAYS) VALUES
(1, '2024-01-15', '2024-01-18', 'DSP01', 15.00, 5.00, 'Dispensaire Central Dakar', '15 Avenue Léopold Sédar Senghor', '10200', 'Dakar', 'Dakar', 'Sénégal'),
(2, '2024-01-20', '2024-01-23', 'DSP02', 20.00, 3.50, 'Dispensaire Saint-Louis', '42 Rue de la République', '32000', 'Saint-Louis', 'Saint-Louis', 'Sénégal'),
(3, '2024-02-05', '2024-02-08', 'DSP03', 12.00, 4.00, 'Dispensaire Thiès', '28 Boulevard El Hadji Malick Sy', '21000', 'Thiès', 'Thiès', 'Sénégal'),
(4, '2024-02-12', '2024-02-15', 'DSP04', 18.00, 6.00, 'Dispensaire Kaolack', '56 Avenue Valdiodio Ndiaye', '25000', 'Kaolack', 'Kaolack', 'Sénégal'),
(5, '2024-02-25', NULL, 'DSP05', 25.00, 2.00, 'Dispensaire Ziguinchor', '18 Rue du Commerce', '27000', 'Ziguinchor', 'Ziguinchor', 'Sénégal'),
(6, '2024-03-10', '2024-03-13', 'DSP06', 10.00, 5.50, 'Dispensaire Rufisque', '34 Avenue Blaise Diagne', '11000', 'Rufisque', 'Dakar', 'Sénégal'),
(7, '2024-03-20', NULL, 'DSP07', 22.00, 4.50, 'Dispensaire Louga', '67 Rue Abdoulaye Wade', '50000', 'Louga', 'Louga', 'Sénégal'),
(8, '2024-04-05', '2024-04-08', 'DSP08', 30.00, 7.00, 'Dispensaire Tambacounda', '23 Avenue Demba Diop', '23000', 'Tambacounda', 'Tambacounda', 'Sénégal');
ALTER TABLE Commande ALTER COLUMN numero RESTART WITH 9;

-- Insertion des lignes de commande
INSERT INTO LIGNE (COMMANDE_NUMERO, MEDICAMENT_REFERENCE, QUANTITE) VALUES
(1, 1, 100), (1, 11, 50), (1, 21, 80), (1, 31, 60), (1, 41, 40),
(2, 2, 75), (2, 12, 45), (2, 22, 90), (2, 32, 55), (2, 51, 30),
(3, 3, 120), (3, 13, 60), (3, 23, 70), (3, 33, 50), (3, 61, 80),
(4, 4, 85), (4, 14, 55), (4, 24, 65), (4, 34, 45), (4, 71, 90),
(5, 5, 95), (5, 15, 70), (5, 25, 75), (5, 35, 50), (5, 81, 40),
(6, 6, 110), (6, 16, 65), (6, 26, 85), (6, 36, 60), (6, 91, 70),
(7, 7, 80), (7, 17, 50), (7, 27, 95), (7, 37, 55), (7, 100, 45),
(8, 8, 100), (8, 18, 75), (8, 28, 80), (8, 38, 70), (8, 48, 60);

-- ============================================================
-- AJOUT DES FOURNISSEURS (Pour le devoir)
-- ============================================================

-- 1. Création des fournisseurs
-- REMPLACE 'ton.email' PAR TON VRAI GMAIL ci-dessous !
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (1, 'Pfizer', 'senebrous.senebrous+pfizer@gmail.com');
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (2, 'Sanofi', 'senebrous.senebrous+sanofi@gmail.com');
INSERT INTO FOURNISSEUR (ID, NOM, EMAIL) VALUES (3, 'Bayer', 'senebrous.senebrous+bayer@gmail.com');

-- On dit à la base de données que le prochain ID sera 4 (pour éviter les bugs)
ALTER TABLE FOURNISSEUR ALTER COLUMN ID RESTART WITH 4;

-- 2. Liaison Fournisseurs <-> Catégories
-- Rappel de l'énoncé : "chaque catégorie fournie par au moins deux fournisseurs"

-- Catégorie 1 (Antalgiques) : Fourni par Pfizer(1) et Sanofi(2)
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 1);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 1);

-- Catégorie 2 (Anti-inflammatoires) : Fourni par Sanofi(2) et Bayer(3)
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 2);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 2);

-- Catégorie 3 (Antibiotiques) : Fourni par Pfizer(1) et Bayer(3)
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 3);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 3);

-- On remplit les autres catégories pour respecter la règle "au moins 2 fournisseurs"
-- Pfizer fournit aussi les cat 4, 5, 6
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 4);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 5);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 6);

-- Sanofi fournit aussi les cat 4, 5, 7, 8
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 4);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 5);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 7);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (2, 8);

-- Bayer fournit tout le reste (6 à 10)
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 6);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 7);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 8);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 9);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (3, 10);

-- Il faut un 2ème fournisseur pour la 9 et la 10 (Pfizer s'y colle)
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 9);
INSERT INTO fournisseur_categorie (fournisseur_id, categorie_id) VALUES (1, 10);