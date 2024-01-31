using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak1
{
    class Program
    {
        static void Main(string[] args)
        {
            string txt = LoadFromFile("Studenti.txt");

            Fakultet f = new Fakultet();

            f.UpisiStudente(txt);

            f.SortirajStudente();

            SaveToFile(f.ToString(), "Studenti Sortirano.txt");

            Console.ReadLine();

        }

        public static string LoadFromFile(string file)
        {
            StreamReader sr = null;
            string txt = "";

            try
            {
                sr = new StreamReader(file);
                string line = "";
                while ((line = sr.ReadLine()) != null)
                {
                    txt += line;
                }
                sr.Close();
            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }

            return txt;
        }

        public static void SaveToFile(string string1, string string2)
        {
            StreamWriter sw = null;

            try
            {
                sw = new StreamWriter(string2);
                sw.WriteLine("Uros Grahovac\n");
                sw.WriteLine("Ovaj string je: \n")
                sw.WriteLine(string1);
                sw.Close();
            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}
