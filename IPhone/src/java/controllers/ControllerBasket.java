package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import phone.iphone.IphoneJDBCTemplate;
import phone.iphone.Souvenir;

@Controller
public class ControllerBasket {

    @Autowired
    IphoneJDBCTemplate iphoneJDBCTemplate;

    //@RequestMapping(value = "/add-product-to-customer-basket", method = RequestMethod.GET, produces = {"text/html;charset=UTF-8"})
    @RequestMapping(value="/add-product-to-customer-basket" )
    public @ResponseBody
    ModelAndView addProductToCustomerBasket(@RequestParam String id, HttpSession session) {

        ModelAndView mv = new ModelAndView("ru_all_iphone");

        Integer totalPrice = (Integer) session.getAttribute("total_price");
        if (totalPrice == null) {
            totalPrice = 0;
        }
        
         ArrayList <String> arrayListId = (ArrayList <String>) session.getAttribute("idInBascet");
        if (arrayListId==null) {
            arrayListId = new ArrayList<>();
        }
        arrayListId.add(id);
        for(int i=0;i<arrayListId.size();i++){
            Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE,arrayListId.get(i));
        }
        List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir);

        ArrayList listTitle = new ArrayList();
        for (int i = 0; i < listSouvenir.size(); i++) {
            listTitle.add(listSouvenir.get(i).getTitle());
        }

        mv.addObject("listTitle", listTitle);
         // Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE,b.toString());
        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        totalPrice = totalPrice + souvenir.getPrice();
        
        session.setAttribute("total_price", totalPrice);
        session.setAttribute("idInBascet", arrayListId);
        return mv;
    }
    
    @RequestMapping(value="/basket" )
    public ModelAndView basket(HttpSession session) {
        ModelAndView mv = new ModelAndView("basket");
        ArrayList<String> id=(ArrayList<String>)session.getAttribute("idInBascet");
        if(id==null){
            id=new ArrayList<String>();
        }
        ArrayList<Souvenir> arrayList =new ArrayList<>();
        
        for(int i=0;i<id.size();i++){
            arrayList.add(iphoneJDBCTemplate.getSouvenir(id.get(i)));
        }
        
        mv.addObject("arrayList",arrayList);
        return mv;
        
    }
    
    }
    
    

