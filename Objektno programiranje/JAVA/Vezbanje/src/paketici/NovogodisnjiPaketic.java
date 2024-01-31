package paketici;

public class NovogodisnjiPaketic implements Pakovanje {
	private String namenjen, opis;
	private boolean spakovan,zasluzen,spremanZaIsporuku;
	private int minimalnaUzrast;
	public NovogodisnjiPaketic(String namenjen, String opis, boolean spakovan, boolean zasluzen, boolean spremanZaIsporuku,
			int minimalnaUzrast) {
		super();
		this.namenjen = namenjen;
		this.opis = opis;
		this.spakovan = spakovan;
		this.zasluzen = zasluzen;
		this.spremanZaIsporuku = spremanZaIsporuku;
		this.minimalnaUzrast = minimalnaUzrast;
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
			if((namenjen == "decak" || namenjen == "devojcica") && minimalnaUzrast > 2) {
				spakovan = true;
				System.out.println("Novogodisnji paketic je spakovan");
				return true;
			}
		}
		return false;
	}
	@Override
	public String toString() {
		return "NovogodisnjiPaketic [namenjen=" + namenjen + ", opis=" + opis + ", spakovan=" + spakovan + ", zasluzen="
				+ zasluzen + ", spremanZaIsporuku=" + spremanZaIsporuku + ", minimalnaUzrast=" + minimalnaUzrast + "]";
	}
	
	
}
