using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer
{
    public partial class CityEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/CityEdit.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }

            if (!IsPostBack)
            {
                DropDownList ddlCity = (DropDownList)DetailsView1.FindControl("DropDownList1");
                ddlCity.Items.Insert(0,new ListItem("Select Country","0"));
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            lblMessage.Text = "Data Updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}