#include <iostream>
#include "rerna.hpp"

#define KRAJ_PROGRAMA 8
using namespace std;

void ispisiRernu(const Rerna &r){
    cout<< "--------RERNA--------"<<endl;
    cout<< "temperatura: "<< r.getTemperatura()<<endl;
    switch(r.getTrenutnoStanje()) {
    case UKLJUCENA:
        cout << "trenutno stanje: UKLJUCENA"<<endl;
        break;
    case ISKLJUCENA:
        cout << "trenutno stanje: ISKLJUCENA"<<endl;
        break;
    case POKVARENA:
        cout << "trenutno stanje: POKVARENA"<<endl;
        break;
    default:
        cout << "trenutno stanje: nepoznato"<<endl;
        break;
    }
}

int meni(){
    int i;

    cout << "Izaberite opciju"<<endl;
    cout << "1. Ukljuci rernu"<<endl;
    cout << "2. Iskljuci rernu"<<endl;
    cout << "3. Pokvari rernu"<<endl;
    cout << "4. Popravi rernu"<<endl;
    cout << "5. Pojacaj temperaturu"<<endl;
    cout << "6. Smanji temperaturu"<<endl;
    cout << "7. Prikazi stanje"<<endl;
    cout << "8. Kraj rada programa"<<endl;
    cout << "Operacija --->"<<endl;

    cin >> i;
    return i;
}

int main()
{
    int i;
    Rerna r;

    do{
        i = meni();

        switch(i) {
            case 1:
                if(r.ukljuci()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 2:
                if(r.iskljuci()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 3:
                if(r.pokvari()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 4:
                if(r.popravi()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 5:
                if(r.pojacajTemperaturu()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 6:
                if(r.smanjiTemperaturu()){
                    cout << "Operacija je izvrsena!"<<endl;
                } else {
                    cout << "Operacija nije izvrsena!"<<endl;
                    }
                break;
            case 7:
                ispisiRernu(r);
                break;
            case 8:
                cout << "Kraj koriscenja programa!"<<endl;
                break;
            default:
                cout << "Unesite ponovo!" <<endl;
                break;
        }
    }while(i != KRAJ_PROGRAMA);

    return 0;
}
