using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UIpublic
{
    public partial class ProductEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"].ToString() == "")
            {
                Session["userMsg"] = "You have to login to view this content";
                Session["userRdr"] = "../UIpublic/ProductEdit.aspx";
                Response.Redirect("../aAccount/userLogin.aspx");
            }
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            lblMessage.Text = "Updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }
    }
}