#ifndef EVIDENCIJALEKOVA_HPP_INCLUDED
#define EVIDENCIJALEKOVA_HPP_INCLUDED

#include "dinstring.hpp"
#include "Lek.hpp"
#include "list.hpp"

class EvidencijaLekova {
private:
    DinString nazivApoteke;
    DinString datum;
    List<Lek> lekovi;

    public:

    EvidencijaLekova() : nazivApoteke("Apoteka Jankovic"), datum("10.10.2010.") {}

    bool dodajLek(long jkl, const char* naziv, double jedinicnaCena, int kolicina) {
        Lek l(jkl,naziv,jedinicnaCena,kolicina);
        return lekovi.add(lekovi.size()+1,l);
    }

    bool dodajLek(const Lek& l){
        return lekovi.add(1,l);
    }

    bool ukloniLek(int index){
        return lekovi.remove(index);
    }

    void sortiraj(){
        Lek l1,l2;
        for(int i = 1; i < lekovi.size(); i++){
            for(int j = i+1; j < lekovi.size(); j++){
                lekovi.read(i,l1);
                lekovi.read(j,l2);

                if(l1.getVrednost() > l2.getVrednost()){
                    lekovi.remove(i);
                    lekovi.add(i,l2);
                    lekovi.remove(j);
                    lekovi.add(j,l1);
                }
            }
        }
    }

    friend ostream& operator<<(ostream& out, const EvidencijaLekova& e){
        out << "------------EVIDENCIJA LEKOVA-----------" << endl;
        out << "naziv apoteke: "<< e.nazivApoteke << endl;
        out << "datum: " << e.datum << endl;

        if(e.lekovi.empty()){
            out << "Evidencija je prazna" << endl;
        }else{
            //out << e.lekovi << endl; //1. nacin

            Lek l;                                      // 2.nacin
            for(int i = 1; i < e.lekovi.size(); i++){
                e.lekovi.read(i,l);
                out << l << endl;
            }

            out << "---------------------------------------" << endl;
        return out;
    }
    }
};


#endif // EVIDENCIJALEKOVA_HPP_INCLUDED
