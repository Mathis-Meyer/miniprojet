package pharmacie.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import pharmacie.service.ApprovisionnementService;

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