package fjkm.agf.slidegenerator.litorjiacomponents;

import java.util.HashMap;

import org.apache.poi.xslf.usermodel.XMLSlideShow;

import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import fjkm.agf.slidegenerator.mapping.HiraRehetra;
import fjkm.agf.slidegenerator.powerpoint.Slide;
import fjkm.agf.slidegenerator.utils.ObjectUtility;
import lombok.Setter;
import lombok.Getter;

@Setter @Getter
public class Endriny {
    HashMap<String, Tapany> fizarana;
    String fontFamily = "Calibri";
    String fontFamilyHira = "Calibri";
    String vavakaPicture = "vavaka.jpg";
    String rakitraPicture = "";
    String fotoanaNyAnkizyPicture = "fotoanaNyAnkizy.jpg";
    String hiraPicture = "hira.jpg";
    String toritenyPicture = "fiangonana.jpg";
    String tsodranoPicture = "tsodrano.jpg";
    String vakitenyPicture = "baiboly.jpg";
    String feoPicture = "feo.jpg";
    String fanasanNyTompoPicture = "fanasan_ny_tompo.jpg";
    String asaVavolombelonaPicture = "";
    String asanAndriamanitraPicture = "";
    double fontSize;
    double fontSizeHira;
    double imageOpacity;
    
    public String turnArrayToUniqueString(String[] vakiteny){
        String res = "";
        for (String elt : vakiteny) {
            res += elt + "\n";
        }
        return res;
    }

