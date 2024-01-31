package zad3;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Gitara g1 = new Gitara();
		Gitara g2 = new Gitara("Spanija",true);
		Bubanj b1 = new Bubanj();
		Bubanj b2 = new Bubanj("Engleska", 7);
		
		System.out.println(g1);
		System.out.println(g2);
		System.out.println(b1);
		System.out.println(b2);
		
		g1.sviraj();
		g2.sviraj();
		b1.sviraj();
		b2.sviraj();
		
		Bend bend1 = new Bend("Ludaci","Francuska", true, 6);
		Bend bend2 = new Bend("Manijaci",g1,g2,b2);
		
		System.out.println(bend1);
		System.out.println(bend2);
		
	}

}
