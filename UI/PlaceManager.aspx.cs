using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class PlaceManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/PlaceManager.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            lblMessage.Text = "Row Deleted";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}