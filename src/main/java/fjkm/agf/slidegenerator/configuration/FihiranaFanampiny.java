package fjkm.agf.slidegenerator.configuration;

import java.util.HashMap;

import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class FihiranaFanampiny extends HiraConfiguration{    
    HashMap<String, HiraFihirana> fihirana;

    @Override
    public void init() throws Exception {
        setJsonPath("02_fihirana_fanampiny.json"); 
        FihiranaFanampiny temp = this.read();
        setFihirana(temp.getFihirana());
    }
}
