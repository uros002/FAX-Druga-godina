#ifndef ZICARA_HPP_INCLUDED
#define ZICARA_HPP_INCLUDED

#include "list.hpp"
#include "putnik.hpp"

enum StanjeZicare{OTVORENA,ZATVORENA};

template <VrstaKarte SEZONA, int BROJ_SEDISTA, int INTERVAL>
class Zicara {
private:
    List<Putnik*> putnici;
    StanjeZicare stanje;
    int ukupnoVoznji;
    int ukupnoMinuta;
public:
    Zicara() : stanje(ZATVORENA),ukupnoVoznji(0),ukupnoMinuta(0){}

    void otvori(){
        stanje = OTVORENA;
        ukupnoVoznji = 0;
        ukupnoMinuta = 0;
    }

    void zatvori(){
        stanje = ZATVORENA;
        putnici.clear();
    }

    bool dodajPutnika(Putnik* p){
        if(p -> getVrstaKarte() != SEZONA){

            Putnik* pom;
            for(int i = 1; i <= putnici.size(); i++){
                putnici.read(i,pom);
                if(p ->getMb() == pom -> getMb()){
                    return false;
                }
                return putnici.add(putnici.size() + 1, p);
            }
        }
    }

    int brojPutnika() const {
        return putnici.size();
    }

    bool preveziTuru() {
        if(stanje == ZATVORENA){
            return false;
        }
        if(putnici.size() == 0){
            return false;
        }

        if(BROJ_SEDISTA >= putnici.size()){
            ukupnoVoznji += putnici.size();
            putnici.clear();
        } else {
            for(int i = 0; i <= BROJ_SEDISTA; i++){
                putnici.remove(1);
                ukupnoVoznji ++;
            }
        }
        ukupnoMinuta += INTERVAL;
        return true;
    }

    friend ostream& operator <<(ostream& out, const Zicara &z){
        out << "Sezona: " << endl;
        switch(SEZONA){
            case LETO:
                out << "LETO" << endl;
                break;
            case SKI:
                out << "SKI" << endl;
                break;
            case SKI_OPENING:
                out << "SKI OPENING" << endl;
                break;
            }
        out << "Broj sedista: " << BROJ_SEDISTA << endl;
        out << "Trajanje jedne voznje: " << INTERVAL << endl;
        out << "Stanje: " << z.stanje << endl;
        out << "Ukupan broj voznji: " << z.ukupnoVoznji << endl;
        out << "Ukupno radno vreme zicare: " << z.getRadnoVremeUSatima() << "h" << endl;
        out << "Broj putnika u redu: " << z.putnici.size() << endl;

        if(z.putnici.size() > 0){
            out << "Lista putnika u redu:" << endl;
            Putnik *p;
            for(int i; i<=z.putnici.size();i++){
                z.putnici.read(i,p);
                out << *p << endl;
            }

        }
        return out;
    }

    double getRadnoVremeUSatima() const{
        return ukupnoMinuta / 60;
    }
};


#endif // ZICARA_HPP_INCLUDED
