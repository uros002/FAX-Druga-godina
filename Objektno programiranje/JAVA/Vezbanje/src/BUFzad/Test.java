package BUFzad;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("Unesite indefikacioni broj: ");
		
		BufferedReader br = null;
		br = new BufferedReader(new InputStreamReader(System.in));
		try {
			int id = Integer.parseInt(br.readLine());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Indefikacioni broj mora biti celobrojna vrednost");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Desio se neki drugi izuzetak");
		}finally {
			System.out.println("Program je zavrsen");
		}
		
		
	}

}
