#ifndef LEK_HPP_INCLUDED
#define LEK_HPP_INCLUDED

#include "Artikal.hpp"
#include "dinstring.hpp"

class Lek : public Artikal {
private:
    long jkl;
    DinString naziv;
    double jedinicnaCena;
    int kolicina;
public:
    Lek() : jkl(0), naziv(""), jedinicnaCena(0), kolicina(0) {}
    Lek(long j,const char* naz, double jc, int kol) : jkl(j), naziv(naz), jedinicnaCena(jc), kolicina(kol){}
    Lek(long j, const DinString &ds, double jc, int kol) : jkl(j), naziv(ds), jedinicnaCena(jc), kolicina(kol){}
    Lek(const Lek &l) : jkl(l.jkl), naziv(l.naziv), jedinicnaCena(l.jedinicnaCena), kolicina(l.kolicina){}

    double getVrednost() const{
        return jedinicnaCena * kolicina;
    }

    friend ostream& operator<<(ostream& out, const Lek& l){
        out << "-------LEK------" << endl;
        out <<"jedinstveni kljuc leka:" << l.jkl << endl;
        out <<"naziv: " << l.naziv << endl;
        out << "jedinicna cena: " << l.jedinicnaCena << endl;
        out << "kolicina: " << l.kolicina << endl;
        out << "---------------------------------" << endl;
        return out;
    }
};

#endif // LEK_HPP_INCLUDED
