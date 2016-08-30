package controllers;

import com.google.gson.Gson;
import com.itextpdf.text.DocumentException;

import java.io.ByteArrayInputStream;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import compare.ListCompare;

import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpRequest;
import pdf.PDFBuilder;
import phone.iphone.Souvenir;
import phone.iphone.IphoneJDBCTemplate;

@Controller
public class ControlleMain {

    @Autowired
    IphoneJDBCTemplate iphoneJDBCTemplate;

    @RequestMapping(value = {"/index", "/"}, method = RequestMethod.GET)
    public ModelAndView userSorexInfo(HttpSession session) {
        ModelAndView mv = new ModelAndView("index_iphone");
        session.setAttribute("page", "index");

        return mv;
    }

    @RequestMapping(value = "/iphones", method = RequestMethod.GET)
    public ModelAndView iphones(HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_all_iphone");

        List<Souvenir> listSouvenir1 = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir1);

       
        mv.addObject("listTitle", unuqieList((ArrayList<Souvenir>) listSouvenir1));

        session.setAttribute("page", "iphones");

        return mv;
    }

    @RequestMapping(value = "/iphone-{id}", method = RequestMethod.GET)
    public ModelAndView iphine(@PathVariable("id") String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_one_iphone");
        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        mv.addObject("souvenir", souvenir);
        session.setAttribute("page", "iphone-" + id);
        return mv;
    }

    @RequestMapping("/filter")
    public ModelAndView filter(HttpServletRequest request, HttpSession session) {//@ResponseBody чтобы не было перенаправление
        ModelAndView mv = new ModelAndView("ru_all_iphone");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        if (from.isEmpty()) {
            from = "0";
        }
        if (to.isEmpty()) {
            to = "2147483647";
        }

        String[] checks = request.getParameterValues("filter_title");

        List<Souvenir> listSouvenir1 = iphoneJDBCTemplate.getListSouvenir();
       

        mv.addObject("listTitle", unuqieList((ArrayList<Souvenir>) listSouvenir1));
        boolean bp;

        Iterator<Souvenir> iter = listSouvenir1.iterator();
        while (iter.hasNext()) {
            bp = false;
            Souvenir next = iter.next();
            if (checks != null) {
                for (String check : checks) {
                    //Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE, "next " + next.getTitle());                   
                    if (next.getTitle().equals(check)) {
                        bp = true;
                        break;
                    }
                }
            } else {
                bp = true;
            }
            if ((next.getPrice() < Integer.parseInt(from) || next.getPrice() > Integer.parseInt(to)) || !bp) {
                iter.remove();
            }
        }

        mv.addObject("listSouvenir", listSouvenir1);
        mv.addObject("customer_name", "Здравствуйте, " + session.getAttribute("username") + "!");
        return mv;
    }

    /// ------------ Compare : Start ----------------- 
    @RequestMapping(value = "/user", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public ModelAndView user(@RequestParam String customer, @RequestParam String password, HttpSession session) {
        ModelAndView mv = new ModelAndView("/index_iphone");

        
        session.setAttribute("username", customer);
        return mv;
    }

    @RequestMapping("/authentification")
    public ModelAndView authentification() {
        ModelAndView mv = new ModelAndView("/authentification");
        return mv;
    }
    
    private ArrayList<String> unuqieList(ArrayList<Souvenir> listSouvenir1){
         boolean uniqueTitle;
        ArrayList <String> listTitle = new ArrayList<>();
        for (int io = 0; io < listSouvenir1.size(); io++) {
            uniqueTitle=true;
            for (int ii = 0; ii < listTitle.size(); ii++) {
                if (listTitle.get(ii).equals(listSouvenir1.get(io).getTitle())) {
                    uniqueTitle = false;
                }
            }
            if (uniqueTitle) {
                listTitle.add(listSouvenir1.get(io).getTitle());
            }
        }
        return listTitle;
        
    }
}
