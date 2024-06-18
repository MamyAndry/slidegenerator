    package fjkm.agf.slidegenerator.configuration;

import lombok.Getter;
import lombok.Setter;

import java.io.File;

import fjkm.agf.slidegenerator.parser.JsonUtility;
import fjkm.agf.slidegenerator.utils.Misc;


/**
 * @author rakharrs
 */
public abstract class HiraConfiguration {
    @Getter @Setter
    String jsonPath;

    /**
     * Mamaky anle fichier de configuration
     * @return anle configuration miantso
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public <T> T read() throws Exception{
        String separator = File.separator;
        String path = Misc.getHiraLocation() + separator + jsonPath;
        Object temp = JsonUtility.parseJson(path, this.getClass());
        return (T)temp;
    }

    /**
     * need to be overrided<hr>
     * Need to be defined
     * For setting attribute of the configuration class
     */
    public abstract void init() throws Exception;
}
