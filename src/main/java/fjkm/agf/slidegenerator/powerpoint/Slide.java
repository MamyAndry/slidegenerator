package fjkm.agf.slidegenerator.powerpoint;


import java.awt.Color;
import java.awt.image.BufferedImage;
import java.awt.AlphaComposite;
import java.io.ByteArrayOutputStream;
import java.io.File;
import javax.imageio.ImageIO;

import java.awt.geom.Rectangle2D;
import java.awt.Graphics2D;

import org.apache.poi.sl.usermodel.TextParagraph.TextAlign;

import org.apache.poi.sl.usermodel.PictureData;
import org.apache.poi.xslf.usermodel.SlideLayout;
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFPictureData;
import org.apache.poi.xslf.usermodel.XSLFPictureShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFSlideLayout;
import org.apache.poi.xslf.usermodel.XSLFSlideMaster;
import org.apache.poi.xslf.usermodel.XSLFTextParagraph;
import org.apache.poi.xslf.usermodel.XSLFTextRun;
import org.apache.poi.xslf.usermodel.XSLFTextShape;

import fjkm.agf.slidegenerator.utils.Misc;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Slide {
    String text;
    boolean bold = false;
    Color color = Color.BLACK;
    double fontSize = 88.0;
    String fontFamily = "Cambria";
    double imageOpacity = 30.0;

    public int calculOpacity(double percentage){
        return (int) (255 * percentage) / 100;
    }

    public BufferedImage changeOpacityOfImage(String fileName, double percentage) throws Exception{
        BufferedImage originalImage = ImageIO.read(new File(Misc.getImagesLocation() + File.separator +  fileName));

        // Adjust opacity (example: 0.5 opacity)
        int opacity = calculOpacity(percentage); // 0 (transparent) to 255 (opaque)
        
        BufferedImage modifiedImage = new BufferedImage(originalImage.getWidth(), originalImage.getHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = modifiedImage.createGraphics();
        g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, (float) opacity / 255f));
        g.drawImage(originalImage, 0, 0, null);
        g.dispose();
        return modifiedImage;
    }

    public void createSlideHira(XMLSlideShow ppt) throws Exception{
        //ADDING A SLIDE
        XSLFSlideMaster defaultMaster = ppt.getSlideMasters().get(0);
        
        //ADDING THE LAYOUT
        XSLFSlideLayout layout = defaultMaster.getLayout(SlideLayout.TITLE);
        XSLFSlide slide = ppt.createSlide(layout);


        // Set background image
        // ByteArrayOutputStream baos = new ByteArrayOutputStream();
        // ImageIO.write(this.changeOpacityOfImage("SL-103020-37400-03.jpg", this.getImageOpacity()), "png", baos);
        // byte[] pictureData = baos.toByteArray();

        // XSLFPictureData pictureIndex = ppt.addPicture(pictureData, PictureData.PictureType.PNG);

        // XSLFPictureShape pic = slide.createPicture(pictureIndex);
        // pic.setAnchor(new Rectangle2D.Double(0, 0, ppt.getPageSize().getWidth(), ppt.getPageSize().getHeight()));
            
        //ADDING CONTENT
        XSLFTextShape titleShape = slide.getPlaceholder(0);
        titleShape.clearText();   
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        p.setTextAlign(TextAlign.CENTER);
        XSLFTextRun r = p.addNewTextRun();  
        r.setText(this.getText());
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        XSLFTextShape subTitleShape = slide.getPlaceholder(1);
        subTitleShape.clearText();  
    }

    public void createSlideVakiteny(XMLSlideShow ppt, String picture) throws Exception{
        //ADDING A SLIDE
        XSLFSlideMaster defaultMaster = ppt.getSlideMasters().get(0);
        
        //ADDING THE LAYOUT
        XSLFSlideLayout layout = defaultMaster.getLayout(SlideLayout.TITLE_AND_CONTENT);
        XSLFSlide slide = ppt.createSlide(layout);

        if(!picture.equals("")){
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(this.changeOpacityOfImage(picture, this.getImageOpacity()), "png", baos);
            byte[] pictureData = baos.toByteArray();

            XSLFPictureData pictureIndex = ppt.addPicture(pictureData, PictureData.PictureType.PNG);

            XSLFPictureShape pic = slide.createPicture(pictureIndex);
            pic.setAnchor(new Rectangle2D.Double(0, 0, ppt.getPageSize().getWidth(), ppt.getPageSize().getHeight()));
        }
        
        //ADDING CONTENT
        XSLFTextShape titleShape = slide.getPlaceholder(0);
        titleShape.clearText();   
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        p.setTextAlign(TextAlign.CENTER);
        XSLFTextRun r = p.addNewTextRun();  
        r.setText("VAKITENY");
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        XSLFTextShape contentShape = slide.getPlaceholder(1);
        contentShape.clearText();
        XSLFTextParagraph p2 = contentShape.addNewTextParagraph();
        p2.setTextAlign(TextAlign.CENTER);
        XSLFTextRun r2 = p2
        .addNewTextRun();  
        r2.setText(this.getText());
        r2.setBold(this.isBold());
        r2.setFontFamily(this.getFontFamily());
        r2.setFontColor(this.getColor());
        r2.setFontSize(this.getFontSize()); 

    }

    public void createSlide(XMLSlideShow ppt, String picture) throws Exception{
        //ADDING A SLIDE
        XSLFSlideMaster defaultMaster = ppt.getSlideMasters().get(0);
        
        //ADDING THE LAYOUT
        XSLFSlideLayout layout = defaultMaster.getLayout(SlideLayout.TITLE);
        XSLFSlide slide = ppt.createSlide(layout);

        if(!picture.equals("")){
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(this.changeOpacityOfImage(picture, this.getImageOpacity()), "png", baos);
            byte[] pictureData = baos.toByteArray();

            XSLFPictureData pictureIndex = ppt.addPicture(pictureData, PictureData.PictureType.PNG);

            XSLFPictureShape pic = slide.createPicture(pictureIndex);
            pic.setAnchor(new Rectangle2D.Double(0, 0, ppt.getPageSize().getWidth(), ppt.getPageSize().getHeight()));
        }
        
        //ADDING CONTENT
        XSLFTextShape titleShape = slide.getPlaceholder(0);
        titleShape.clearText();   
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        XSLFTextRun r = p.addNewTextRun();  
        p.setTextAlign(TextAlign.CENTER);
        r.setText(this.getText().toUpperCase());
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        XSLFTextShape subTitleShape = slide.getPlaceholder(1);
        subTitleShape.clearText();  
    }
}
