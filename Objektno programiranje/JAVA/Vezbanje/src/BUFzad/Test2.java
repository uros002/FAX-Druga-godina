package BUFzad;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BufferedReader pom = null;
		pom = new BufferedReader(new InputStreamReader(System.in));
		try {
			int br = Integer.parseInt(pom.readLine());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	}

}
