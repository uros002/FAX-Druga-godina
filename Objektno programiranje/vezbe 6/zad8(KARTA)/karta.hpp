#ifndef KARTA_HPP_INCLUDED
#define KARTA_HPP_INCLUDED

enum VrstaKarte{LETO,SKI,SKI_OPENING};

class Karta {
protected:
    int brojKarata;
    VrstaKarte vrsta;
public:
    Karta() : brojKarata(1), vrsta(LETO){}
    Karta(int bk, VrstaKarte vk) : brojKarata(bk), vrsta(vk) {}

    int getBrojKarata() const {
        return brojKarata;
    }

    VrstaKarte getVrstaKarte() const{
        return vrsta;
    }

    friend ostream& operator <<(ostream& out, const Karta &k){
        out << "-----KARTA-----" << endl;
        out << "Vrsta karte:" << endl;
        switch(k.vrsta){
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

        out << "Broj karata: " << k.brojKarata <<endl;
        out << "----------" << endl;
        return out;
        }




};


#endif // KARTA_HPP_INCLUDED
