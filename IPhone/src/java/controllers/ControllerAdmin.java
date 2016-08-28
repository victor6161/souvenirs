package controllers;

import com.itextpdf.text.DocumentException;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pdf.PDFBuilder;
import phone.iphone.IphoneJDBCTemplate;
import phone.iphone.Souvenir;

@Controller
public class ControllerAdmin {
    
    @Autowired
    IphoneJDBCTemplate iphoneJDBCTemplate;
    
    @RequestMapping("/login_admin")
    public ModelAndView loginAdmin() {
        ModelAndView mv = new ModelAndView("/login_admin");
        return mv;
    }
    
    @RequestMapping("/admin")
    public ModelAndView admin(HttpServletRequest request) {
        if (request.getParameter("username").equals("admin")) {
            ModelAndView mv = new ModelAndView("/admin");
            List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
            mv.addObject("objects", listSouvenir);
            return mv;
        } else {
            return new ModelAndView("/index_iphone");
        }
    }
    
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile multipartFile) {
        ModelAndView mv = new ModelAndView("/admin");
        if (!multipartFile.isEmpty()) {
            try {
                HSSFWorkbook myExcelBook = new HSSFWorkbook(new ByteArrayInputStream(multipartFile.getBytes()));
                HSSFSheet myExcelSheet = myExcelBook.getSheet("Лист1");

                Map namedParameters = new HashMap();
                namedParameters.put("id", myExcelSheet.getRow(0).getCell(1).getStringCellValue());
                namedParameters.put("title", myExcelSheet.getRow(1).getCell(1).getStringCellValue());
                namedParameters.put("lacquer", myExcelSheet.getRow(2).getCell(1).getStringCellValue());
                namedParameters.put("fastening", myExcelSheet.getRow(3).getCell(1).getStringCellValue());
                namedParameters.put("bevel", myExcelSheet.getRow(4).getCell(1).getStringCellValue());
                namedParameters.put("length", myExcelSheet.getRow(5).getCell(1).getNumericCellValue());
                namedParameters.put("weight", myExcelSheet.getRow(6).getCell(1).getNumericCellValue());
                namedParameters.put("thickness", myExcelSheet.getRow(7).getCell(1).getNumericCellValue());
                namedParameters.put("price", myExcelSheet.getRow(8).getCell(1).getNumericCellValue());
                namedParameters.put("photo1", myExcelSheet.getRow(9).getCell(1).getStringCellValue());
                namedParameters.put("photo2", myExcelSheet.getRow(10).getCell(1).getStringCellValue());
                namedParameters.put("photo3", myExcelSheet.getRow(11).getCell(1).getStringCellValue());
                namedParameters.put("photo4", myExcelSheet.getRow(12).getCell(1).getStringCellValue());
                namedParameters.put("photo5", myExcelSheet.getRow(13).getCell(1).getStringCellValue());
                namedParameters.put("description", myExcelSheet.getRow(14).getCell(1).getStringCellValue());

                List<Souvenir> listSouvenirTest = iphoneJDBCTemplate.getListSouvenir();

                boolean uniqueKey = true;
                for (int i = 0; i < listSouvenirTest.size(); i++) {
                    if (listSouvenirTest.get(i).getId().equals(myExcelSheet.getRow(0).getCell(1).getStringCellValue())) {
                        uniqueKey = false;
                    }
                }

                if (uniqueKey) {
                    iphoneJDBCTemplate.setSouvenir(namedParameters);
                }

                List<Souvenir> listSouvenir = iphoneJDBCTemplate.getListSouvenir();
                mv.addObject("objects", listSouvenir);
                return mv;

            } catch (IOException ex) {
                Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE, null, ex);
                return mv;
            }
        }
        return mv;
    }
    
    @RequestMapping(value = "/generatePDF", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView generatePDF(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("/admin");
        List<Souvenir> listSouvenir1 = iphoneJDBCTemplate.getListSouvenir();
        List<Souvenir> listSouvenir2 = new ArrayList();
        String[] checks = request.getParameterValues("print");

        //  Logger.getLogger(ControllerIphone.class.getName()).log(Level.SEVERE,request.getParameter("factory") );
        for (int i1 = 0; i1 < listSouvenir1.size(); i1++) {
            for (String check : checks) {
                if (listSouvenir1.get(i1).getId().equals(check)) {
                    listSouvenir2.add(listSouvenir1.get(i1));
                }
            }
        }
        try {
            new PDFBuilder().generatePDF(listSouvenir2, request, response);
        } catch (DocumentException | IOException ex) {
            Logger.getLogger(ControlleMain.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mv;
    }
    
}
