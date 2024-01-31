using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Priprema1
{
    class MyServer:IServer
    {
        private int port;
        private bool active;
        private List<IClient> clients;

        public int Port {
            get { return port; }
            set { port = value; }
        }

        public bool Active
        {
            get { return active; }
            set { active = value; }
        }

        public MyServer(int port)
        {
            Port = port;
            Active = false;
            clients = new List<IClient>();
        }

        public bool Start()
        {
            if (Active)
            {
                return false;
            }
            Active = true;
            Console.WriteLine("Server started at port" + Port + "\n");
            return true;
        }

        public bool Stop()
        {
            if (Active)
            {
                Active = false;
                Console.WriteLine("Server stopped...\n");
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
                Console.WriteLine(e.StackTrace);
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
                Console.WriteLine(e.StackTrace);
                return false;
            }
        }



        public override string ToString()
        {
            string str = "";
            foreach(IClient ic in clients)
            {
                str += ic.GetInfo() + "\n";
            }
            return str;
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
                sw.WriteLine("port: " + Port + "  ,client: " + clients.Count + " ,active: " + ac + "\n");
                sw.WriteLine("----------------------------\n");
                foreach(IClient ic in clients)
                {
                    sw.WriteLine(ic.GetInfo() + "\n");
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
