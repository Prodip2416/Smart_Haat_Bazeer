using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI
{
    public partial class PlaceNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/PlaceNew.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }

            if (!IsPostBack)
            {
                DropDownList ddlManager = (DropDownList) DetailsView1.FindControl("DropDownList1");
                ddlManager.Items.Insert(0,new ListItem("Select One","0"));

                DropDownList ddlCity = (DropDownList)DetailsView1.FindControl("DropDownList2");
                ddlCity.Items.Insert(0, new ListItem("Select One", "0"));
            }
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