using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI.Public
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"].ToString() == "")
            {
                Session["userMsg"] = "You have to login to view this content";
                Session["userRdr"] = "../UIpublic/Profile.aspx";
                Response.Redirect("../aAccount/userLogin.aspx");
            }
        }
    }
}