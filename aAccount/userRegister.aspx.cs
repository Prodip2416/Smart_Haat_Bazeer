using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.aAccount
{
    public partial class userRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["Image"] = ((FileUpload) DetailsView1.FindControl("fleImage")).FileName;
            e.Values["date"] = DateTime.Now;
            e.Values["ip"] = Request.UserHostAddress;
            e.Values["type"] = "user";
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            FileUpload fle = (FileUpload)DetailsView1.FindControl("fleImage");
            fle.SaveAs(Server.MapPath("../UIpublic/profilePicture/images/"+fle.FileName));

            lblMessage.Text = "Registration Successfully Complete";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }
    }
}