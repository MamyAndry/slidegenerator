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
import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFPictureData;
import org.apache.poi.xslf.usermodel.XSLFPictureShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFTextParagraph;
import org.apache.poi.xslf.usermodel.XSLFTextRun;
import org.apache.poi.xslf.usermodel.XSLFTextShape;

import fjkm.agf.slidegenerator.utils.Misc;
import lombok.Getter;
import lombok.Setter;

import java.awt.*;

@Getter
@Setter
public class Slide {
    int slideWidth = 1920;
    // int slideheight = 1440; // 4:3 aspect ratio
    int slideheight = 1080; // 16:9 aspect ratio
    String text;
    boolean bold = false;
    Color color = Color.BLACK;
    double fontSize = 88.0;
    String fontFamily = "Cambria";
    double imageOpacity = 30.0;
    boolean isSetHigher = false;

    public int calculOpacity(double percentage) {
        return (int) (255 * percentage) / 100;
    }

    public BufferedImage changeOpacityOfImage(String fileName, double percentage) throws Exception {
        BufferedImage originalImage = ImageIO.read(new File(Misc.getImagesLocation() + File.separator + fileName));

        // Adjust opacity (example: 0.5 opacity)
        int opacity = calculOpacity(percentage); // 0 (transparent) to 255 (opaque)

        BufferedImage modifiedImage = new BufferedImage(originalImage.getWidth(), originalImage.getHeight(),
            BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = modifiedImage.createGraphics();
        g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, (float) opacity / 255f));
        g.drawImage(originalImage, 0, 0, null);
        g.dispose();
        return modifiedImage;
    }

    public void createSlideHira(XMLSlideShow ppt) throws Exception {
        if(this.getText().equals(""))
            return;
        ppt.setPageSize(new java.awt.Dimension(this.slideWidth, this.slideheight)); // Set width to 1920 and height to 1080

        // Adding a slide (no layout)
        XSLFSlide slide = ppt.createSlide();

        // Adding title text directly (no placeholder, just text box)
        XSLFTextShape titleShape = slide.createTextBox();
        String titleText = this.getText().toUpperCase(); // Your title text

        // Create text paragraph and run
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        XSLFTextRun r = p.addNewTextRun();
        p.setTextAlign(TextAlign.CENTER); // Center text horizontally
        r.setText(titleText);
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        // Center the title text box
        int slideWidth = ppt.getPageSize().width;
        int slideHeight = ppt.getPageSize().height;
        int titleHeight = ppt.getPageSize().height / 2; // Adjust based on the font size

        titleShape.setAnchor(
            new Rectangle(0, (slideHeight - titleHeight) / 4, slideWidth, titleHeight)
        );
    }

    public void createSlideVakiteny(XMLSlideShow ppt, String picture) throws Exception {
        ppt.setPageSize(new java.awt.Dimension(this.slideWidth, this.slideheight)); // Set width to 1920 and height to 1080

        // Adding a slide (no layout)
        XSLFSlide slide = ppt.createSlide();

        // Adding the picture if it's provided
        if (!picture.equals("")) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(this.changeOpacityOfImage(picture, this.getImageOpacity()), "png", baos);
            byte[] pictureData = baos.toByteArray();

            // Add the picture to the slide
            XSLFPictureData pictureIndex = ppt.addPicture(pictureData, PictureData.PictureType.PNG);
            XSLFPictureShape pic = slide.createPicture(pictureIndex);

            // Set the picture size to match the new slide size
            pic.setAnchor(new Rectangle2D.Double(0, 0, ppt.getPageSize().getWidth(), ppt.getPageSize().getHeight()));
        }

        // Adding title text directly (no placeholder, just text box)
        XSLFTextShape titleShape = slide.createTextBox();
        String titleText = "VAKITENY"; // Your title text

        // Create text paragraph and run
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        XSLFTextRun r = p.addNewTextRun();
        p.setTextAlign(TextAlign.CENTER); // Center text horizontally
        r.setText(titleText);
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        // Center the title text box
        int slideWidth = ppt.getPageSize().width;
        int slideHeight = ppt.getPageSize().height;
        int titleHeight = ppt.getPageSize().height / 2; // Adjust based on the font size

        // Create a new text box for the list
        XSLFTextShape listShape = slide.createTextBox();
        XSLFTextParagraph listParagraph = listShape.addNewTextParagraph();
        listParagraph.setTextAlign(TextAlign.LEFT);
        listParagraph.setBullet(true);
        XSLFTextRun listRun = listParagraph.addNewTextRun();
        listRun.setText(this.getText());
        listRun.setFontFamily(this.getFontFamily());
        listRun.setFontColor(this.getColor());
        listRun.setFontSize(this.getFontSize() - 20);
        listRun.setBold(this.isBold());

        // Position the list text box below the title
        int listHeight = slideHeight / 2;
        // Position the title text box at the top of the slide
        titleShape.setAnchor(
            new Rectangle(0, 0, slideWidth, titleHeight)
        );
        listShape.setAnchor(
            new Rectangle(0, (slideHeight + titleHeight) / 4, slideWidth, listHeight)
        );

    }

    public void createSlide(XMLSlideShow ppt, String picture) throws Exception {
        ppt.setPageSize(new java.awt.Dimension(this.slideWidth, this.slideheight)); // Set width to 1920 and height to 1080

        // Adding a slide (no layout)
        XSLFSlide slide = ppt.createSlide();

        // Adding the picture if it's provided
        if (!picture.equals("")) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(this.changeOpacityOfImage(picture, this.getImageOpacity()), "png", baos);
            byte[] pictureData = baos.toByteArray();

            // Add the picture to the slide
            XSLFPictureData pictureIndex = ppt.addPicture(pictureData, PictureData.PictureType.PNG);
            XSLFPictureShape pic = slide.createPicture(pictureIndex);

            // Set the picture size to match the new slide size
            pic.setAnchor(new Rectangle2D.Double(0, 0, ppt.getPageSize().getWidth(), ppt.getPageSize().getHeight()));
        }

        // Adding title text directly (no placeholder, just text box)
        XSLFTextShape titleShape = slide.createTextBox();
        String titleText = this.getText().toUpperCase(); // Your title text

        // Create text paragraph and run
        XSLFTextParagraph p = titleShape.addNewTextParagraph();
        XSLFTextRun r = p.addNewTextRun();
        p.setTextAlign(TextAlign.CENTER); // Center text horizontally
        r.setText(titleText);
        r.setBold(this.isBold());
        r.setFontFamily(this.getFontFamily());
        r.setFontColor(this.getColor());
        r.setFontSize(this.getFontSize());

        // Center the title text box
        int slideWidth = ppt.getPageSize().width;
        int slideHeight = ppt.getPageSize().height;
        int titleHeight = ppt.getPageSize().height / 2; // Adjust based on the font size
        titleShape.setAnchor(
                new Rectangle(0, (slideHeight - titleHeight) / 4, slideWidth, titleHeight)
        );
    }
}
