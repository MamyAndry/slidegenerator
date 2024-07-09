package fjkm.agf.slidegenerator.hiracomponents;

import org.apache.commons.math3.geometry.euclidean.threed.Line;
import org.apache.poi.xslf.usermodel.XMLSlideShow;

import fjkm.agf.slidegenerator.powerpoint.Presentation;
import fjkm.agf.slidegenerator.powerpoint.Slide;
import lombok.Getter;
import lombok.Setter;

@Getter @ Setter
public class HiraFihirana {
    String laharana;
    String sokajy;
    String lohateny;
    String[] mpanoratra;
    Hira[] hira;
    String fontFamily;
    double fontSize = 80.0;
    
    public String getFiverenana(){
        String res = "";
        for( Hira elt : this.getHira()){
            if(elt.isFiverenany() && elt.getAndininy().equals("0"))
                return elt.getTononkira();
        }
        return res;
    }

    public String constructHira(){
        String res = "";
        String fiverenana = this.getFiverenana();
        for (Hira elt : this.getHira()) {
            if(elt.isFiverenany() && elt.getAndininy().equals("0"))
                continue;
            if(this.getHira().length > 1){
                res += elt.getAndininy() + " . " +  elt.getTononkira() + "\n";
                res += fiverenana;
            }else{
                res += elt.getTononkira() + "\n";
                res += fiverenana;
            }
        }
        return res;
    }

    public boolean containsDigit(String str){
        boolean isContainingDigit = false;
        int i = 2;
        while(!isContainingDigit){
            if(i == 10) break;
            if(str.contains(""+i))
                isContainingDigit = true; 
            i++;
        }
        return isContainingDigit;
    }

    public String constructHira(String andininy){
        String res = "";
        String fiverenana = this.getFiverenana();
        andininy = andininy.trim();
        String[] listAndininy = andininy.split(","); 
        for (Hira elt : this.getHira()) {
            for (String string : listAndininy) {
                if(elt.isFiverenany() && elt.getAndininy().equals("0"))
                    continue;
                if(!string.trim().equals(elt.getAndininy()))
                    continue;
                if(this.getHira().length > 1){
                    res += "\n" + elt.getAndininy() + " . " +  elt.getTononkira() + "\n";
                    res += fiverenana;
                }else{
                    res += elt.getTononkira() + "\n";
                    res += fiverenana;
                }
            }
        }
        return res;
    }

    public String[] getByLineTononkira(String andininy){
        return andininy.split("\n");
    }

    public void constructHiraPresentation(String path) throws Exception{
        //CREATE NEW PRESENTATION
        XMLSlideShow ppt = Presentation.newPresentation();
        //ADDING SLIDE
        String[] lines = getByLineTononkira(this.constructHira());
        Slide slide = new Slide();
        slide.setFontFamily(this.getFontFamily());
        slide.setText(this.getSokajy() + " " + this.getLaharana());
        slide.setBold(true);
        slide.setFontSize(this.getFontSize());
        slide.createSlide(ppt, "");
        int limit = lines.length -1;
        String line = "";
        int i = 0;
        while(i <= limit ) {
            if(i != limit){
                if(this.containsDigit(lines[i+1])){
                    line = lines[i];
                    i++;
                }else{
                    line = lines[i] + " " + lines[i+1]; 
                    i += 2;
                }
            }else{
                line = lines[i];
                i += 2;
            }
            slide.setText(line.toUpperCase());
            slide.createSlideHira(ppt);
        }
        //SAVE PRESENTATION
        String name = this.getSokajy() + " " + this.getLaharana();
        name = name.replace(" ", "_") + ".pptx";
        Presentation.save(ppt, path, name);
    }

    public void constructHiraPresentation(String path, String andininy) throws Exception{
        //CREATE NEW PRESENTATION
        XMLSlideShow ppt = Presentation.newPresentation();
        //ADDING SLIDE
        String[] lines = getByLineTononkira(this.constructHira(andininy));
        String line = "";
        int limit = lines.length -1;
        Slide slide = new Slide();
        slide.setFontFamily(this.getFontFamily());
        slide.setText(this.getSokajy() + " " + this.getLaharana());
        slide.setBold(true);
        slide.setFontSize(this.getFontSize());
        slide.createSlideHira(ppt);
        for (int i = 0; i <= limit ; i += 2) {
            if(i != limit){
                line = lines[i] + " " + lines[i+1];
            }else{
                line = lines[i];
            }
            slide.setText(line.toUpperCase());
            slide.createSlideHira(ppt);
        }
        //SAVE PRESENTATION
        String name = this.getLaharana() + ".pptx";
        Presentation.save(ppt, path, name);
    }
}
