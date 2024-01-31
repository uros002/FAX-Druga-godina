using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Priprema2
{
    class Program
    {
        static void Main(string[] args)
        {
            //Student s1 = new Student();
            //Student s2 = new Student("Dragan", "Milosevic", "PR", 21, 2021);
            //Student s3 = new Student("Strahinja", "Sejmjanovic", "PR", 20, 2021);

            Fakultet f = new Fakultet();

            String txt = LoadFromFile("Studenti.txt");

           // f.Add(s1);
            //f.Add(s2);
            //f.Add(s3);
            //Console.WriteLine(f.ToString());

            f.UpisiStudente(txt);

            Console.WriteLine(f.ToString());

            f.SortirajStudente();

            SaveToFile(f.ToString(), "Sortirani Studenti.txt");

            Console.ReadLine();
        }

        static string LoadFromFile(string file)
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

        static void SaveToFile(string txt, string file)
        {
            StreamWriter sw = null;
            try
            {
                sw = new StreamWriter(file);
                sw.WriteLine(txt);
                sw.Close();
            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }
    }
}
