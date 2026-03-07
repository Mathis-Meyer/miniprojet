package pharmacie.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.web.bind.annotation.CrossOrigin;

import pharmacie.entity.Medicament;

// ON NE DÉCLARE L'INTERFACE QU'UNE SEULE FOIS ICI
@CrossOrigin(origins = "*")
public interface MedicamentRepository extends JpaRepository<Medicament, Integer> {

    @Query("""
                SELECT l.medicament.nom as nom, SUM(l.quantite) AS unites
                FROM Ligne l
                WHERE l.medicament.categorie.code = :codeCategorie
                GROUP BY nom
            """)
    List<UnitesParMedicament> medicamentsCommandesPour(Integer codeCategorie);

    @Query(value = """
            SELECT m.nom as nom, SUM(l.quantite) AS unites
            FROM Categorie c
            INNER JOIN Medicament m ON c.code = m.categorie_code
            INNER JOIN Ligne l ON m.reference = l.medicament_reference
            WHERE c.code = :codeCategorie
            GROUP BY m.nom
            """, nativeQuery = true)
    List<UnitesParMedicament> medicamentsCommandesPourNative(Integer codeCategorie);

    @Query("""
                SELECT m.nom, SUM(li.quantite)
                FROM Categorie c
                JOIN c.medicaments m
                JOIN m.lignes li
                WHERE c.code = :codeCategorie
                GROUP BY m.nom
            """)
    List<Object> medicamentsCommandesPourV2(Integer codeCategorie);

    @Query("""
              SELECT m from Medicament m
              WHERE m.indisponible = false
              AND m.unitesEnStock > m.unitesCommandees
            """)
    List<Medicament> medicamentsDisponibles();

    @Query("SELECT m FROM Medicament m WHERE m.unitesEnStock < m.niveauDeReappro")
    List<Medicament> findMedicamentsACommander();
}