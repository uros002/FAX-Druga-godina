package zad3;

public class Gitara extends Instrument {
	
	private boolean elektricna;
	
	public Gitara() {
		super("Srbija");
		this.elektricna = false;
		// TODO Auto-generated constructor stub
	}



	public Gitara(String zemljaPorekla, boolean elektricna) {
		super(zemljaPorekla);
		this.elektricna = elektricna;
		// TODO Auto-generated constructor stub
	}



	@Override
	void sviraj() {
		// TODO Auto-generated method stub
		if(elektricna) {
			System.out.println("Zing");
		} else {
			System.out.println("Ting");
		}
	}



	@Override
	public String toString() {
		if(elektricna) {
			return "Elektricna gitara - Zemlja porekla " + zemljaPorekla;
		}else {
			return "Akusticna gitara - Zemlja porekla " + zemljaPorekla;
		}
	}
	

}
