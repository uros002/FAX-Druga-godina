package zad2;

import java.util.HashMap;

public class Pernica {
	private HashMap<String,Bojica> bojice;
	private int raspolozivoMesta;
	
	public Pernica() {
		this.bojice = new HashMap<>();
		this.raspolozivoMesta = 5;
	}
	
	public boolean dodaj(Bojica b) {
		if(bojice.containsKey(b.getSerijskiBroj())) {
			return false;
		}else {
			if(raspolozivoMesta > bojice.size()) {
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
		//String retVal = "";
		if(bojice.isEmpty()) {
			return "Mapa je prazna";
		}
		return "Pernica [bojice=" + bojice + ", raspolozivoMesta=" + raspolozivoMesta + "]";
	}

	public static void main(String[] args) {
		
		Pernica p = new Pernica();
		Bojica b = new Bojica("123","crvena","drvena",10);
		Bojica b2 = new Bojica("1234","plava","flomaster",20);
		Bojica b3 = new Bojica(b2);
		
		b.akcijskaCena(30);
		b2.akcijskaCena(60);
		
		System.out.println(b);
		
		p.dodaj(b);
		p.dodaj(b2);
		p.dodaj(b3);
		
		System.out.println(p.prebroj(5));
		
		System.out.println(p);
	}
}
