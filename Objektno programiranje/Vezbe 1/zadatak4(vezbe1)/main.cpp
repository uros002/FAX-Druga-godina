#include <iostream>
#include <cmath>
using namespace std;

double f(int n){

    double rezultat = 0;

    for(int i = 1; i<=n; i++){
        rezultat += sqrt(i);
    }
    // zaokruzivanje na dve decimale
    rezultat = round(reultat *100);
    rezultat = rezultat / 100;

    return rezultat;
}
int main()
{
    int n;
    double rezultat;

    cout << "Unesite ceo pozitivan broj: ";
    cin >> n;

    if(n<0){
        cout<< "Uneli ste negativan broj!" << endl;
        return 0;
    }

    rezultat = f(n);

    cout << "Vrednost izraza je" << rezultat << endl;
    return 0;
}
