package fjkm.agf.slidegenerator.configuration;

import java.util.HashMap;

import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class HiraSalamo extends HiraConfiguration{
    HashMap<String, HiraFihirana> fihirana;

    @Override
    public void init() throws Exception {
        setJsonPath("04_hira_salamo.json");
        HiraSalamo temp = this.read();
        setFihirana(temp.getFihirana());
    }
}
