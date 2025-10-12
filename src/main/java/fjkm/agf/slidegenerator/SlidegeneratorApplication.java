package fjkm.agf.slidegenerator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import java.awt.Desktop;
import java.net.URI;

@SpringBootApplication
public class SlidegeneratorApplication {

	public static void main(String[] args) {
		// Set system property to hide console window (works with Launch4j)
		System.setProperty("java.awt.headless", "false");
		SpringApplication.run(SlidegeneratorApplication.class, args);
	}

	@EventListener(ApplicationReadyEvent.class)
	public void openBrowser() {
		try {
			String url = "http://localhost:8080";
			
			if (Desktop.isDesktopSupported()) {
				Desktop desktop = Desktop.getDesktop();
				if (desktop.isSupported(Desktop.Action.BROWSE)) {
					desktop.browse(new URI(url));
					System.out.println("Browser opened to: " + url);
				}
			} else {
				// Fallback for systems where Desktop is not supported
				String os = System.getProperty("os.name").toLowerCase();
				Runtime runtime = Runtime.getRuntime();
				
				if (os.contains("win")) {
					runtime.exec("rundll32 url.dll,FileProtocolHandler " + url);
				} else if (os.contains("mac")) {
					runtime.exec("open " + url);
				} else if (os.contains("nix") || os.contains("nux")) {
					runtime.exec("xdg-open " + url);
				}
			}
		} catch (Exception e) {
			System.err.println("Failed to open browser: " + e.getMessage());
		}
	}
}