    public void generateSlide(
        HiraRehetra hiraRehetra,
        String path,
        String vakitenyFiderana,
        String vakitenySA,
        String fanekemPinoana,
        String hiraFidirana,
        String[] hira,
        String[] hiraRakitra,
        String[] vakiteny,
        String[] asaVavolombelona,
        String[] asanAndriamanitra,
        XMLSlideShow ppt
    ) throws Exception{

        //ADDING SLIDE
        int i = 0;
        String key = "tapany_";
        HiraFihirana hiraFihirana;
        hiraFihirana = hiraRehetra.getLisitraHira().get(hiraFidirana);
        if(hiraFihirana == null) return;
        hiraFihirana.setFontFamily(this.getFontFamilyHira());
        hiraFihirana.setFontSize(this.getFontSizeHira());
        hiraFihirana.constructHiraPresentation(path);
        Slide slide = new Slide();
        slide.setFontFamily(this.getFontFamily());
        slide.setFontSize(this.getFontSize());
        slide.setImageOpacity(this.getImageOpacity());
        slide.setText(ObjectUtility.sexifyToUpperCase(hiraFidirana));
        slide.createSlide(ppt, this.getHiraPicture());
        for(int j = 1; j <= this.getFizarana().size(); j++){
            Tapany temp = this.getFizarana().get(key + j);
            if(temp.getTitle().equals("Fiderana an'Andriamanitra") && temp.isVakiteny()){
                slide.setText(vakitenyFiderana);
                slide.createSlide(ppt, this.getVakitenyPicture());
            } else if(temp.getTitle().equals("Fotoana ho an'ny ankizy sy ny Tanora")){
                slide.setText(temp.getTitle());
                slide.createSlide(ppt, this.getFotoanaNyAnkizyPicture());
            } else if(temp.getTitle().equals("Vakiteny Sekoly Alahady") && temp.isVakiteny()){
                slide.setText(vakitenySA);
                slide.createSlide(ppt, this.getVakitenyPicture());
            } else if(temp.getTitle().contains("Hira")){
                hiraFihirana = hiraRehetra.getLisitraHira().get(hira[i]);
                hiraFihirana.setFontFamily(this.getFontFamilyHira());
                hiraFihirana.setFontSize(this.getFontSizeHira());
                hiraFihirana.constructHiraPresentation(path);
                slide.setText(ObjectUtility.sexifyToUpperCase(hira[i]));
                slide.createSlide(ppt, this.getHiraPicture());
                i++;
            } else if(temp.getTitle().equals("Rakitra")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getRakitraPicture());
                for (String elt : hiraRakitra) {  
                    hiraFihirana = hiraRehetra.getLisitraHira().get(elt);
                    hiraFihirana.setFontFamily(this.getFontFamilyHira());
                    hiraFihirana.setFontSize(this.getFontSizeHira());
                    hiraFihirana.constructHiraPresentation(path);
                    slide.setText(ObjectUtility.sexifyToUpperCase(elt));
                    slide.createSlide(ppt, this.getHiraPicture());
                }
            } else if(temp.getTitle().equals("Fanekem-pinoana")){
                slide.setText((temp.getTitle() + " " + fanekemPinoana).toUpperCase());
                slide.createSlide(ppt, "");
            } else if(temp.getTitle().equals("Vakiteny") && temp.isVakiteny()){
                slide.setText(turnArrayToUniqueString(vakiteny));
                slide.createSlideVakiteny(ppt, this.getVakitenyPicture());
            } else if(temp.getTitle().contains("Vavaka")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getVavakaPicture());
            }else if(temp.getTitle().equals("Tsodrano")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getTsodranoPicture());
            }else if(temp.getTitle().equals("Toriteny")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getToritenyPicture());
            }else if(temp.getTitle().equals("Feon-javamaneno")){
                double realOpacity = this.getImageOpacity();
                slide.setImageOpacity(100.0);
                slide.createSlide(ppt, this.getFeoPicture());
                slide.setImageOpacity(realOpacity);
            }else if(temp.getTitle().equals("Asa Vavolombelona")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getAsaVavolombelonaPicture());
                for( String asa : asaVavolombelona){
                    if(asa.equals("")) continue;
                    hiraFihirana = hiraRehetra.getLisitraHira().get(hira[i]);
                    hiraFihirana.setFontFamily(this.getFontFamilyHira());
                    hiraFihirana.setFontSize(this.getFontSizeHira());
                    hiraFihirana.constructHiraPresentation(path);
                    slide.setText(ObjectUtility.sexifyToUpperCase(hira[i]));
                    slide.createSlide(ppt, this.getHiraPicture());
                    slide.setText(asa);
                    slide.createSlide(ppt, "");
                    i++;
                }
            }else if(temp.getTitle().equals("Asan'\nAndriamanitra")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getAsanAndriamanitraPicture());
                for( String elt : asanAndriamanitra){
                    if(elt.equals("")) continue;
                    slide.setText(elt);
                    slide.createSlide(ppt, "");
                } 
            } else{
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, "");
            }
        }
    }

    public void generateSlideFandraisana(
        HiraRehetra hiraRehetra,
        String path,
        String hiraFanehoana,
        String[] hiraFizarana,
        String[] hiraFanangonana,
        String hiraFamaranana,
        XMLSlideShow ppt
    ) throws Exception{
        
        //ADDING SLIDE
        String keyPart = "tapany_";
        String key = "";
        Slide slide = new Slide();
        slide.setFontFamily(this.getFontFamily());
        slide.setFontSize(this.getFontSize());
        slide.setImageOpacity(this.getImageOpacity());
        slide.setText("Fandraisana Fanasan'ny Tompo");
        slide.createSlide(ppt, this.getFanasanNyTompoPicture());
        HiraFihirana hiraFihirana = null;
        for(int i = 1; i <= this.getFizarana().size(); i++){
            key = keyPart + i;
            Tapany temp = this.getFizarana().get(key);
            if(key.equals("tapany_2")){
                hiraRehetra.getLisitraHira().get(hiraFanehoana).constructHiraPresentation(path);     
                slide.setText(ObjectUtility.sexifyToUpperCase(hiraFanehoana));
                slide.createSlide(ppt, this.getHiraPicture());
            } else if(key.equals("tapany_7")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, "");
                for (String elt : hiraFizarana) {  
                    if(elt.equals("")) continue;             
                    hiraFihirana = hiraRehetra.getLisitraHira().get(elt);
                    hiraFihirana.setFontFamily(this.getFontFamilyHira());
                    hiraFihirana.setFontSize(this.getFontSizeHira());
                    hiraFihirana.constructHiraPresentation(path);   
                    slide.setText(ObjectUtility.sexifyToUpperCase(elt));
                    slide.createSlide(ppt, this.getHiraPicture());
                }
            } else if(key.equals("tapany_9")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, "");
                for (String elt : hiraFanangonana) {
                    if(elt.equals("")) continue;
                    hiraFihirana = hiraRehetra.getLisitraHira().get(elt);
                    hiraFihirana.setFontFamily(this.getFontFamilyHira());
                    hiraFihirana.setFontSize(this.getFontSizeHira());
                    hiraFihirana.constructHiraPresentation(path);            
                    slide.setText(ObjectUtility.sexifyToUpperCase(elt));
                    slide.createSlide(ppt, this.getHiraPicture());
                }

            }else if(temp.getTitle().equals("Tsodrano")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getTsodranoPicture());
            }else if(temp.getTitle().equals("Vavaka")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getVavakaPicture());
            } else if(key.equals("tapany_13")){
                hiraFihirana = hiraRehetra.getLisitraHira().get(hiraFamaranana);
                hiraFihirana.setFontFamily(this.getFontFamilyHira());
                hiraFihirana.setFontSize(this.getFontSizeHira());
                hiraFihirana.constructHiraPresentation(path);     
                hiraRehetra.getLisitraHira().get(hiraFamaranana).constructHiraPresentation(path);
                slide.setText(ObjectUtility.sexifyToUpperCase(hiraFamaranana));
                slide.createSlide(ppt, this.getHiraPicture());
            }else if(key.equals("tapany_11")){
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, this.getTsodranoPicture());
            } else{
                slide.setText(temp.getTitle().toUpperCase());
                slide.createSlide(ppt, "");
            }
        }
    }
}
