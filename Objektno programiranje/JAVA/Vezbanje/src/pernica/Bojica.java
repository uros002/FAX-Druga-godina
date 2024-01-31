package pernica;

public class Bojica implements IzracunavanjeCene {

	private String serijskiBroj,boja,tip;
	private double cena;
	
	
	
	public Bojica(String serijskiBroj, String boja, String tip, double cena) {
		super();
		this.serijskiBroj = serijskiBroj;
		this.boja = boja;
		this.tip = tip;
		this.cena = cena;
	}

	public Bojica(Bojica b) {
		this.serijskiBroj = b.serijskiBroj;
		this.boja = b.boja;
		this.tip = b.tip;
		this.cena = b.cena;
	}

	public String getSerijskiBroj() {
		return serijskiBroj;
	}

	public double getCena() {
		return cena;
	}

	@Override
	public boolean akcijskaCena(double procenat) {
		if(procenat <= 0 || procenat > 99) {
			System.out.println("Neuspesan pokusaj smanjivanja cene!");
			return false;
		}else {
			cena = cena - cena*(procenat/100);
			System.out.println("Cena je snizena za "+ procenat + "!");
			return true;
		}
	}

	@Override
	public String toString() {
		return "Bojica [serijskiBroj=" + serijskiBroj + ", boja=" + boja + ", tip=" + tip + ", cena=" + cena + "]";
	}
	
	

}
