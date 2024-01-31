package zad3;

public class Bubanj extends Instrument {

	private int brojUdaraca;
	
	
	
	public Bubanj() {
		super();
		this.brojUdaraca = 0;
		// TODO Auto-generated constructor stub
	}



	public Bubanj(String zemljaPorekla, int brojUdaraca) {
		super(zemljaPorekla);
		this.brojUdaraca = brojUdaraca;
		// TODO Auto-generated constructor stub
	}

	@Override
	void sviraj() {
		// TODO Auto-generated method stub
		if(brojUdaraca%3 == 0) {
			System.out.println("Tss");
			brojUdaraca ++;
		} else {
			System.out.println("Bum");
			brojUdaraca ++;
		}
	}
	
	public String toString() {
		return "Bubanj - Zemlja porekla "+zemljaPorekla+". Broj udaraca: "+brojUdaraca;
	}

}
