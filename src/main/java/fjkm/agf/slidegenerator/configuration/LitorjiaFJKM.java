package fjkm.agf.slidegenerator.configuration;

import java.util.HashMap;

import org.apache.poi.xslf.usermodel.XMLSlideShow;

import fjkm.agf.slidegenerator.litorjiacomponents.Endriny;
import fjkm.agf.slidegenerator.mapping.HiraRehetra;
import fjkm.agf.slidegenerator.powerpoint.Presentation;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
public class LitorjiaFJKM extends LitorjiaConfiguration{
    HashMap<String, Endriny> litorjia;

    @Override
    public void init() throws Exception {
        setJsonPath("litorjia.json");
        LitorjiaFJKM temp = this.read();
        setLitorjia(temp.getLitorjia());
    }


    public void generateProgram(
        String name,
        String fontFamily,
        String fontFamilyHira,
        String path,
        String vakitenyFiderana,
        String vakitenySA,
        String fanekemPinoana,
        String endriny,
        String hiraFidirana,
        String hiraFanehoana,
        String hiraFamaranana, 
        String[] hira,
        String[] hiraRakitra,
        String[] vakiteny,
        String[] asaVavolombelona,
        String[] asanAndriamanitra,
        String[] hiraFizarana,
        String[] hiraFanangonana,
        double fontSize,
        double fontSizeHira,
        double imageOpacity,
        boolean fandraisana
    ) throws Exception{
        //CREATE NEW PRESENTATION
        XMLSlideShow ppt = Presentation.newPresentation();

        //ADDING SLIDE
        HiraRehetra hiraRehetra = new HiraRehetra();
        hiraRehetra.init();
        Endriny endrinyLitorjia = this.getLitorjia().get(endriny);
        endrinyLitorjia.setFontFamily(fontFamily);
        endrinyLitorjia.setFontFamilyHira(fontFamilyHira);
        endrinyLitorjia.setFontSize(fontSize);
        endrinyLitorjia.setFontSizeHira(fontSizeHira);
        endrinyLitorjia.setImageOpacity(imageOpacity);
        endrinyLitorjia.generateSlide(
            hiraRehetra,
            path,
            vakitenyFiderana,
            vakitenySA,
            fanekemPinoana,
            hiraFidirana,
            hira,
            hiraRakitra,
            vakiteny,
            asaVavolombelona,
            asanAndriamanitra,
            ppt);
        if(fandraisana){
            endrinyLitorjia = this.getLitorjia().get("fandraisana_fanasan_ny_tompo");
            endrinyLitorjia.setFontFamily(fontFamily);
            endrinyLitorjia.setFontFamilyHira(fontFamilyHira);
            endrinyLitorjia.setFontSize(fontSize);
            endrinyLitorjia.setFontSizeHira(fontSizeHira);
            endrinyLitorjia.setImageOpacity(imageOpacity);
            endrinyLitorjia.generateSlideFandraisana(            
                hiraRehetra,
                path,
                hiraFanehoana,
                hiraFizarana,
                hiraFanangonana,
                hiraFamaranana,
                ppt
            );
        }
        //SAVE PRESENTATION
        name += ".pptx";
        Presentation.save(ppt, path, name);

    }
    public void generateProgram(
        String name,
        String fontFamily,
        String fontFamilyHira,
        String path,
        String vakitenyFiderana,
        String vakitenySA,
        String fanekemPinoana,
        String endriny,
        String hiraFidirana,
        String hiraFanehoana,
        String hiraFamaranana, 
        String[] vakiteny,
        String[] asaVavolombelona,
        String[] asanAndriamanitra,
        String[] hiraFizarana,
        String[] hiraFanangonana,
        double fontSize,
        double fontSizeHira,
        double imageOpacity,
        boolean fandraisana
    ) throws Exception{
        //CREATE NEW PRESENTATION
        XMLSlideShow ppt = Presentation.newPresentation();

        //ADDING SLIDE
        HiraRehetra hiraRehetra = new HiraRehetra();
        hiraRehetra.init();
        Endriny endrinyLitorjia = this.getLitorjia().get(endriny);
        endrinyLitorjia.setFontFamily(fontFamily);
        endrinyLitorjia.setFontFamilyHira(fontFamilyHira);
        endrinyLitorjia.setFontSize(fontSize);
        endrinyLitorjia.setFontSizeHira(fontSizeHira);
        endrinyLitorjia.setImageOpacity(imageOpacity);
        endrinyLitorjia.generateSlide(
            hiraRehetra,
            path,
            vakitenyFiderana,
            vakitenySA,
            fanekemPinoana,
            hiraFidirana,
            vakiteny,
            asaVavolombelona,
            asanAndriamanitra,
            ppt);
        if(fandraisana){
            endrinyLitorjia = this.getLitorjia().get("fandraisana_fanasan_ny_tompo");
            endrinyLitorjia.setFontFamily(fontFamily);
            endrinyLitorjia.setFontFamilyHira(fontFamilyHira);
            endrinyLitorjia.setFontSize(fontSize);
            endrinyLitorjia.setFontSizeHira(fontSizeHira);
            endrinyLitorjia.setImageOpacity(imageOpacity);
            endrinyLitorjia.generateSlideFandraisana(            
                hiraRehetra,
                path,
                hiraFanehoana,
                hiraFizarana,
                hiraFanangonana,
                hiraFamaranana,
                ppt
            );
        }
        //SAVE PRESENTATION
        name += ".pptx";
        Presentation.save(ppt, path, name);

    }
    
}
