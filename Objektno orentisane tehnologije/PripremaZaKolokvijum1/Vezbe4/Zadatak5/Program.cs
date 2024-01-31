using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace Zadatak5
{
    class Program
    {
        static void Main(string[] args)
        {
            Restoran r = new Restoran("Masinac", "Trg Dositeja Obradovica 6");
            Console.WriteLine(r);
            Console.WriteLine();

            r.Import("Jelovnik.txt");
            Console.WriteLine(r);
            Console.WriteLine();

            r.Sortiraj();

            Console.WriteLine(r);

            r.Export("Jelovnik sredjen.txt");

            Console.ReadLine();

        }



        public static String Ucitaj(string file)
        {
            BinaryFormatter bf = new BinaryFormatter();
            string txt = "";
            try
            {
                FileStream fs = new FileStream(file, FileMode.Open, FileAccess.Read);
                txt += bf.Deserialize(fs);
            }
            catch(Exception e)
            {

            }
            return txt;
        }
    }
}
