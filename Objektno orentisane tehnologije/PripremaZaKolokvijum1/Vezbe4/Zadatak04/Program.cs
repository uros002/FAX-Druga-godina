using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak04
{
    class Program
    {
        static void Main(string[] args)
        {
            MyServer ms1 = new MyServer(111);
            MyServer ms2 = new MyServer(222);
            MyServer ms3 = new MyServer(333);

            DummyClient dc1 = new DummyClient(1, "PrviDC");
            DummyClient dc2 = new DummyClient(2, "DrugiDC");
            DummyClient dc3 = new DummyClient(3, "TreciDC");

            MessageClient mc1 = new MessageClient("Prvi Message");
            MessageClient mc2 = new MessageClient("Drugi Message");

            Console.WriteLine(dc1.GetInfo());
            dc1.Execute();

            Console.WriteLine("\n***********************\n");

            Console.WriteLine(mc2.GetInfo());
            mc2.Execute();

            ms1.Start();
            ms1.AddClient(dc1);
            ms1.AddClient(mc1);
            Console.WriteLine(ms1.ToString());

            Console.WriteLine("\n***********************\n");

            ms2.Start();
            ms2.AddClient(dc2);
            ms2.AddClient(mc2);
            Console.WriteLine(ms2.ToString());
            ms2.RemoveClient(1);
            Console.WriteLine(ms2.ToString());
            ms2.ExecuteClient(0);
            ms2.ExecuteClient(4);
            

            Console.WriteLine("\n***********************\n");

            ms3.Start();
            ms3.AddClient(dc1);
            ms3.AddClient(dc2);
            ms3.AddClient(dc3);
            ms3.AddClient(mc1);
            ms3.AddClient(mc2);
            Console.WriteLine(ms3.ToString());
            ms3.Stop();
            Console.WriteLine(ms3.ToString());




            Console.ReadLine();
        }
    }
}
