package pernica;

import java.util.HashMap;

public class Pernica {

	private HashMap<String, Bojica> bojice;
	private int raspolozivoMesta;
	
	public Pernica() {
		this.bojice = new HashMap<>();
		this.raspolozivoMesta = 5;
	}
	
	public boolean dodaj(Bojica b) {
		if(bojice.containsKey(b.getSerijskiBroj())) {
			return false;
		} else {
			if(bojice.size() < raspolozivoMesta) {
				bojice.put(b.getSerijskiBroj(), b);
				return true;
			}
		}
		return false;
	}
	
	
	public int prebroj(double cena) {
		int brojac = 0;
		for(Bojica b: bojice.values()) {
			if(b.getCena() > cena) {
				brojac++;
			}
		}
		return brojac;
	}
	
	@Override
	public String toString() {
		return "Pernica [bojice=" + bojice + ", raspolozivoMesta=" + raspolozivoMesta + "]";
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Bojica b1 = new Bojica("111", "crvena", "drvena", 10);
		Bojica b2 = new Bojica("222", "plava", "flomaster", 20);
		Bojica b3 = new Bojica(b2);
		
		b1.akcijskaCena(30);
		b2.akcijskaCena(70);
		
		System.out.println(b1);
		System.out.println(b2);
		System.out.println(b3);
		
		System.out.println("------------------------------------------Provera za klasu Pernica------------------------------------------");
		
		Pernica p1 = new Pernica();
		
		p1.dodaj(b1);
		p1.dodaj(b2);
		p1.dodaj(b3);
		
		System.out.println(p1);
		
		int broj =  p1.prebroj(7);
		System.out.println(broj);
		
		int broj2 = p1.prebroj(3);
		System.out.println(broj2);
		
		
		
	}

}
