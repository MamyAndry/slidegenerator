package fjkm.agf.slidegenerator.configuration;

import java.util.HashMap;

import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class FihiranaFifohazana extends HiraConfiguration{
    HashMap<String, HiraFihirana> fihirana;

    @Override
    public void init() throws Exception {
        setJsonPath("05_fihirana_fifohazana.json");
        FihiranaFifohazana temp = this.read();
        setFihirana(temp.getFihirana());
    }
}
