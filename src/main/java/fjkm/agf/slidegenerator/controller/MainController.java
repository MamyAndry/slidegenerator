package fjkm.agf.slidegenerator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fjkm.agf.slidegenerator.configuration.LitorjiaFJKM;
import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import fjkm.agf.slidegenerator.mapping.HiraRehetra;
import fjkm.agf.slidegenerator.mapping.SlideHiraMaroPecularitiesMapping;
import fjkm.agf.slidegenerator.mapping.SlidePecularitiesMappingVersionTwo;
import fjkm.agf.slidegenerator.utils.ObjectUtility;

@Controller
public class MainController {

    @GetMapping
    public String index(Model model) {
        HiraRehetra hiraRehetra = new HiraRehetra();
        try {
            hiraRehetra.init();
            model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());
            model.addAttribute("message", "TONGASOA");
            return "layout";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    // SPA Component endpoints
    @GetMapping("/component/{componentName}")
    public String getComponent(@PathVariable String componentName, Model model) {
        HiraRehetra hiraRehetra = new HiraRehetra();
        try {
            hiraRehetra.init();
            model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());

            // Return the component template
            return "components/" + componentName;
        } catch (Exception e) {
            model.addAttribute("message", "Tsy afaka naka ny pejy: " + e.getMessage());
            return "error";
        }
    }

    @GetMapping("error")
    public String error(Model model) {
        try {
            model.addAttribute("message", "Errora");
            return "error";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @GetMapping("form-programme")
    public String formPrograma(Model model) {
        // Redirect to SPA with hash
        return "redirect:/#form-programme";
    }

    @GetMapping("form-hira")
    public String formHira(Model model) {
        // Redirect to SPA with hash
        return "redirect:/#form-hira";
    }

    @GetMapping("form-hira-maro")
    public String formHiraMaro(Model model) {
        // Redirect to SPA with hash
        return "redirect:/#form-hira-maro";
    }

    @GetMapping("form-hira-rehetra")
    public String formHiraRehetra(Model model) {
        // Redirect to SPA with hash
        return "redirect:/#form-hira-rehetra";
    }

    @GetMapping("form-fandraisana")
    public String formFandraisana(Model model) {
        // Redirect to SPA with hash
        return "redirect:/#form-fandraisana";
    }

    @GetMapping("treatment-hira")
    public String treatmentHira(@RequestParam(name = "path") String path,
            @RequestParam(name = "fontFamily") String fontFamily, @RequestParam(name = "fontSize") double fontSize,
            @RequestParam(name = "hira") String hira, Model model) {
        HiraRehetra hiraRehetra = new HiraRehetra();
        try {
            hiraRehetra.init();
            hira = hira.replace(" ", "_").toLowerCase();
            HiraFihirana hiraHovokarina = hiraRehetra.getLisitraHira().get(hira);
            hiraHovokarina.setFontFamily(fontFamily);
            hiraHovokarina.setFontSize(fontSize);
            hiraHovokarina.constructHiraPresentation(path);
            String message = "Voaorina avokoa ny hira " + ObjectUtility.sexifyToUpperCase(hira);
            model.addAttribute("message", message);
            model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());
            return "redirect:/?success=" + java.net.URLEncoder.encode(message, "UTF-8") + "#form-hira";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @PostMapping("treatment-hira-maro")
    public String treatmentHiraMaro(@ModelAttribute SlideHiraMaroPecularitiesMapping pecularitiesMapping, Model model) {
        HiraRehetra hiraRehetra = new HiraRehetra();
        try {
            hiraRehetra.init();
            for (String hira : pecularitiesMapping.getHira()) {
                String hiraKey = hira.replace(" ", "_").toLowerCase();
                HiraFihirana hiraHovokarina = hiraRehetra.getLisitraHira().get(hiraKey);
                if (hiraHovokarina != null) {
                    hiraHovokarina.setFontFamily(pecularitiesMapping.getFontFamily());
                    hiraHovokarina.setFontSize(pecularitiesMapping.getFontSize());
                    hiraHovokarina.constructHiraPresentation(pecularitiesMapping.getPath());
                }
            }
            String message = "Voaorina avokoa ny hira "
                    + ObjectUtility.FromArrayToString(pecularitiesMapping.getHira(), ", ");
            return "redirect:/?success=" + java.net.URLEncoder.encode(message, "UTF-8");
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @GetMapping("treatment-hira-rehetra")
    public String treatmentHiraRehetra(@RequestParam(name = "path") String path,
            @RequestParam(name = "fontFamily") String fontFamily, @RequestParam(name = "fontSize") double fontSize,
            Model model) {
        HiraRehetra hiraRehetra = new HiraRehetra();
        try {
            hiraRehetra.init();
            hiraRehetra.generateAll(path, fontFamily, fontSize);
            String message = "Voaorina avokoa ny hira rehetra";
            return "redirect:/?success=" + java.net.URLEncoder.encode(message, "UTF-8");
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());
            return "error";
        }
    }

    @PostMapping("treatment-programa")
    public String treatProgramaSlide(@ModelAttribute SlidePecularitiesMappingVersionTwo pecularitiesMapping,
            Model model) {
        try {

            LitorjiaFJKM litorjia = new LitorjiaFJKM();
            litorjia.init();
            String[] asaVavolombelona = pecularitiesMapping.getAsaVavolombelona().split("\n");
            String[] asanAndriamanitra = pecularitiesMapping.getAsanAndriamanitra().split("\n");
            String[] vakiteny = pecularitiesMapping.getPerikopa().split("\n");
            litorjia.generateProgram(
                    pecularitiesMapping.getName(),
                    pecularitiesMapping.getFontFamily(),
                    pecularitiesMapping.getFontFamilyHira(),
                    pecularitiesMapping.getPath(),
                    pecularitiesMapping.getVakitenyFiderana(),
                    pecularitiesMapping.getVakitenySA(),
                    pecularitiesMapping.getFanekemPinoana(),
                    pecularitiesMapping.getEndriny(),
                    pecularitiesMapping.getHiraFidirana(),
                    pecularitiesMapping.getHiraFanehoana(),
                    pecularitiesMapping.getHiraFamaranana(),
                    vakiteny,
                    asaVavolombelona,
                    asanAndriamanitra,
                    pecularitiesMapping.getFontSize(),
                    pecularitiesMapping.getFontSizeHira(),
                    pecularitiesMapping.getImageOpacity(),
                    pecularitiesMapping.isFandraisana());
            String message = "Vita soa aman-tsara ny fanamboarana ny programa " + pecularitiesMapping.getName();
            return "redirect:/?success=" + java.net.URLEncoder.encode(message, "UTF-8") + "#form-hira-maro";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", e.toString());
            return "error";
        }
    }

}