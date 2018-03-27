using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class UserActive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnActive_Click(object sender, EventArgs e)
        {
            try
            {             
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress("prodip2416@gmail.com");
                    mailMessage.To.Add("aushomapto2416@gmail.com");
                    mailMessage.Subject = "Active Account";

                    mailMessage.Body = "<b>Click this link to active your account</b>"+"<br/>"+ "<a href=\"http://localhost:51552/aAccount/userLogin\">Login</a>";
                    mailMessage.IsBodyHtml = true;


                    SmtpClient smtpClient = new SmtpClient("smtp-mail.outlook.com", 587);
                    smtpClient.EnableSsl = true;
                    smtpClient.Credentials = new
                        System.Net.NetworkCredential("prodip.sarker.cse@gmail.com", "p131152416");

                    smtpClient.Send(mailMessage);
                   
                    lblMessage.ForeColor = System.Drawing.Color.Blue;
                    lblMessage.Text = "Please check your email for active your account";

                
                    btnActive.Enabled = false;
                
            }
            catch (Exception ex)
            {
                
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There is an unknown problem. Please try again later";
            }
        }
    }
}