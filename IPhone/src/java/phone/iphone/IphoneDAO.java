/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phone.iphone;

import java.util.List;

/**
 *
 * @author Admin
 */
public interface IphoneDAO {

    public List<Souvenir> getListSouvenir();
//     public void addIphone(Iphone iphone);

    public Souvenir getSouvenir(String id);

}
