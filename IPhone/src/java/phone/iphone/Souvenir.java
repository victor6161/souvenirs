
package phone.iphone;

import java.util.ArrayList;


public class Souvenir {
    
    public Souvenir() {
     
    }  
    public Souvenir(String id, String title) {
        this.id = id;
        this.title = title;
     ;
    }

    public Souvenir(String id, String title, String lacquer, String fastening, String bevel, int length, int weigth, int thickness, int price, String photo1, String photo2, String photo3, String photo4, String description) {
        this.id = id;
        this.title = title;
        this.lacquer = lacquer;
        this.fastening = fastening;
        this.bevel = bevel;
        this.length = length;
        this.weight = weigth;
        this.thickness = thickness;
        this.price = price;
        this.photo1 = photo1;
        this.photo2 = photo2;
        this.photo3 = photo3;
        this.photo4 = photo4;
        this.description = description;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setLacquer(String lacquer) {
        this.lacquer = lacquer;
    }

    public void setFastening(String fastening) {
        this.fastening = fastening;
    }

    public void setBevel(String bevel) {
        this.bevel = bevel;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public void setWeight(int weigth) {
        this.weight = weigth;
    }

    public void setThickness(int thickness) {
        this.thickness = thickness;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = photo1;
    }

    public void setPhoto2(String photo2) {
        this.photo2 = photo2;
    }

    public void setPhoto3(String photo3) {
        this.photo3 = photo3;
    }

    public void setPhoto4(String photo4) {
        this.photo4 = photo4;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getLacquer() {
        return lacquer;
    }

    public String getFastening() {
        return fastening;
    }

    public String getBevel() {
        return bevel;
    }

    public int getLength() {
        return length;
    }

    public int getWeight() {
        return weight;
    }

    public int getThickness() {
        return thickness;
    }

    public int getPrice() {
        return price;
    }

    public String getPhoto1() {
        return photo1;
    }

    public String getPhoto2() {
        return photo2;
    }

    public String getPhoto3() {
        return photo3;
    }

    public String getPhoto4() {
        return photo4;
    }

    public String getDescription() {
        return description;
    }


    String id;
    String title;
    
    String lacquer;
    String fastening;
    
    String bevel;
    int length;
    int weight;
    int thickness;
    int price;
    String photo1;
    String photo2;
    String photo3;
    String photo4;
    String description;
    
}
