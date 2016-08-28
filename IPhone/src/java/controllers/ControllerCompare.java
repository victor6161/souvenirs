package controllers;

import compare.ListCompare;
import java.util.ArrayList;
import java.util.List;
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
public class ControllerCompare {

    @Autowired
    IphoneJDBCTemplate iphoneJDBCTemplate;

    @RequestMapping(value = "/compare", method = RequestMethod.GET)
    public ModelAndView compare(HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_compare");

        ListCompare listCompare = (ListCompare) session.getAttribute("object_for_compare");
        if (listCompare == null) {
            listCompare = new ListCompare();
        }
        mv.addObject("object", listCompare.getList());
        mv.addObject("customer_name", "Здравствуйте, " + session.getAttribute("username") + "!");
        return mv;
    }

    @RequestMapping("/add-product-to-compare-list")
    public @ResponseBody
    ModelAndView addProductToCompareList(@RequestParam(value = "id") String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_all_iphone");
        Souvenir souvenir = iphoneJDBCTemplate.getSouvenir(id);
        ListCompare listCompare = (ListCompare) session.getAttribute("object_for_compare");
        int i;
        if (listCompare == null) {
            listCompare = new ListCompare();
            i = 0;
        }

        listCompare.addSouvenir(souvenir);
        session.setAttribute("object_for_compare", listCompare);

        //!!!!! 
        List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
        mv.addObject("listSouvenir", listSouvenir);

        ArrayList listTitle = new ArrayList();
        for (i = 0; i < listSouvenir.size(); i++) {
            listTitle.add(listSouvenir.get(i).getTitle());
        }

        mv.addObject("listTitle", listTitle);
        mv.addObject("customer_name", "Здравствуйте, " + session.getAttribute("username") + "!");
        return mv;
    }

    @RequestMapping("/del-product-from-compare-list")
    public @ResponseBody
    ModelAndView delProductFromCompareList(@RequestParam(value = "id") String id, HttpSession session) {
        ModelAndView mv = new ModelAndView("ru_compare");
        ListCompare listCompare = (ListCompare) session.getAttribute("object_for_compare");
        listCompare.removeSouvenir(id);
        session.setAttribute("object_for_compare", listCompare);

        mv.addObject("object", listCompare.getList());
        mv.addObject("customer_name", "Здравствуйте, " + session.getAttribute("username") + "!");
        return mv;
    }
}
