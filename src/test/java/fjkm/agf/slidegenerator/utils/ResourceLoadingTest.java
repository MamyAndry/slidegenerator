package fjkm.agf.slidegenerator.utils;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import fjkm.agf.slidegenerator.configuration.FihiranaFFPM;

import static org.junit.jupiter.api.Assertions.*;

import java.io.InputStream;

@SpringBootTest
public class ResourceLoadingTest {

    @Test
    public void testHiraStreamLoading() {
        // Test that we can load hira JSON files
        InputStream stream = Misc.getHiraStream("01_fihirana_ffpm.json");
        assertNotNull(stream, "Should be able to load 01_fihirana_ffpm.json from classpath");
    }

    @Test
    public void testLitorjiaStreamLoading() {
        // Test that we can load litorjia JSON files
        InputStream stream = Misc.getLitorjiaStream("litorjia.json");
        assertNotNull(stream, "Should be able to load litorjia.json from classpath");
    }

    @Test
    public void testFihiranaFFPMInitialization() throws Exception {
        // Test that FihiranaFFPM can initialize properly
        FihiranaFFPM ffpm = new FihiranaFFPM();
        assertDoesNotThrow(() -> ffpm.init(), "FihiranaFFPM should initialize without throwing exceptions");
        assertNotNull(ffpm.getFihirana(), "FihiranaFFPM should have loaded fihirana data");
    }
}