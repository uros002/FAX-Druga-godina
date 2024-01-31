#ifndef JKTROUGAO_HPP_INCLUDED
#define JKTROUGAO_HPP_INCLUDED

#include "trougao.hpp"

class JKTrougao: public Trougao{

public:
    JKTrougao() : Trougao(1,2,2){}
    JKTrougao(double aa, double bb) : Trougao(aa,bb,bb) {}
    JKTrougao(const JKTrougao &jkt) : Trougao(jkt.a,jkt.b,jkt.b){}
};

#endif // JKTROUGAO_HPP_INCLUDED
