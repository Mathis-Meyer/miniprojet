package pharmacie.config;

import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

import jakarta.persistence.EntityManager;
import jakarta.persistence.metamodel.Type;

@Component
public class SpringDataRestConfig implements RepositoryRestConfigurer {

    private final EntityManager entityManager;

    public SpringDataRestConfig(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public void configureRepositoryRestConfiguration(
            RepositoryRestConfiguration config, CorsRegistry cors) {
        // Expose les IDs de toutes les entités dans l'API REST
        config.exposeIdsFor(
                entityManager.getMetamodel()
                        .getEntities()
                        .stream()
                        .map(Type::getJavaType)
                        .toArray(Class[]::new));

        // ✅ CORS géré uniquement dans CorsConfig.java — rien ici
    }
}