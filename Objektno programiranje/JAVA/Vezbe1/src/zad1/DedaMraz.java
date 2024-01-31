package zad1;

import java.util.ArrayList;

public class DedaMraz {
	private ArrayList<NovogodisnjiPaketic> paketici;
	
	public DedaMraz() {
		paketici = new ArrayList<>();
	}
	
	public boolean pripremiZaIsporuku(NovogodisnjiPaketic np, String NoviOpis) {
		if(np.spakuj()) {
			np.setOpis(NoviOpis);
			np.setSpremanZaIsporuku(true);
			System.out.println("Novogodisnji paketic je spreman za isporuku");
			return true;
		}
		return false;
	}
	
	public boolean dodaj(NovogodisnjiPaketic np) {
		if(np.isSpremanZaIsporuku() == false) {
			return false;
		}else {
			for(int i = 0; i< paketici.size(); i++) {
				if(paketici.get(i).equals(np)) {
					return false;
				}
			}
			return paketici.add(np);
		}
		
	}
	
	public boolean izbaci(String nam) {
		for(int i = 0; i<paketici.size();i++) {
			if(paketici.get(i).getNamenjen().equals(nam)) {
				if(paketici.remove(i)!=null)
					return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		//return "DedaMraz [paketici=" + paketici + "]";
		String retVal = "";
		if(paketici.isEmpty()) {
			return "Lista je prazna";
		}else {
			for(int i = 0; i<paketici.size();i++) {
				retVal+=paketici.get(i)+"\n";
			}
			//for(NovogodisnjiPaketic np: paketici) {
			//	retVal+=np+"\n";
			//}
			return retVal;
		}
	}
	
	
}


