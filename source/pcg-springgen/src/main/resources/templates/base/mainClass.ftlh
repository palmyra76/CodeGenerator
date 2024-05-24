package ${packageName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.palmyralabs.palmyra.spring.PalmyraSpringConfiguration;

@SpringBootApplication
@Import(PalmyraSpringConfiguration.class)
public class AppMain {

	public static void main(String[] args) {
		SpringApplication.run(AppMain.class, args);
	}

}
