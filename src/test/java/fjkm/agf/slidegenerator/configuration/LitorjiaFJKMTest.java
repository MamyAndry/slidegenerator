package fjkm.agf.slidegenerator.configuration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xslf.usermodel.XMLSlideShow;
import org.apache.poi.xslf.usermodel.XSLFShape;
import org.apache.poi.xslf.usermodel.XSLFSlide;
import org.apache.poi.xslf.usermodel.XSLFTextShape;
import org.junit.jupiter.api.io.TempDir;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

class LitorjiaFJKMTest {

    private static final String VAKITENY_FIDERANA = "Salamo 23";
    private static final String ASAN_ANDRIAMANITRA = "Andalana fitsapana";

    @TempDir
    Path outputDir;

    // endriny_1 titles this section "Fiderana an'\nAndriamanitra"; the others omit the line break.
    @ParameterizedTest
    @ValueSource(strings = { "endriny_1", "endriny_2", "endriny_3" })
    void vakitenyFideranaAppearsWhateverTheTitleSpelling(String endriny) throws Exception {
        assertTrue(generateProgramTexts(endriny).contains(VAKITENY_FIDERANA.toUpperCase()),
                "Reading should have its own slide in " + endriny);
    }

    // endriny_2 titles this section "Asan'\nAndriamanitra"; the others omit the line break.
    @ParameterizedTest
    @ValueSource(strings = { "endriny_2", "endriny_3", "endriny_4", "fahafatesana" })
    void asanAndriamanitraLinesAppearWhateverTheTitleSpelling(String endriny) throws Exception {
        assertTrue(generateProgramTexts(endriny).contains(ASAN_ANDRIAMANITRA.toUpperCase()),
                "Typed line should have its own slide in " + endriny);
    }

    // These have gaps in their tapany numbering, and their last section comes after the gaps.
    @ParameterizedTest
    @ValueSource(strings = { "endriny_4", "fahafatesana" })
    void numberingGapsDoNotLoseLaterSections(String endriny) throws Exception {
        assertTrue(generateProgramTexts(endriny).contains("FIRAVANA"),
                "Last section should be generated in " + endriny);
    }

    private List<String> generateProgramTexts(String endriny) throws Exception {
        LitorjiaFJKM litorjia = new LitorjiaFJKM();
        litorjia.init();
        litorjia.generateProgram(
                "programa", "Calibri", "Calibri", outputDir.toString(),
                VAKITENY_FIDERANA, "Matio 5:1-12", "Apostolika", endriny,
                "ffpm_001", "", "",
                new String[] { "Jaona 1:1" },
                new String[] { "" },
                new String[] { ASAN_ANDRIAMANITRA },
                80.0, 80.0, 30.0, false);

        List<String> texts = new ArrayList<>();
        try (InputStream in = Files.newInputStream(outputDir.resolve("programa.pptx"));
                XMLSlideShow ppt = new XMLSlideShow(in)) {
            for (XSLFSlide slide : ppt.getSlides()) {
                for (XSLFShape shape : slide.getShapes()) {
                    if (shape instanceof XSLFTextShape textShape) {
                        texts.add(textShape.getText().trim());
                    }
                }
            }
        }
        return texts;
    }
}
