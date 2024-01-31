using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Priprema2
{
    class Osoba
    {
        private string ime;
        private string prezime;


        public string Ime {
            get { return ime; }
            set { ime = value; }
        }

        public string Prezime
        {
            get { return prezime; }
            set { prezime = value; }
        }

        public Osoba()
        {
            Ime = "Uros";
            Prezime = "Grahovac";
        }

        public Osoba(string ime,string prezime)
        {
            Ime = ime;
            Prezime = prezime;
        }

    }

}
