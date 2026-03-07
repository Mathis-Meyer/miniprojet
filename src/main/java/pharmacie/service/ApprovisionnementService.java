package pharmacie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pharmacie.dao.MedicamentRepository;
import pharmacie.dao.FournisseurRepository;
import pharmacie.entity.Fournisseur;
import pharmacie.entity.Medicament;
import pharmacie.entity.Categorie;

@Service
public class ApprovisionnementService {

    @Autowired
    private MedicamentRepository medicamentRepository;

    @Autowired
    private FournisseurRepository fournisseurRepository;

    @Autowired
    private JavaMailSender emailSender;

    @Transactional(readOnly = true)
    public String traiterReapprovisionnement() {
        try {
            // 1. On récupère TOUS les médicaments et on filtre manuellement (100% sûr de
            // compiler)
            List<Medicament> tousLesMedocs = medicamentRepository.findAll();
            List<Medicament> aCommander = tousLesMedocs.stream()
                    .filter(m -> m.getUnitesEnStock() != null && m.getNiveauDeReappro() != null)
                    .filter(m -> m.getUnitesEnStock() < m.getNiveauDeReappro())
                    .collect(Collectors.toList());

            if (aCommander.isEmpty()) {
                return "✅ Stock OK. Aucun médicament sous le seuil d'alerte.";
            }

            // 2. On prépare les mails groupés par fournisseur
            List<Fournisseur> tousLesFournisseurs = fournisseurRepository.findAll();
            Map<String, StringBuilder> emailsAPreparer = new HashMap<>();

            for (Fournisseur f : tousLesFournisseurs) {
                StringBuilder corps = new StringBuilder();
                boolean aBesoinDeCommander = false;

                if (f.getCategories() != null) {
                    for (Categorie cat : f.getCategories()) {
                        boolean enteteCategorieAjoutee = false;

                        for (Medicament med : aCommander) {
                            // On compare avec getLibelle() pour éviter tout problème d'ID ou de Code
                            if (med.getCategorie() != null
                                    && med.getCategorie().getLibelle() != null
                                    && cat.getLibelle() != null
                                    && med.getCategorie().getLibelle().equals(cat.getLibelle())) {

                                if (!aBesoinDeCommander) {
                                    corps.append("Bonjour ").append(f.getNom()).append(",\n\n");
                                    corps.append("Merci de nous envoyer un devis pour les produits suivants :\n\n");
                                    aBesoinDeCommander = true;
                                }
                                if (!enteteCategorieAjoutee) {
                                    corps.append("--- ").append(cat.getLibelle()).append(" ---\n");
                                    enteteCategorieAjoutee = true;
                                }
                                corps.append("- ").append(med.getNom())
                                        .append(" (Stock: ").append(med.getUnitesEnStock())
                                        .append(" / Seuil: ").append(med.getNiveauDeReappro()).append(")\n");
                            }
                        }
                        if (enteteCategorieAjoutee)
                            corps.append("\n");
                    }
                }

                if (aBesoinDeCommander && f.getEmail() != null) {
                    corps.append("Cordialement,\nLa Pharmacie ISIS.");
                    emailsAPreparer.put(f.getEmail(), corps);
                }
            }

            // 3. Envoi des mails
            if (emailsAPreparer.isEmpty()) {
                return "⚠️ Stock critique détecté, mais aucun fournisseur n'est relié à ces catégories.";
            }

            for (Map.Entry<String, StringBuilder> entree : emailsAPreparer.entrySet()) {
                envoyerEmail(entree.getKey(), entree.getValue().toString());
            }

            return "🚀 Succès ! " + emailsAPreparer.size() + " emails récapitulatifs envoyés.";

        } catch (Exception e) {
            // Si ça plante, on affiche la VRAIE erreur sur ton écran au lieu d'une erreur
            // 500 !
            e.printStackTrace();
            return "❌ Erreur Java interne (Koyeb) : " + e.toString();
        }
    }

    private void envoyerEmail(String destinataire, String texte) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(destinataire);
        message.setSubject("URGENT - Demande de devis réapprovisionnement");
        message.setText(texte);
        emailSender.send(message);
    }
}