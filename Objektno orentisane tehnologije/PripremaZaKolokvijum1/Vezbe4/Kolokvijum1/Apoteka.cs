using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Kolokvijum1
{
    class Apoteka
    {
        private Dictionary<string, Artikal> apoteka1;
        private Dictionary<string, Artikal> apoteka2;

        public Apoteka()
        {
            apoteka1 = new Dictionary<string, Artikal>();
            apoteka2 = new Dictionary<string, Artikal>();
        }

        public override string ToString()
        {
            return base.ToString();
        }

        public void Dodaj(int apoteka,Artikal artikal)
        {
            if(apoteka == 1)
            {
                try
                {
                    apoteka1.Add(artikal.Sifra,artikal);
                }
                catch(Exception e)
                {

                }
            }
            else if(apoteka ==2)
            {
                try
                {
                    apoteka2.Add(artikal.Sifra, artikal);
                }
                catch (Exception e)
                {

                }
            }
            else
            {
                Console.WriteLine("Ne postoji ta apoteka!\n");
            }
        }



    }
}
