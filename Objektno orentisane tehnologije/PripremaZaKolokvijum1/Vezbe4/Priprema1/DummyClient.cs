using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Priprema1
{
    class DummyClient:IClient
    {
        private int id;
        private string name;

        public DummyClient(int id, string name)
        {
            Id = id;
            Name = name;
        }

        public int Id {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public string GetInfo()
        {
            return "DummyClient: " + Id + " " + Name + "\n";
        }

        public void Execute()
        {
            Console.WriteLine("Operatio executed - " + "DummyClient: " + Id + " " + Name + "\n");
        }



    }
}
