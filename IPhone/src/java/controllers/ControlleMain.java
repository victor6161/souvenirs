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

        List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir);

        ArrayList listTitle = new ArrayList();
        for (int i = 0; i < listSouvenir.size(); i++) {
            listTitle.add(listSouvenir.get(i).getTitle());
        }

        mv.addObject("listTitle", listTitle);

        session.setAttribute("page", "iphones");
        mv.addObject("customer_name", "Здравствуйте, " + session.getAttribute("username") + "!");
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
    public ModelAndView filter(HttpServletRequest request,HttpSession session) {//@ResponseBody чтобы не было перенаправление
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
        
        ArrayList listTitle = new ArrayList();
        for (int i = 0; i < listSouvenir1.size(); i++) {
            listTitle.add(listSouvenir1.get(i).getTitle());
        }
        mv.addObject("listTitle", listTitle);
        boolean bp;

        Iterator<Souvenir> iter = listSouvenir1.iterator();
        while (iter.hasNext()) {
            bp = false;
            Souvenir next = iter.next();
            if (checks != null) {
                for (String check : checks) {
                    //Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE, "next " + next.getTitle());
                   // Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE, "check " + check);
                    if (next.getTitle().equals(check)) {
                        bp = true;
                        break;
                    }
                }
            }else{
                bp=true;
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
    
    @RequestMapping("/add-product-to-customer-basket")
    public @ResponseBody
    ModelAndView addProductToCustomerBasket(@RequestParam(value = "id") String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_all_iphone");

//        Logger.getLogger(ControllerSouvenirMain.class.getName()).log(Level.SEVERE, (String) session.getAttribute("username"));
        Map map = new HashMap();
        map.put("id_good", id);
        map.put("customer_name", session.getAttribute("username"));

        iphoneJDBCTemplate.addOrder(map);

        Integer totalPrice = (Integer) session.getAttribute("total_price");
        if (totalPrice == null) {
            totalPrice = 0;
        }

        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        totalPrice = totalPrice + souvenir.getPrice();

        List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir);

        ArrayList listTitle = new ArrayList();

        for (int i = 0; i < listSouvenir.size(); i++) {
            listTitle.add(listSouvenir.get(i).getTitle());
        }
        session.setAttribute("total_price", totalPrice);
        mv.addObject("customer_name", "Здравствуйте," + session.getAttribute("username") + "!");
        mv.addObject("total_price", totalPrice);
        mv.addObject("listTitle", listTitle);
        return mv;
    }

 

    @RequestMapping(value = "/user", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public ModelAndView user(@RequestParam String customer, @RequestParam String password, HttpSession session) {
        ModelAndView mv = new ModelAndView("/index_iphone");
       
        mv.addObject("customer_name", "Здравствуйте, " + customer + "!");
        session.setAttribute("username", customer);
        return mv;
    }

    @RequestMapping("/login_admin")
    public ModelAndView loginAdmin() {
        ModelAndView mv = new ModelAndView("/login_admin");
        return mv;
    }
    
    @RequestMapping("/authentification")
    public ModelAndView authentification() {
        ModelAndView mv = new ModelAndView("/authentification");
        return mv;
    }
}
