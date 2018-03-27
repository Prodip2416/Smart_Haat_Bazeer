using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.aAccount
{
    public partial class userLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = Session["userMsg"].ToString();
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

            if(er>0)
                return;
            
            DAL.Users user= new Users();
            user.Email = txtEmail.Text;
            user.Password = txtPassword.Text;

            if (user.Login())
            {
                Session["userId"] = user.Id;
                Session["userName"] = user.Name;
                Session["userType"] = user.Type;
               

                if (chkRememberMe.Checked)
                {
                    HttpCookie cookie = new HttpCookie("users");
                    cookie["userId"] = Session["userId"].ToString();
                    cookie["userName"] = Session["userName"].ToString();
                    cookie["userType"] = Session["userType"].ToString();

                    Response.Cookies.Add(cookie);
                }

                if (Session["userType"].ToString() == "")
                {
                    Response.Redirect("Default.aspx");
                }
                Response.Redirect(Session["userRdr"].ToString());

            }
            else
            {
                lblMessage.Text = "Invalid Email Or Password";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}