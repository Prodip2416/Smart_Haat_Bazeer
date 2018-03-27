using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class Country : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/Country.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }
            lblMessage.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            lblMessage.Text = "Item Deleted";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            lblMessage.Text = "Item Updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;

        }
    }
}