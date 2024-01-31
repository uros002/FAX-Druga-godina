using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Zadatak04
{
    class MyServer:ISerever
    {
        private int port;
        private bool acvtive;
        private List<IClient> clients;

        public MyServer(int port)
        {
            this.port = port;
            this.acvtive = false;
            clients = new List<IClient>();
        }

        public int Port { 
            get { return port; } 
            set { port = value; }
        }

        public bool Active
        {
            get { return acvtive; }
            set { acvtive = value; }
        }

        public bool Start()
        {
            if (Active)
            {
                return false;
            }
            else
            {
                Active = true;
                Console.WriteLine("Server started at port " + Port);
                return true;
            }
        }

        public bool Stop()
        {
            if (Active)
            {
                Active = false;
                Console.WriteLine("Server stopped...");
                clients.Clear();
                return true;
            }
            return false;
        }

        public void AddClient(IClient c)
        {
            clients.Add(c);
        }

        public bool RemoveClient(int index)
        {
            try
            {
                clients.RemoveAt(index);
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public bool ExecuteClient(int index)
        {
            try
            {
                clients.ElementAt(index).Execute();
                return true;
            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
                Console.WriteLine(e.StackTrace);
                return false;
            }
        }

        public override string ToString()
        {
            string retVal = "";
            foreach(IClient ic in clients)
            {
                retVal += ic.GetInfo() + "\n";
            }
            return retVal;
        }

        public void Log(string file)
        {
            StreamWriter sw = null;
            string ac = "no";
            if (Active)
            {
                ac = "yes";
            }

            try
            {
                sw = new StreamWriter(file);
                sw.WriteLine("MyServer\n");
                sw.WriteLine("port: " + Port + ",  clients: " + clients.Count + ",  active" + ac + "\n");
                sw.WriteLine("------------------------");
                foreach(IClient ic in clients)
                {
                    sw.WriteLine(ic.GetInfo());
                }
                sw.Close();

            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }

    }

}
