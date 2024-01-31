package zad3;

public abstract class Instrument {
	protected String zemljaPorekla;
	
	public Instrument() {
		this.zemljaPorekla = "Srbija";
	}

	public Instrument(String zemljaPorekla) {
		super();
		this.zemljaPorekla = zemljaPorekla;
	}
	
	abstract void sviraj();
	
	
}
