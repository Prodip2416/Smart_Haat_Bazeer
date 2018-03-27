using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.UIpublic
{

    public partial class ShopDetails : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            int shop = Convert.ToInt32(Request.QueryString["shop"]);

            if (Session["userType"].ToString() == "")
            {
                Session["userMsg"] = "You have to login to view this content";
                Session["userRdr"] = "../UIpublic/ShopDetails.aspx?shop="+shop;
                Response.Redirect("../aAccount/userLogin.aspx");
            }
        }     
        protected void btnComment_OnClick(object sender, EventArgs e)
        {
            int er = 0;

            if (txtComment.Text == "")
            {
                er++;
            }
            if(er>0)
                return;

            DAL.Comments c = new Comments();

            c.UserId = Convert.ToInt32(Session["userId"]);
            c.ProductId = Convert.ToInt32(Request.QueryString["shop"]);
            c.Description = txtComment.Text;

            if (c.Insert())
            {                
                txtComment.Text = "";
                Response.Redirect("../UIpublic/ShopDetails.aspx?shop="+Request.QueryString["shop"]);
            }
            else
            {
                lblMessage.Text = "Someting Wrong";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        public string LoadDelete()
        {
            string s = "";

            DAL.Comments c= new Comments();

            c.UserId = Convert.ToInt32(Session["userId"]);

            int id = Convert.ToInt32(Session["userId"]);

            if (c.SelectById())
            {

                if (id != c.UserId)
                {
                    s += "glyphicon glyphicon-trash";
                }
            }
            return s;
        }
        //protected void btnLike_OnClick(object sender, EventArgs e)
        //{
        //    DAL.Ratings r = new Ratings();

        //    r.ProductId = Convert.ToInt32(Request.QueryString["shop"]);
        //    r.UserId = Convert.ToInt32(Session["userId"]);
        //    if (r.Insert())
        //    {
        //        Button btn = (Button) Repeater1.FindControl("btnLike");
        //        btn.Text = "UnLike";
        //        Response.Redirect("../UIpublic/ShopDetails.aspx?shop=" + Request.QueryString["shop"]);
        //    }
        //    else
        //    {
        //        lblMessage.Text = "Someting Wrong";
        //        lblMessage.ForeColor = System.Drawing.Color.Red;
        //    }
        //}
    }
}