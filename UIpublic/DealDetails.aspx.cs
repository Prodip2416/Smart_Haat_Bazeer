using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.UIpublic
{
    public partial class DealDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"].ToString() == "")
            {
                Session["userMsg"] = "You have to login to view this content";
                Session["userRdr"] = "../UIpublic/DealDetails.aspx";
                Response.Redirect("../aAccount/userLogin.aspx");
            }

            DAL.Product p = new Product();
            p.Id = Convert.ToInt32(Request.QueryString["shop"]);

            if (p.SelectName())
            {
                lblProduct.Text = p.Name;
            }

            if (!IsPostBack)
            {
                DAL.Place Pl= new Place();
                ddlPlace.DataSource = Pl.SelectName().Tables[0];
                ddlPlace.DataTextField = "name";
                ddlPlace.DataValueField = "id";
                ddlPlace.DataBind();

                ddlPlace.Items.Insert(0, new ListItem("Select One", "0"));
            }

            DAL.Users u = new Users();

            try
            {
                u.Id = Convert.ToInt32(Session["userId"]);
            }
            catch { }

            if (u.UserName())
            {
                lblUserName.Text = u.Name;
            }

        }
        public int ManagerId;
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int er = 0;
            if (Request.QueryString["shop"] == null)
            {
                er++;
            }
            if (Session["userId"] == null)
            {
                er++;
            }
            if (ddlPlace.SelectedValue.ToString() == "" || ddlPlace.SelectedValue == null)
            {
                er++;
            }
            if (txtRemarks.Text == "")
            {
                er++;
            }

            if (er > 0)
                return;


            DAL.DealDetails dd = new DAL.DealDetails();

            dd.ProductId = Convert.ToInt32(Request.QueryString["shop"]);
            dd.UserId = Convert.ToInt32(Session["userId"]);
            dd.PlaceId = Convert.ToInt32(ddlPlace.SelectedValue);
            dd.DateTime = DateTime.Now;
            dd.Remarks = txtRemarks.Text;

            if (dd.Insert())
            {
                lblMessage.Text = "Thank you! " +"<b>"+ lblUserName.Text+"</b>" + ", Aj soon aj possible PlaceManager contact with You :)";
                LoadMap();
                DAL.PlaceManagers pm = new PlaceManagers();
          
                Repeater1.DataSource = pm.SelectId(ManagerId).Tables[0];
                Repeater1.DataBind();

                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Sorry! This product may be buy someone. Please try another one."+"<b>" +" Stay with us"+ "</b>"+",Thanq You :)";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
        public string LoadMap()
        {
            string map = "";
            DAL.Place p = new Place();
            p.Id = Convert.ToInt32(ddlPlace.SelectedValue);

            if (p.LoadMapLink())
            {
                map = p.MapLink;
                ManagerId = Convert.ToInt32(p.PlaceManager);
            }
            return map;
        }
    }
}