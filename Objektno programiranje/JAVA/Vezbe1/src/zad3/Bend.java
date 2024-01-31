package zad3;

public class Bend {
	private String naziv;
	private Instrument prvi,drugi,treci;
	
	public Bend(){
		this.naziv = "Noname";
	}
	
	public Bend(String naziv, String zemljaPorekla, boolean elektricna, int brojUdaraca) {
		this.naziv = naziv;
		this.prvi = new Gitara();
		this.drugi = new Gitara(zemljaPorekla,elektricna);
		this.treci = new Bubanj(zemljaPorekla, brojUdaraca);
	}
	
	public Bend(String naziv, Instrument prvi, Instrument drugi, Instrument treci) {
		this.naziv = naziv;
		this.prvi = prvi;
		this.drugi = drugi;
		this.treci = treci;
	}

	@Override
	public String toString() {
		String retVal = "";
		retVal += naziv +"\n";
		retVal += "Prvi: "+ prvi.toString() + "\n";
		retVal += "Drugi: "+drugi.toString() + "\n";
		retVal += "Treci: " + treci.toString() + "\n";
		return retVal;
	}
	
	
}
