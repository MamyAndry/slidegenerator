package fjkm.agf.slidegenerator.powerpoint;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.poi.xslf.usermodel.XMLSlideShow;


public class Presentation {

    public static XMLSlideShow newPresentation(){
        //CREATING NEW PRESENTATION
        return new XMLSlideShow();
    }


    public static void save(XMLSlideShow ppt, String path, String name) throws Exception{
        //SAVING PRESENTATION
        String presentation = path + File.separator + name;
        FileOutputStream out = new FileOutputStream(presentation);
        ppt.write(out);
        ppt.close();
        out.close();
    }
}
