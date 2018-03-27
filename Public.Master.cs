using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class Public : System.Web.UI.MasterPage
    {
        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
          
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"].ToString() == "")
            {
                HttpCookie cookie = Request.Cookies["users"];

                if (cookie != null)
                {
                    Session["userId"] = cookie["userId"];
                    Session["userName"] = cookie["userName"];
                    Session["userType"] = cookie["userType"];
                }
            }
        }

    
        public string LoadLogin()
        {
           string s = "";

            if (Session["userType"].ToString() == "")
            {
                s += "<li><a href=\"../aAccount/userRegister.aspx\">Register</a></li><li><a href=\"../aAccount/userLogin.aspx\">Login</a></li>";
            }
            else
            {
                s += "<li><a href=\"myAccount.aspx\">" + Session["userName"].ToString() + "</a></li><li><a href=\"../aAccount/userLogout.aspx\">Logout</a></li>";
            }

            return s;
        }
        string s = "";
        public string LoadMenu(int pid = 0)
        {
          
            DAL.Category c = new DAL.Category();
            System.Data.DataTable dt = new System.Data.DataTable();
            if (pid <= 0)
            {
                try
                {
                    dt = c.Select(" where c.categoryId is null").Tables[0];
                }
                catch { }
            }
            else
            {
                try
                {
                    dt = c.Select(" where c.categoryId = " + pid.ToString()).Tables[0];
                }
                catch { }

            }

            if (pid > 0 && dt.Rows.Count > 0)
            {
                s += "<ul>\n\r";
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                s += "<li><a href=\"../UIpublic/Shop.aspx?category=" + dt.Rows[i].ItemArray[0] + "\">" + dt.Rows[i].ItemArray[1]+ "</a>";
                LoadMenu(Convert.ToInt32(dt.Rows[i].ItemArray[0]));
                s += "</li>\n\r";
            }
            if (pid > 0 && dt.Rows.Count > 0)
            {
                s += "</ul>\n\r";
            }

            return s;
        }
    }
}