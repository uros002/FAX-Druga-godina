package zad1;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NovogodisnjiPaketic np = new NovogodisnjiPaketic("Paketic 1", "devojcica", false,true,false,4);
		np.getNamenjen();
		np.isSpakovan();
		np.isSpremanZaIsporuku();
	    np.setOpis("Paketic 1 vol 2");
	    np.setSpremanZaIsporuku(true);
	    
	    np.spakuj();
	    
	    System.out.println(np);
	    
	    DedaMraz dm = new DedaMraz();
	    dm.dodaj(np);
	    dm.izbaci("");
	    dm.pripremiZaIsporuku(np, "");
	    
	    System.out.println(dm);
	}

}
