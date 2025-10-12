package fjkm.agf.slidegenerator.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

@WebMvcTest(MainController.class)
public class MainControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testIndexPage() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("layout"))
                .andExpect(model().attributeExists("message"))
                .andExpect(model().attribute("message", "TONGASOA"));
    }

    @Test
    public void testFormProgrammePage() throws Exception {
        mockMvc.perform(get("/form-programme"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/#form-programme"));
    }

    @Test
    public void testFormHiraPage() throws Exception {
        mockMvc.perform(get("/form-hira"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/#form-hira"));
    }

    @Test
    public void testFormHiraMaroPage() throws Exception {
        mockMvc.perform(get("/form-hira-maro"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/#form-hira-maro"));
    }

    @Test
    public void testFormHiraRehetraPage() throws Exception {
        mockMvc.perform(get("/form-hira-rehetra"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/#form-hira-rehetra"));
    }

    @Test
    public void testErrorPage() throws Exception {
        mockMvc.perform(get("/error"))
                .andExpect(status().isOk())
                .andExpect(view().name("error"))
                .andExpect(model().attributeExists("message"));
    }

    @Test
    public void testSPAComponentEndpoint() throws Exception {
        mockMvc.perform(get("/component/home"))
                .andExpect(status().isOk())
                .andExpect(view().name("components/home"))
                .andExpect(model().attributeExists("list"));
    }
}