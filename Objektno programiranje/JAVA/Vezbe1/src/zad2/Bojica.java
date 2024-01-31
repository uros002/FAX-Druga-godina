package zad2;

public class Bojica implements IzracunavanjeCene{
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
		super();
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
	public boolean akcijskaCena(double x) {
		if(x <= 0) {
			System.out.println("Neuspesan pokusaj smanjivanja cene!");
			return false;
		}else {
			cena = cena * (1 - x/100);
			System.out.println("Cena je snizena za "+x );
			return true;
			
		}
	}

	@Override
	public String toString() {
		return "Bojica [serijskiBroj=" + serijskiBroj + ", boja=" + boja + ", tip=" + tip + ", cena=" + cena + "]";
	}
	
	
}
