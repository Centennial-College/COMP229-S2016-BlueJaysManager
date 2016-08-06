using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace Blue_Jays_Manager.Models.Correspondence
{
    public class Email
    {
        public static void RegistrationConfirmation(string username, string password, string firstName, string lastName, string email, int coachNum)
        {
            MailMessage registraionMail = new MailMessage("noreply.bluejays@gmail.com", email);
            registraionMail.IsBodyHtml = true;
            registraionMail.Subject = "Toronto Blue Jays";
            registraionMail.Body = "<h3>Registration Confirmation</h3>" +
                                   "<br/>" +
                                   "<p>Thank you for registering for you admin account with the Toronto Blue Jays</p>" +
                                   "<p>Below you will find your registration details.</p>" +
                                   "<br/>" +
                                   "<p><b>Coach Name:</b> " + firstName + " " + lastName + "<br/>" +
                                   "<b>Coach Number:</b> " + coachNum.ToString() + "<br/>" +
                                   "<b>username:</b> " + username + "<br/>" +
                                   "<b>password:</b> " + password + "</p>" +
                                   "<br>" +
                                   "<p>Thank you<br/>" +
                                   "Blue Jays Administration</p>";
                                   
                                        

            SmtpClient client = new SmtpClient();
            client.Send(registraionMail);
        }

        public static void PasswordChangeConfirmation()
        {

        }

        private void SendEmail()
        {
            //MailMessage email = ne
        }

    }
}