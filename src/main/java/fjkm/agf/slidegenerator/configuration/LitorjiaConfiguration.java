package fjkm.agf.slidegenerator.configuration;

import lombok.Getter;
import lombok.Setter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;

import fjkm.agf.slidegenerator.parser.JsonUtility;
import fjkm.agf.slidegenerator.utils.Misc;


/**
 * @author rakharrs
 */
public abstract class LitorjiaConfiguration {
    @Getter @Setter
    String jsonPath;

    /**
     * Mamaky anle fichier de configuration
     * @return anle configuration miantso
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public <T> T read() throws Exception{
       try (InputStream is = Misc.getLitorjiaStream(jsonPath)) {
        if (is == null) {
            throw new FileNotFoundException("Resource not found: " + jsonPath);
        }
        Object temp = JsonUtility.parseJson(is, this.getClass());
        return (T) temp;
    }

    }

    /**
     * need to be overrided<hr>
     * Need to be defined
     * For setting attribute of the configuration class
     */
    public abstract void init() throws Exception;
}
