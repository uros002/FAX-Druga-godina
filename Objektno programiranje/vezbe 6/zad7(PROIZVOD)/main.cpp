#include <iostream>
#include "odeca.hpp"
#include "voce.hpp"
#include "grad.hpp"

int Odeca::brojVelikeOdece = 0;

using namespace std;

int main()
{

    cout << "--- Odeca ---" << endl;
    Odeca o1(1000,"Zuta majica",XL,MAJICA);
    cout << "Broj velike odece: " << o1.getBrojVelikeOdece() << endl;

    o1.ispisi();
    o1.izracunajPopust();
    cout << "--- Nakon popusta ---" << endl;
    o1.ispisi();



    return 0;
}
