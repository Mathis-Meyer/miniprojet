package pharmacie.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin; // N'oublie pas l'import !
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import pharmacie.service.ApprovisionnementService;

@CrossOrigin(origins = "*") // Autorise StackBlitz à appeler cette API
@RestController
public class ApprovisionnementController {

    @Autowired
    private ApprovisionnementService service;

    // L'adresse pour déclencher le robot
    @GetMapping("/api/reappro")
    public String lancerLeReappro() {
        return service.traiterReapprovisionnement();
    }
}