package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
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
    private ArrayList<String> id;

    //@RequestMapping(value = "/add-product-to-customer-basket", method = RequestMethod.GET, produces = {"text/html;charset=UTF-8"})
    @RequestMapping(value = "/add-product-to-customer-basket")
    public @ResponseBody
    ModelAndView addProductToCustomerBasket(@RequestParam String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_all_iphone");

        Integer totalPrice = (Integer) session.getAttribute("total_price");
        if (totalPrice == null) {
            totalPrice = 0;
        }

        ArrayList<String> arrayListId = (ArrayList<String>) session.getAttribute("idInBascet");
        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        if (arrayListId == null) {
            arrayListId = new ArrayList<>();
            arrayListId.add(id);
            totalPrice = souvenir.getPrice() + totalPrice;
        } else if (!arrayListId.contains(id)) {
            arrayListId.add(id);

            totalPrice = totalPrice + souvenir.getPrice();
        }

        //обновление страницы
        List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir);

        ArrayList listTitle = new ArrayList();
        for (int i = 0; i < listSouvenir.size(); i++) {
            listTitle.add(listSouvenir.get(i).getTitle());
        }

        mv.addObject("listTitle", listTitle);

        session.setAttribute("total_price", totalPrice);
        session.setAttribute("idInBascet", arrayListId);
        return mv;
    }

    @RequestMapping(value = "/basket")
    public ModelAndView basket(HttpSession session) {
        ModelAndView mv = new ModelAndView("basket");
        id = (ArrayList<String>) session.getAttribute("idInBascet");
        if (id == null) {
            id = new ArrayList<>();
        }
        ArrayList<Souvenir> arrayList = new ArrayList<>();

        for (int i = 0; i < id.size(); i++) {
            arrayList.add(iphoneJDBCTemplate.getSouvenir(id.get(i)));
        }

        mv.addObject("arrayGoods", arrayList);
        return mv;
    }

    @RequestMapping(value = "/del-product-from-customer-basket")
    public @ResponseBody
    ModelAndView delProductFromCustomerBasket(@RequestParam String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("basket");
        ArrayList<String> idList = (ArrayList<String>) session.getAttribute("idInBascet");
        Integer totalPrice = (Integer) session.getAttribute("total_price");
        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        if (idList.contains(id)) {
            idList.remove(id);
            totalPrice = totalPrice - souvenir.getPrice();
        }
        ArrayList<Souvenir> arrayList = new ArrayList<>();
        for (int i = 0; i < idList.size(); i++) {
            arrayList.add(iphoneJDBCTemplate.getSouvenir(idList.get(i)));
        }
        mv.addObject("arrayGoods", arrayList);

        session.setAttribute("total_price", totalPrice);
        session.setAttribute("idInBascet", idList);
        return mv;
    }

    @RequestMapping(value = "/order")
    public @ResponseBody
    ModelAndView order(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView("basket");

        ArrayList<String> idList = (ArrayList<String>) session.getAttribute("idInBascet");
        if (idList == null) {
            return mv;
        }
        
        for (String idList1 : idList) {
            Map namedParameters = new HashMap();
            namedParameters.put("customer_name", request.getParameter("customer_name"));
            namedParameters.put("phone", request.getParameter("phone"));
            namedParameters.put("email", request.getParameter("email"));
            namedParameters.put("id_good", idList1);
            //amount??
            iphoneJDBCTemplate.setOrder(namedParameters);
        }
        session.setAttribute("order_succesful", "The order is successful.Managers will contact you.");
        session.setAttribute("idInBascet", idList);
        return mv;
    }
}
