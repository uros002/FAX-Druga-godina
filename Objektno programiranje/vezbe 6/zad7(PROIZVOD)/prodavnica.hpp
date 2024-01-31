#ifndef PRODAVNICA_HPP_INCLUDED
#define PRODAVNICA_HPP_INCLUDED

#include "list.hpp"
#include "proizvod.hpp"

class Prodavnica {
private:
    DinString naziv;
    List<Proizvod*> proizvodi;
public:
    Prodavnica(const DinString &naz) : naziv(naz){}

    bool dodajProizvod(Proizvod &novi){
        Proizvod *p;
        for(int i = 1; i <= proizvodi.size();i++){
            proizvodi.read(i,p);
            if(p -> getNaziv() == novi.getNaziv()){
                return false;
            }
        }

        return proizvodi.add(1,&novi);
    }

    void obrisiProizvod(const DinString &naziv) {
        Proizvod *p;
        for(int i = 1; i <= proizvodi.size(); i++){
            if(p -> getNaziv() == naziv){
                proizvodi.remove(i);
                break;
            }
        }
    }

    void obrisiProizvod(int n){
        proizvodi.remove(n);
    }

    void akcija(int cena) {
        Proizvod *p;
        for(int i = 1; i <= proizvodi.size();i++){
            proizvodi.read(i,p);
            if(p -> getCena() < cena){
                p ->izracunajPopust();
            }
        }
    }

    double getProsecnaCena() const{
        double suma = 0;
        if(proizvodi.size() < 1){
            return 0;
        }

        Proizvod *p;
        for(int i = 1; i <= proizvodi.size();i++){
            proizvodi.read(i,p);
            suma += p ->getCena();
        }

        suma = suma / proizvodi.size();
        return suma;
    }

    friend ostream& operator<<(ostream& out, const Prodavnica& pr){
        out << "----------------------------------------------------" << endl;
        out << "Naziv prodavnice: " << pr.naziv << endl;
        out << "Proizvodi: " << endl;
        Proizvod *p;
        for(int i; i <= pr.proizvodi.size();i++){
            pr.proizvodi.read(i,p);
            p -> ispisi();
            out << endl;
        }
        out << "----------------------------------------------------" << endl;
    }



};


#endif // PRODAVNICA_HPP_INCLUDED
