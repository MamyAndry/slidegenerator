package fjkm.agf.slidegenerator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import fjkm.agf.slidegenerator.configuration.LitorjiaFJKM;
import fjkm.agf.slidegenerator.hiracomponents.HiraFihirana;
import fjkm.agf.slidegenerator.mapping.HiraRehetra;
import fjkm.agf.slidegenerator.mapping.SlidePecularitiesMapping;
import fjkm.agf.slidegenerator.utils.ObjectUtility;

import org.springframework.web.bind.annotation.RequestParam;




    @Controller
    public class MainController {   

        @GetMapping
        public String index(Model model){
            model.addAttribute("message", "TONGASOA");
            // String[] list = {};
            // model.addAttribute("list", list);
            return "index";
        }

        @GetMapping("form-programme")
        public String formPrograma(Model model){
            HiraRehetra hiraRehetra = new HiraRehetra();
            try {
                hiraRehetra.init();
                model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());
                return "form-programme";
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
                return "error";
            }
        }

        @GetMapping("form-hira")
        public String formHira(Model model) {
            HiraRehetra hiraRehetra = new HiraRehetra();
            try {
                hiraRehetra.init();
                model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());
                return "form-hira";
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
                return "error";
            }
        }

        @GetMapping("form-hira-rehetra")
        public String formHiraRehetra(Model model) {
            HiraRehetra hiraRehetra = new HiraRehetra();
            try {
                hiraRehetra.init();
                model.addAttribute("list", hiraRehetra.getLisitraNomeraoHira());
                return "form-hira-rehetra";
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
                return "error";
            }
        }
        @GetMapping("treatment-hira")
        public String treatmentHira(@RequestParam(name = "path") String path, @RequestParam(name = "fontFamily") String fontFamily, @RequestParam(name = "fontSize") double fontSize, @RequestParam(name = "hira") String hira, Model model) {
            HiraRehetra hiraRehetra = new HiraRehetra();
            try {
                hiraRehetra.init();
                HiraFihirana hiraHovokarina = hiraRehetra.getLisitraHira().get(hira);
                hiraHovokarina.setFontFamily(fontFamily);
                hiraHovokarina.setFontSize(fontSize);
                hiraHovokarina.constructHiraPresentation(path); 
                String message = "Voaorina avokoa ny hira " + ObjectUtility.sexifyToUpperCase(hira);
                model.addAttribute("message", message);
                return "index";
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
                return "error";
            }
        }
        @GetMapping("treatment-hira-rehetra")
        public String treatmentHiraRehetra(@RequestParam(name = "path") String path, @RequestParam(name = "fontFamily") String fontFamily, @RequestParam(name = "fontSize") double fontSize, Model model) {
            HiraRehetra hiraRehetra = new HiraRehetra();
            try {
                hiraRehetra.init();
                hiraRehetra.generateAll(path, fontFamily, fontSize);
                String message = "Voaorina avokoa ny hira rehetra";
                model.addAttribute("message", message);
                return "index";
            } catch (Exception e) {
                model.addAttribute("message", e.getMessage());
                return "error";
            }
        }
        

        @PostMapping("treatment-programa")
        public String treatProgramaSlide(@ModelAttribute SlidePecularitiesMapping pecularitiesMapping, Model model) {
            try{
                
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
                    pecularitiesMapping.getHira(),
                    pecularitiesMapping.getHiraRakitra(),
                    vakiteny,
                    asaVavolombelona,
                    asanAndriamanitra,
                    pecularitiesMapping.getHiraFizarana(),
                    pecularitiesMapping.getHiraFanangonana(),
                    pecularitiesMapping.getFontSize(),
                    pecularitiesMapping.getFontSizeHira(),
                    pecularitiesMapping.getImageOpacity(),
                    pecularitiesMapping.isFandraisana()
            );
                model.addAttribute("message", "Vita soa aman-tsara ny fanamboarana");
                return "index";
            }catch(Exception e){
                e.printStackTrace();
                model.addAttribute("message", e.toString());
                return "error";
            }
        }
        
        
        
    }    