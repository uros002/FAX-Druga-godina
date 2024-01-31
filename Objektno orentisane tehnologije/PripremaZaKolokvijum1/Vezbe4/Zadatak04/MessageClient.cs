using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zadatak04
{
    class MessageClient:IClient
    {
        private string message;

        public MessageClient(string message)
        {
            this.message = message;
        }

        public string Message {
            get { return message; }
            set { message = value; }
        }

        public string GetInfo()
        {
            return "MessageClient: " + Message + "\n";
        }

        public void Execute()
        {
            Console.WriteLine("Operation executed - " + "MessageClient: " + Message + "\n");
        }
    }
}
