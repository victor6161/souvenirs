package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import phone.iphone.IphoneJDBCTemplate;
import phone.iphone.Souvenir;

@Controller
public class ControllerBasket {
    
    @Autowired
    IphoneJDBCTemplate iphoneJDBCTemplate;
     
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
}
