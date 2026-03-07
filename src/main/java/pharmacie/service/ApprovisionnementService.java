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

    @Transactional(readOnly = true)
    public String traiterReapprovisionnement() {
        try {
            List<Medicament> medocs = medicamentRepository.findAll();
            List<Fournisseur> fournisseurs = fournisseurRepository.findAll();

            Map<String, StringBuilder> emails = new HashMap<>();
            int medsEnRupture = 0;

            // On construit les mails
            for (Fournisseur f : fournisseurs) {
                StringBuilder corps = new StringBuilder();
                boolean fournisseurConcerne = false;

                for (Categorie cat : f.getCategories()) {
                    boolean enteteAjoutee = false;

                    for (Medicament m : medocs) {
                        if (m.getUnitesEnStock() < m.getNiveauDeReappro()
                                && m.getCategorie().getCode().equals(cat.getCode())) {
                            medsEnRupture++;
                            if (!fournisseurConcerne) {
                                corps.append("Bonjour ").append(f.getNom())
                                        .append(",\n\nMerci de nous envoyer un devis :\n\n");
                                fournisseurConcerne = true;
                            }
                            if (!enteteAjoutee) {
                                corps.append("--- ").append(cat.getLibelle()).append(" ---\n");
                                enteteAjoutee = true;
                            }
                            corps.append("- ").append(m.getNom()).append(" (Stock: ").append(m.getUnitesEnStock())
                                    .append(")\n");
                        }
                    }
                    if (enteteAjoutee)
                        corps.append("\n");
                }
                if (fournisseurConcerne) {
                    emails.put(f.getEmail(), corps);
                }
            }

            if (medsEnRupture == 0)
                return "✅ Stock OK. Aucun mail envoyé.";
            if (emails.isEmpty())
                return "⚠️ Rupture détectée, mais aucun fournisseur lié.";

            // ENVOI DES MAILS AVEC INTERCEPTION DE L'ERREUR GMAIL
            int nbMails = 0;
            for (Map.Entry<String, StringBuilder> entry : emails.entrySet()) {
                try {
                    SimpleMailMessage msg = new SimpleMailMessage();
                    msg.setTo(entry.getKey());
                    msg.setSubject("Demande de devis - Réapprovisionnement");
                    msg.setText(entry.getValue().toString());
                    emailSender.send(msg);
                    nbMails++;
                } catch (Exception mailEx) {
                    // SI GMAIL BLOQUE, ON AFFICHE POURQUOI AU LIEU DE FAIRE UNE ERREUR 500 !
                    return "❌ ERREUR GMAIL (Mot de passe ou SMTP) : " + mailEx.getMessage();
                }
            }

            return "🚀 Succès ! " + nbMails + " emails envoyés.";

        } catch (Exception e) {
            return "❌ ERREUR CODE : " + e.getMessage();
        }
    }
}