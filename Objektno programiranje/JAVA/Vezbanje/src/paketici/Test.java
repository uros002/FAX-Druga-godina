package paketici;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		NovogodisnjiPaketic np1 = new NovogodisnjiPaketic("Devojcica", "Slatkisi", false, true, false, 4);
		NovogodisnjiPaketic np2 = new NovogodisnjiPaketic("Decak", "", false, true, false, 7);
		NovogodisnjiPaketic np3 = new NovogodisnjiPaketic("Devojcica", "Lutka", true, true, true, 2);
		
		System.out.println("-----------------TESTIRANJE NOVOGODISNJIPAKETI----------------");
		np1.getNamenjen();
		np1.setOpis("Lutka");
		np1.setSpremanZaIsporuku(true);
		np1.isSpakovan();
		np1.isSpremanZaIsporuku();
		np1.spakuj();
		
		System.out.println(np1);
		
		System.out.println("-----------------TESTIRANJE DEDAMRAZ----------------");
		DedaMraz dm = new DedaMraz();
		dm.dodaj(np1);
		dm.dodaj(np2);
		np2.setSpremanZaIsporuku(true);
		dm.dodaj(np2);
		dm.dodaj(np3);
		
		System.out.println(dm);
		
		dm.izbaci("Devojcica");
		
		System.out.println(dm);

	}

}
