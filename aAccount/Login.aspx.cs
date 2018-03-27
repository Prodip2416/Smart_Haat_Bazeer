using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.aAccount
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = Session["msg"].ToString();
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int er = 0;

            if (txtEmail.Text == "")
            {
                er++;
            }
            if (txtPassword.Text == "")
            {
                er++;
            }
            if (er > 0)
           return;
            
            DAL.Admin a= new Admin();
            a.Email = txtEmail.Text;
            a.Password = txtPassword.Text;

            if (a.Login())
            {
                Session["id"] = a.Id;
                Session["name"] = a.Name;
                Session["type"] = a.Type;

                if (chkRememberMe.Checked)
                {
                    HttpCookie cookie = new HttpCookie("admin");
                    cookie["id"] = Session["id"].ToString();
                    cookie["name"] = Session["name"].ToString();
                    cookie["type"] = Session["type"].ToString();

                    Response.Cookies.Add(cookie);
                }

                if (Session["type"].ToString() == "")
                {
                   Response.Redirect("Default.aspx");
                }
                Response.Redirect(Session["rdr"].ToString());


            }
            else
            {
                lblMessage.Text = "Invalid Email Or Password";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}