package palindrom;

import java.util.Scanner;

public class Palindrom {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String pom, palindrom = "";
		
		System.out.println("Unesite recenicu: ");
		Scanner in = new Scanner(System.in);
		
		palindrom = in.nextLine();
		in.close();
		
		pom = palindrom.replace(" ","");
		pom = pom.toLowerCase();
		
		if(isPalindrome(pom)) {
			System.out.printf("%s is a palindrome.", palindrom);
		}else {
			System.out.printf("%s is NOT a palindrome.", palindrom); 
		}
	}

	public static boolean isPalindrome(String word) {
		int duzina = word.length();
		String reverse = "";
		
		for(int i = duzina - 1; i>=0; i--) {
			reverse = reverse + word.charAt(i);
		}
		
		if(reverse.equals(word)) {
			return true;
		}
		return false;
	}
}


