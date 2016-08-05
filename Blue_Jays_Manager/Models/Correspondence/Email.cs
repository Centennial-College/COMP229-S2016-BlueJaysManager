using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Blue_Jays_Manager.Models.Correspondence
{
    public class Email
    {
        public static void RegistrationConfirmation()
        {
            MailMessage registraionMail = new MailMessage("noreply.bluejays@gmail.com", "vinood.persad@gmail.com");

            registraionMail.Subject = "Test";
            registraionMail.Body = "Testing emails";

            SmtpClient client = new SmtpClient();
            client.Send(registraionMail);
        }

    }
}