using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.aAccount
{
    public partial class userLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userId"] = "";
            Session["userName"] = "";
            Session["userType"] = "";
            Session["userRdr"] = "";
            Session["userMsg"] = "";
        }
    }
}