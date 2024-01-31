using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak04
{
    class DummyClient:IClient
    {
        private int id;
        private string name;

        public DummyClient(int id, string name)
        {
            this.id = id;
            this.name = name;
        }

        #region props
        public  int Id {
            get { return id; }
            set { id = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        #endregion

        public string GetInfo()
        {
            return "DummyClient: " + Id + " " + Name + "\n";
        }

        public void Execute()
        {
            Console.WriteLine("Operation executed - " + "DummyClient: " + Id + " " + Name + "\n");
        }

    }
}
