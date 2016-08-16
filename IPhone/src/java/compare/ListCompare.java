package compare;

import java.util.ArrayList;
import phone.iphone.Souvenir;

public class ListCompare {

    private ArrayList<Souvenir> arrayList;

    public ListCompare() {
        arrayList = new ArrayList<>();
    }

    public void addSouvenir(Souvenir souvenir) {
        boolean unique = true;
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList.get(i).getId().equals(souvenir.getId())) {
                unique = false;
            }
        }
        if (unique) {
            arrayList.add(souvenir);
        }
    }

    public void removeSouvenir(String id) {
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList.get(i).getId().equals(id)) {
                arrayList.remove(i);
            }
        }
    }

    public ArrayList getList() {
        return arrayList;
    }
}
