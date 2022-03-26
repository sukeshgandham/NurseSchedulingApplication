using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NurseSchedulingApplication
{
    public partial class radiobutton : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
           
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
           
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
           
            if (e.Day.IsOtherMonth)
            {
                e.Day.IsSelectable = false;
                e.Cell.BackColor = System.Drawing.Color.Black;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnsendemail_Click(object sender, EventArgs e)
        {
             string smtpAddress = "smtp.gmail.com";
             int portNumber = 587;
             bool enableSSL = true;
             string emailFromAddress = "nurseschedule12@gmail.com"; //Sender Email Address  
             string password = "Nurse@321"; //Sender Password  
             string emailToAddress = "sukesh.sukke@gmail.com"; //Receiver Email Address  
             string subject = "Hello";
             string body = "Hello, This is Email sending test using gmail.";
            
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFromAddress);
                mail.To.Add(emailToAddress);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("D:\\TestFile.txt"));//--Uncomment this to send any attachment  
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }

    }
    
}