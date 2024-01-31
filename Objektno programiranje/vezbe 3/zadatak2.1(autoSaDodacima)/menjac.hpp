#ifndef MENJAC_HPP_INCLUDED
#define MENJAC_HPP_INCLUDED

enum TipMenjaca{AUTOMATIK,MANUELNI};

class Menjac {

private:
    TipMenjaca tip;
    int brzina;

public:

    Menjac(){
        tip = AUTOMATIK;
        brzina = 0;
    }
    Menjac(TipMenjaca t, int b){
        brzina = b;
        tip = t;
    }
    Menjac(const Menjac &m){
        brzina = m.brzina;
        tip = m.tip;
    }

    bool setBrzina(int b){
        if(b >= 1 && b <= 6){
            brzina = b;
            return true;
        }
        return false;
    }

    void setTip(TipMenjaca t){
        tip = t;
    }

    int getBrzina()const{
        return brzina;
    }

    TipMenjaca getTip() const{
        return tip;
    }

    friend void ispisiMenjac(const Menjac&); // prijateljska funkcija
};


#endif // MENJAC_HPP_INCLUDED
