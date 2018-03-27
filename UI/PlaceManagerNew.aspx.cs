using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI
{
    public partial class PlaceManagerNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/PlaceManagerNew.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["image"] = ((FileUpload)DetailsView1.FindControl("fleImage")).FileName;
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            FileUpload fle = (FileUpload)DetailsView1.FindControl("fleImage");
            fle.SaveAs(Server.MapPath("uploads/images/"+fle.FileName));

            lblMessage.Text = "Inserted";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}