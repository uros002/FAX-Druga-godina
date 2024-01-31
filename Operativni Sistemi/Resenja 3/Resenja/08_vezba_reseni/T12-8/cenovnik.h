#ifndef CENOVNIK_H
#define CENOVNIK_H

#include <string>
#include <map>

using namespace std;

void nadjiPovoljno(map<string, double> a, map<string, double> b, map<string, double> &jeftino)
{
    for (map<string, double>::const_iterator it = a.cbegin(); it != a.cend(); ++it) {
        jeftino[it->first] = min(it->second, b[it->first]);
    }
}

#endif // CENOVNIK_H
