using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak1
{
    public class Osoba
    {
        private string ime;
        private string prezime;


        #region Konstruktori
        public Osoba()
        {
            this.ime = "Uros";
            this.prezime = "Grahovac";
        }

        public Osoba(string ime, string prezime)
        {
            this.ime = ime;
            this.prezime = prezime;
        }
        #endregion

        #region props

        public string Ime {
            get { return ime; } 
            set { ime = value; }
        }

        public string Prezime {
            get { return prezime; }
            set { prezime = value; }
        }

        #endregion

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
    }
}
