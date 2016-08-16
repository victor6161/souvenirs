package pdf;

import com.itextpdf.text.Chapter;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import controllers.ControlleMain;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phone.iphone.Souvenir;

public class PDFBuilder {

    public void generatePDF(List<Souvenir> listSouvenir, HttpServletRequest request, HttpServletResponse response) throws DocumentException, IOException {

        Document document = new Document();

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        PdfWriter.getInstance(document, baos);

        document.open();
        BaseFont times = BaseFont.createFont("c:/windows/fonts/times.ttf", "cp1251", BaseFont.EMBEDDED);
        Font font = new Font(times, 14);
       // Image image1 = Image.getInstance("resources/jpg/eftech.png");
         //document.add(image1);
        document.add(new Paragraph("Предложение на покупку сувениров" /*+ request.getParameter("factory")*/, font));
        document.add(new Paragraph());
        for (int i = 0; i < listSouvenir.size(); i++) {
            Image image1 = Image.getInstance("C:\\Users\\я\\Desktop\\work folder\\Новая (2)\\IPhone (example)\\IPhone\\web\\resources\\assets\\images\\products\\"+listSouvenir.get(i).getPhoto1());
            PdfPTable table = new PdfPTable(2);
            
            table.addCell("");
            table.addCell(image1);
            table.addCell("Title");
            table.addCell(listSouvenir.get(i).getTitle());
            table.addCell("Price");
            table.addCell(Integer.toString(listSouvenir.get(i).getPrice()));
            table.addCell("Description");
            table.addCell(listSouvenir.get(i).getDescription());
            table.addCell("lacquer");
            table.addCell(listSouvenir.get(i).getLacquer());
            table.addCell("fastening");
            table.addCell(listSouvenir.get(i).getFastening());
            table.addCell("bevel");
            table.addCell(listSouvenir.get(i).getBevel());
            table.addCell("Length");
            table.addCell(Integer.toString(listSouvenir.get(i).getLength()));
            table.addCell("Thickness");
            table.addCell(Integer.toString(listSouvenir.get(i).getThickness()));
            table.addCell("Weight");
            table.addCell(Integer.toString(listSouvenir.get(i).getWeight()));
            
            
            document.add(new Paragraph("Товар " + i, font));
            document.add(new Paragraph());
            document.add(table);
        }
        document.add(new Paragraph());
        document.add(new Paragraph("компания eftech",font));
        document.add(new Paragraph("contact@gmail.com",font));
        
        document.close();
        response.addHeader("Content-Disposition", "attachment; filename=offer.pdf");//Disposition -расположение
        response.setContentType("application/forse-download");
        response.setContentLength(baos.size());
        OutputStream os;

        os = response.getOutputStream();
        baos.writeTo(os);
        os.flush();
        os.close();

        document.close();
    }

}
