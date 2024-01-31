using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kolokvijum1
{
    interface IDatoteka
    {
        void ProcitajTxt(string file);
        void ProcitajBin(string file);
        void SacuvajBin(string file);
    }
}
