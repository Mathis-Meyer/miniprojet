package pharmacie;

import java.util.Properties;

import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@SpringBootApplication
public class WebApp {

    public static void main(String[] args) {
        SpringApplication.run(WebApp.class, args);
    }

    // --- 1. LE MORCEAU QUI MANQUAIT (ModelMapper) ---
    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }

    // --- 2. LA CONFIGURATION MAIL ---
    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        // REMETS TES INFOS ICI !
        mailSender.setUsername("senebrous.senebrous@gmail.com"); 
        mailSender.setPassword("umafnfeshwscwmwf"); 

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        // props.put("mail.debug", "true"); 

        return mailSender;
    }
}