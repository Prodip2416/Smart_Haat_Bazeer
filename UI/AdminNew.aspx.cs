using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI
{
    public partial class AdminNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/AdminNew.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Inserted";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}