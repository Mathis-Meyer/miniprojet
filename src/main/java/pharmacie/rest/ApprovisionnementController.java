package pharmacie.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pharmacie.service.ApprovisionnementService;

@RestController
@RequestMapping("/api")
// ⚠️ LA CORRECTION EST ICI : On utilise originPatterns au lieu de origins="*"
@CrossOrigin(originPatterns = "*", allowCredentials = "true")
public class ApprovisionnementController {

    @Autowired
    private ApprovisionnementService approvisionnementService;

    @GetMapping("/reappro")
    public ResponseEntity<String> lancerLeReappro() {
        String resultat = approvisionnementService.traiterReapprovisionnement();
        return ResponseEntity.ok(resultat);
    }
}