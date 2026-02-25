package pharmacie.entity; // J'ai adapté ça à ton dossier

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Fournisseur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String email;

    @ManyToMany
    @JoinTable(
        name = "fournisseur_categorie",
        joinColumns = @JoinColumn(name = "fournisseur_id"),
        inverseJoinColumns = @JoinColumn(name = "categorie_id")
    )
    private List<Categorie> categories;

    // --- Constructeurs ---
    public Fournisseur() {
    }

    public Fournisseur(String nom, String email) {
        this.nom = nom;
        this.email = email;
    }

    // --- Getters et Setters ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public List<Categorie> getCategories() { return categories; }
    public void setCategories(List<Categorie> categories) { this.categories = categories; }
}