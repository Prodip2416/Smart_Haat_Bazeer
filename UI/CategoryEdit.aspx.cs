using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI_Admin
{
    public partial class CategoryEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/CategoryEdit.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }


            DropDownList ddlCategory = (DropDownList) DetailsView1.FindControl("DropDownList1");
               ddlCategory.Items.Insert(0,new ListItem("Select Category",""));
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            lblMessage.Text = "Updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            e.NewValues["categoryId"]= ((DropDownList)DetailsView1.FindControl("DropDownList1")).SelectedValue;
        }
    }
}