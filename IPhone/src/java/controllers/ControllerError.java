package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerError {

    @RequestMapping(value = "/error-{id}", method = RequestMethod.GET)
    public ModelAndView userSorexInfo(@PathVariable("id") String err) {
        ModelAndView mv = new ModelAndView("error");
        
        mv.addObject("err", err);
        return mv;
    }
}
