package pharmacie.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import pharmacie.dao.MedicamentRepository;
import pharmacie.entity.Fournisseur;
import pharmacie.entity.Medicament;

@Service
public class ApprovisionnementService {

    @Autowired
    private MedicamentRepository medicamentRepository;

    @Autowired
    private JavaMailSender emailSender; // C'est le facteur de Spring Boot

    public String traiterReapprovisionnement() {
        // 1. Récupérer les médicaments en rupture
        List<Medicament> aCommander = medicamentRepository.findMedicamentsACommander();

        if (aCommander.isEmpty()) {
            return "✅ Stock OK. Aucun mail envoyé.";
        }

        // 2. Regrouper les médicaments par fournisseur
        // On crée une boîte pour chaque adresse email : "email" -> "texte du mail"
        Map<String, StringBuilder> boiteAuxLettres = new HashMap<>();

        for (Medicament med : aCommander) {
            // Pour chaque médicament, on regarde qui peut le fournir
            for (Fournisseur f : med.getCategorie().getFournisseurs()) {
                String emailFournisseur = f.getEmail();

                // Si c'est la première fois qu'on voit ce fournisseur, on prépare son brouillon
                boiteAuxLettres.putIfAbsent(emailFournisseur, new StringBuilder());
                StringBuilder brouillon = boiteAuxLettres.get(emailFournisseur);

                // Si le brouillon est vide, on met la formule de politesse
                if (brouillon.length() == 0) {
                    brouillon.append("Bonjour ").append(f.getNom()).append(",\n\n");
                    brouillon.append("Merci de nous envoyer un devis pour les produits suivants :\n");
                }

                // On ajoute la ligne du médicament
                brouillon.append("- ").append(med.getNom())
                         .append(" (Catégorie: ").append(med.getCategorie().getLibelle()).append(")")
                         .append(" [Stock actuel: ").append(med.getUnitesEnStock()).append("]\n");
            }
        }

        // 3. Envoyer les mails pour de vrai
        int nombreMailsEnvoyes = 0;
        for (Map.Entry<String, StringBuilder> courrier : boiteAuxLettres.entrySet()) {
            String destinataire = courrier.getKey();
            String corpsDuMessage = courrier.getValue().toString();
            
            envoyerEmail(destinataire, corpsDuMessage);
            nombreMailsEnvoyes++;
        }

        return "🚀 Succès ! " + nombreMailsEnvoyes + " emails ont été envoyés aux fournisseurs.";
    }

    // Petite méthode utilitaire pour envoyer un mail simple
    private void envoyerEmail(String destinataire, String texte) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(destinataire);
        message.setSubject("Demande de réapprovisionnement - Pharmacie");
        message.setText(texte);
        emailSender.send(message); // L'envoi part ici !
        System.out.println("📨 Email envoyé à : " + destinataire);
    }
}