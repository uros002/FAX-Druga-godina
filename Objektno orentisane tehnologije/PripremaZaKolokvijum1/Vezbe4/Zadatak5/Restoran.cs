using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Zadatak5
{
    class Restoran
    {
        private string naziv;
        private string adresa;
        private Dictionary<string,Stavka> jelovnik;

        #region konstruktor
            public Restoran(string naziv, string adresa)
        {
            this.naziv = naziv;
            this.adresa = adresa;
            jelovnik = new Dictionary<string, Stavka>();
        }
        #endregion

        #region property
        public string Naziv { 
            get { return naziv; } 
            set { naziv = value; }
        }

        public string Adresa
        {
            get { return adresa; }
            set { adresa = value; }
        }
        #endregion

        public override string ToString()
        {
            string retVal = "";
            retVal += "Restoran: " + Naziv + "\nAdresa: " + Adresa + "\n\nJelovnik\n**********\n";
            if (jelovnik.Count == 0)
            {
                retVal += "Jelovnik je prazan!\n";
            }
            else
            {
                foreach (Stavka s in jelovnik.Values)
                {
                    retVal += s.ToString();
                }
            }
                retVal += "**********";
                return retVal;
        }

             public void Import(string file)
            {
                StreamReader sr = null;
                string naziv;
                double cena;
                string line;
                try
                {
                    sr = new StreamReader(file);
                    while ((line = sr.ReadLine()) != null)
                    {
                        string[] lineParts = line.Split('|');

                        naziv = lineParts[0];
                        cena = Double.Parse(lineParts[lineParts.Length - 2]);

                        if (!NazivStavkePostoji(naziv))
                        {
                        jelovnik.Add(naziv, new Stavka(naziv, cena));
                        }
                    }
                    //sr.Close();
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    Console.WriteLine(e.StackTrace);
                }
                finally
                {
                    if (sr != null)
                    {
                        sr.Close();
                    }
                }
            }
        
        

        public bool NazivStavkePostoji(string nazivStavke)
        {
            foreach(Stavka s in jelovnik.Values)
            {
                if(s.Naziv == nazivStavke)
                {
                    return true;
                }
            }
            return false;
        }

        public void Sortiraj()
        {
            Stavka tempI, tempJ;
            for (int i = 0; i < jelovnik.Count - 1; i++)
            {
                for(int j = 1; j < jelovnik.Count; j++)
                {
                    if(jelovnik[i].Cena < jelovnik[j].Cena)
                    {
                        tempI = jelovnik[i];
                        tempJ = jelovnik[j];
                        jelovnik.RemoveAt(i);
                        jelovnik.Insert(i, tempJ);
                        jelovnik.RemoveAt(j);
                        jelovnik.Insert(j, tempI);
                    }
                }
            }
        }

        public void Export(string file)
        {
            StreamWriter sw = null;
            try
            {
                sw = new StreamWriter(file);
                sw.WriteLine(this);
                sw.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}
