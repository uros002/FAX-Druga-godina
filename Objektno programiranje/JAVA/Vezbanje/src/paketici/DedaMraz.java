package paketici;

import java.util.ArrayList;

public class DedaMraz {
	private ArrayList<NovogodisnjiPaketic> paketici;
	
	public DedaMraz() {
		paketici = new ArrayList<>();
	}
	
	public boolean pripremaZaIsporuku(NovogodisnjiPaketic np, String opis) {
			if(np.spakuj() == true) {
				np.setOpis(opis);
				np.setSpremanZaIsporuku(true);
				System.out.println("Novogodisnji paketic je spreman za isporuku");
				return true;
			}
			return false;
	}
	
	public boolean dodaj(NovogodisnjiPaketic np) {
		if(np.isSpremanZaIsporuku() == false) {
			return false;
		} else {
			for(int i = 0; i < paketici.size();i++) {
				if(paketici.get(i).equals(np)) {
					return false;
				} 
			}
				return paketici.add(np);
		}
	}
	
	public boolean izbaci(String namenjen) {
		for(int i = 0;i<paketici.size();i++) {
			if(paketici.get(i).getNamenjen().equals(namenjen)) {
				return paketici.remove(paketici.get(i));
			}
		}
		return false;
	}

	@Override
	public String toString() {
		String retVal = ""; 
		if(paketici.size() == 0) {
			return "Nema paketica!";
		}else {
			for(int i = 0; i<paketici.size();i++) {
				retVal += paketici.get(i) + "\n";
			}
			return retVal;
		}
	}
		
	
}
