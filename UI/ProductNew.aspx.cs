using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HaatBazeer.UI
{
    public partial class ProductNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["type"].ToString() == "")
            {
                Session["msg"] = "You have to login to view this content";
                Session["rdr"] = "../UI/ProductNew.aspx";
                Response.Redirect("../aAccount/login.aspx");
            }

            if (!IsPostBack)
            {
                DropDownList ddlUser = (DropDownList) DetailsView1.FindControl("DropDownList1");
                ddlUser.Items.Insert(0,new ListItem("Select Users","0"));

                DropDownList ddlCategory = (DropDownList)DetailsView1.FindControl("DropDownList2");
                ddlCategory.Items.Insert(0, new ListItem("Select Category", "0"));
            }
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["ip"] = Request.UserHostAddress;
            e.Values["date"] = DateTime.Now;
            e.Values["fileName"] = ((FileUpload) DetailsView1.FindControl("fleImage")).FileName;

        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            FileUpload fle = (FileUpload)DetailsView1.FindControl("fleImage");
            fle.SaveAs(Server.MapPath("uploads/productImages/" + fle.FileName));


            lblMessage.Text = "Product Inserted";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }
    }
}