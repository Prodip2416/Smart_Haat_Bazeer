using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace HaatBazeer.UIpublic
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Product p = new Product();
            try
            {
                p.CategoryId = Convert.ToInt32(Request.QueryString["category"]);
            }
            catch
            {        
            }

            Repeater1.DataSource = p.SelectClient().Tables[0];
            Repeater1.DataBind();
        }

        
    }
}