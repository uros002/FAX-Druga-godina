#include "EvidencijaLekova.hpp"


int main()
{
    DinString ds("Aspirin");
    Lek lek1,lek2(123,"Brufen", 234.56,23),lek3(456,ds,75.43,34),lek4(lek3);
    cout << lek1 << endl;
    cout << lek2 << endl;
    cout << lek3 << endl;
    cout << lek4 << endl;
    cout << "Vrednost leka l2 : "<< lek2.getVrednost() << endl;

    cout << endl;
    cout << "Provera evidencije leka" << endl;

    EvidencijaLekova e;
    cout << e << endl;

    long jkl;
    char naziv[50];
    double jedinicnaCena;
    int kolicina;

    cout << "unesi jkl:  "<< endl;
    cin >> jkl ;
    cout << "unesi naziv:  "<< endl;
    cin >> naziv;
    cout << "unesi cenu:  "<< endl;
    cin >> jedinicnaCena;
    cout << "unesi kolicinu:  "<< endl;
    cin >> kolicina;

    if(e.dodajLek(jkl,naziv,jedinicnaCena,kolicina)){
        cout << "Uspesno dodavanje leka!" << endl;
    } else {
        cout << "Neuspesno dodavanje leka!" << endl;
    }


    cout << endl << endl;
    cout << "Dodavanje vec napravljenog leka " << endl;

    if(e.dodajLek(lek2)){
        cout << "Lek ("<< lek2 << ") uspesno dodat." << endl;
        cout << e;
    } else {
        cout << "Greska prilikom dodavanja leka ("<< lek2 << ")." << endl;
    }

    if(e.dodajLek(lek3)){
        cout << "Lek ("<< lek3 << ") uspesno dodat." << endl;
        cout << e;
    } else {
        cout << "Greska prilikom dodavanja leka ("<< lek3 << ")." << endl;
    }


    cout << endl << endl;
    cout << "Sortiranje lekova po ukupnoj vrednosti" << endl;

    e.sortiraj();
    cout << e;


    cout << endl << endl;
    cout << "Uklanjanje leka" << endl;

    if(e.ukloniLek(1)){
        cout << "Lek na poziciji 1 uspesno uklonjen." << endl;
        cout << e;
    } else {
        cout << "Greska prilikom uklanjanja leka na poziciji 1." << endl;
    }

    if(e.ukloniLek(17)){
        cout << "Lek na poziciji 17 uspesno uklonjen." << endl;
        cout << e;
    } else {
        cout << "Greska prilikom uklanjanja leka na poziciji 17." << endl;
    }


    return 0;

}
