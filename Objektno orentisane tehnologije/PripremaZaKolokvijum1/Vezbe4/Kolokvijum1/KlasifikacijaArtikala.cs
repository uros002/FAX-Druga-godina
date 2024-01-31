using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace Kolokvijum1
{
    class KlasifikacijaArtikala : IDatoteka
    {
        Apoteka apoteke;

        public void ProcitajTxt(string file)
        {
            Apoteka apoteka = null;
            string txt = "";
            StreamReader sr = null;
            try
            {
                sr = new StreamReader(file);
                string line = "";
                while ((line = sr.ReadLine()) != null)
                {
                    txt += line;
                }

            }
            catch (Exception e)
            {

            }


        }

        public void SacuvajBin(string file)
        {
            BinaryFormatter bf = new BinaryFormatter();
            try
            {
                FileStream fs = new FileStream(file, FileMode.Create, FileAccess.Write);
                bf.Serialize(fs, this);

            }
            catch (Exception e)
            {

            }
        }

        
        public void ProcitajBin(string file)
        {
            BinaryFormatter bf = new BinaryFormatter();
            Apoteka apoteka = null;
            if (File.Exists(file))
            {
                try
                {
                    FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read);
                    apoteka = (Apoteka)bf.Deserialize(fs);
                }
                catch
                {

                }
            }
        }
    }
}
