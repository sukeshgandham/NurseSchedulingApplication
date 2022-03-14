using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace NurseSchedulingApplication
{
    public class sendemail
    {
        static void Main(string[] args)
        {
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential("nurseschedule12@gmail.com", "Nurse@321"),
                EnableSsl = true
            };
            //Nurse@321
            client.Send("nurseschedule12@gmail.com", "sukesh.sukke@gmail.com", "test", "testbody");
            Console.WriteLine("Sent");
            Console.ReadLine();
        }
    }
}