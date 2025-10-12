package fjkm.agf.slidegenerator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication
public class SlidegeneratorApplication {

	public static void main(String[] args) {
		SpringApplication.run(SlidegeneratorApplication.class, args);
	}
	
}
