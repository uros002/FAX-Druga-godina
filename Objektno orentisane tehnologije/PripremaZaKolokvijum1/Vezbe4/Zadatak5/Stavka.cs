using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak5
{
    class Stavka
    {
        private string naziv;
        private double cena;

        #region konstruktor
            public Stavka(string naziv, double cena)
        {
            this.naziv = naziv;
            this.cena = cena;
        }
        #endregion

        #region property 
        public string Naziv { 
            get { return naziv; }
            set { naziv = value; }
        }

        public double Cena
        {
            get { return cena; }
            set { cena = value; }
        }
        #endregion

        public override string ToString()
        {
            return Naziv + " " + Cena + "\n" ;
        }


    }
}
