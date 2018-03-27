using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI
{
    public partial class PlaceManagerEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/PlaceManagerEdit.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            //FileUpload fle = (FileUpload) DetailsView1.FindControl("fleImage");
            //fle.SaveAs(Server.MapPath("uploads/images/"+fle.FileName));

            lblMessage.Text = "Updated";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
          //  e.NewValues["image"] = ((FileUpload) DetailsView1.FindControl("fleImage")).FileName;
        }
    }
}