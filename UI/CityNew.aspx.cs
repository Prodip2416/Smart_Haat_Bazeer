using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class CityNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/CityNew.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }

            if (!IsPostBack)
            {
                DropDownList ddlCountry = (DropDownList)DetailsView1.FindControl("DropDownList1");
                ddlCountry.Items.Insert(0,new ListItem("Select Country","0"));
            }
        }

        protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Data Inserted";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}