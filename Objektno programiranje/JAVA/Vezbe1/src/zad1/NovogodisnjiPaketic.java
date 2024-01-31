package zad1;

public class NovogodisnjiPaketic implements Pakovanje {
	private String opis, namenjen;
	private boolean spakovan,zasluzen,spremanZaIsporuku;
	private int minimalniUzrast;
	
	public NovogodisnjiPaketic(String opis, String namenjen, boolean spakovan, boolean zasluzen, boolean spremanZaIsporuku, int minimalniUzrast) {
		super();
		this.opis = opis;
		this.namenjen = namenjen;
		this.spakovan = spakovan;
		this.zasluzen = zasluzen;
		this.spremanZaIsporuku = spremanZaIsporuku;
		this.minimalniUzrast = minimalniUzrast;
	}

	public boolean isSpremanZaIsporuku() {
		return spremanZaIsporuku;
	}

	public void setSpremanZaIsporuku(boolean spremanZaIsporuku) {
		this.spremanZaIsporuku = spremanZaIsporuku;
	}

	public String getNamenjen() {
		return namenjen;
	}

	public boolean isSpakovan() {
		return spakovan;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}
	
	public boolean spakuj() {
		if(zasluzen == false || spakovan == true) {
			return false;
		}else {
			if((namenjen.equals("devojcica") || namenjen.equals("decak")) && minimalniUzrast > 2) {
				spakovan = true;
				System.out.println("Novogodisnji paketic je uspesno spakovan");
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		String retVal = "";
		retVal += "Opis: "+opis+"\n";
		retVal += "Namenjen je za: "+namenjen +"\n";
		if(spakovan) {
			retVal+="Spakovan je\n";
		} else {
			retVal+="Nije spakovan\n";
		}
		if(zasluzen) {
			retVal+="Zasluzen je\n";
		} else {
			retVal+="Nije zasluzen\n";
		}
		if(spremanZaIsporuku) {
			retVal+="Spreman je za isporuku\n";
		}else {
			retVal+="Nije spreman za isporuku\n";
		}
		retVal+= "Minimalni uzrast je: "+minimalniUzrast+"\n";
		return retVal;
		
		
		
		
		
		/*return "NovogodisnjiPaketic [opis=" + opis + ", namenjen=" + namenjen + ", spakovan=" + spakovan + ", zasluzen="
				+ zasluzen + ", spremanZaIsporuku=" + spremanZaIsporuku + ", minimalniUzrast=" + minimalniUzrast + "]";
		*/
	}
	
	
}
