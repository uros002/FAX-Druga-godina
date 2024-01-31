using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kolokvijum1
{
    class Artikal
    {

        private string sifra;
        private string naziv;
        private string opis;
        private int cena;


        public Artikal()
        {
            this.sifra = "1";
            this.naziv = "jedan";
            this.opis = "au";
            this.cena = 10;
        }

        public Artikal(string sifra,string naziv,string opis,int cena)
        {
            this.sifra = sifra;
            this.naziv = naziv;
            this.opis = opis;
            this.cena = cena;
        }

        public string Sifra
        {
            get { return sifra; }
            set { sifra = value; }
        }

        public string Naziv
        {
            get { return naziv; }
            set { naziv = value; }

        }

        public string Opis
        {
            get { return opis; }
            set { opis = value; }
        }

        public int Cena
        {
            get { return cena; }
            set { cena = value; }
        }

    }
}
