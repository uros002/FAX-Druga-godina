#ifndef GRAD_HPP_INCLUDED
#define GRAD_HPP_INCLUDED

#include "list.hpp"
#include "prodavnica.hpp"

class Grad {
private:
    DinString naziv;
    List<Prodavnica*> prodavnice;
public:
    Grad() : naziv("Novi Sad") {}
    Grad(const DinString &g) : naziv(g){}

    bool dodajProdavnicu(Prodavnica &pr){
        return prodavnice.add(1,&pr);
    }

    void ispisiNajjeftinijuProdavnicu(){

        if(prodavnice.size() == 0){
            cout << "Nema prodavnica!" <<endl;
        }else {

            Prodavnica *najjeftinija;
            prodavnice.read(1,najjeftinija);
            Prodavnica *pr;
            for(int i = 2; i<=prodavnice.size();i++){
                prodavnice.read(i,pr);
                if( pr ->getProsecnaCena() < najjeftinija ->getProsecnaCena())
                prodavnice.read(i,najjeftinija);
            }
            cout << *najjeftinija << endl;
        }
    }



};



#endif // GRAD_HPP_INCLUDED
