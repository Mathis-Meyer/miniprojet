package pharmacie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pharmacie.dao.FournisseurRepository;
import pharmacie.dao.MedicamentRepository;
import pharmacie.entity.Categorie;
import pharmacie.entity.Fournisseur;
import pharmacie.entity.Medicament;

@Service
public class ApprovisionnementService {

    @Autowired
    private MedicamentRepository medicamentRepository;

    @Autowired
    private FournisseurRepository fournisseurRepository;

    @Autowired
    private JavaMailSender emailSender;

    @Transactional(readOnly = true) // Important pour garder la session SQL ouverte
    public String traiterReapprovisionnement() {
        // 1. Récupérer les médicaments en rupture (Stock < NiveauReappro)
        List<Medicament> aCommander = medicamentRepository.findMedicamentsACommander();

        if (aCommander.isEmpty()) {
            return "✅ Stock OK. Aucun médicament sous le seuil d'alerte.";
        }

        // 2. Récupérer tous les fournisseurs pour être sûr d'avoir leurs catégories
        List<Fournisseur> tousLesFournisseurs = fournisseurRepository.findAll();

        // On prépare une boîte aux lettres : "Email" -> "Contenu du mail"
        Map<String, StringBuilder> emailsAPreparer = new HashMap<>();

        for (Fournisseur f : tousLesFournisseurs) {
            StringBuilder corps = new StringBuilder();
            boolean aBesoinDeCommander = false;

            // On regarde chaque catégorie du fournisseur
            for (Categorie cat : f.getCategories()) {
                boolean enteteCategorieAjoutee = false;

                // On regarde si un des médicaments en rupture appartient à cette catégorie
                for (Medicament med : aCommander) {
                    if (med.getCategorie().getCode().equals(cat.getCode())) {
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

            if (aBesoinDeCommander) {
                corps.append("Cordialement,\nLa Pharmacie ISIS.");
                emailsAPreparer.put(f.getEmail(), corps);
            }
        }

        // 3. Envoi effectif
        if (emailsAPreparer.isEmpty()) {
            return "Stock critique détecté, mais aucun fournisseur n'est rattaché à ces catégories.";
        }

        for (Map.Entry<String, StringBuilder> entree : emailsAPreparer.entrySet()) {
            envoyerEmail(entree.getKey(), entree.getValue().toString());
        }

        return "🚀 Succès ! " + emailsAPreparer.size() + " emails récapitulatifs envoyés aux fournisseurs.";
    }

    private void envoyerEmail(String destinataire, String texte) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(destinataire);
        message.setSubject("URGENT - Demande de devis réapprovisionnement");
        message.setText(texte);
        emailSender.send(message);
        System.out.println("📨Email envoyé à : " + destinataire);
    }
}