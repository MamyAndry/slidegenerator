package fjkm.agf.slidegenerator.mapping;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import fjkm.agf.slidegenerator.configuration.Antema;
import fjkm.agf.slidegenerator.configuration.FihiranaFFPM;
import fjkm.agf.slidegenerator.configuration.FihiranaFanampiny;
import fjkm.agf.slidegenerator.configuration.FihiranaFifohazana;
import fjkm.agf.slidegenerator.configuration.HiraSalamo;
import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class HiraRehetra {
    ArrayList<String> lisitraNomeraoHira;
    HashMap<String, HiraFihirana> lisitraHira;

    public void initLisitraHira() throws Exception{
        FihiranaFFPM ffpm = new FihiranaFFPM();
        FihiranaFanampiny ff = new FihiranaFanampiny();
        FihiranaFifohazana fsafif = new FihiranaFifohazana();
        Antema ant = new Antema();
        HiraSalamo sal = new HiraSalamo();
        ffpm.init();
        ff.init();
        fsafif.init();
        ant.init();
        sal.init();
        HashMap<String, HiraFihirana> mapping = new HashMap<>();
        for(Map.Entry<String, HiraFihirana> set : ffpm.getFihirana().entrySet()){
            mapping.put(set.getKey(), set.getValue());
        }
        for(Map.Entry<String, HiraFihirana> set : ff.getFihirana().entrySet()){
            mapping.put(set.getKey(), set.getValue());
        }
        for(Map.Entry<String, HiraFihirana> set : fsafif.getFihirana().entrySet()){
            mapping.put(set.getKey(), set.getValue());
        }
        for(Map.Entry<String, HiraFihirana> set : ant.getFihirana().entrySet()){
            mapping.put(set.getKey(), set.getValue());
        }
        for(Map.Entry<String, HiraFihirana> set : sal.getFihirana().entrySet()){
            mapping.put(set.getKey(), set.getValue());
        }
        this.setLisitraHira(mapping);
    }

    public void init() throws Exception{
        this.initLisitraHira();
        ArrayList<String> lisitra = new ArrayList<>();
        for(Map.Entry<String, HiraFihirana> set : this.getLisitraHira().entrySet()){
            lisitra.add(set.getKey());
        }
        Collections.sort(lisitra);
        this.setLisitraNomeraoHira(lisitra);
    }

    public void generateAll(String path, String fontFamily, double fontSize) throws Exception{
        for(HiraFihirana hira : this.getLisitraHira().values()){
            hira.setFontFamily(fontFamily);
            hira.setFontSize(fontSize);
            hira.constructHiraPresentation(path);
        }
    }
}
