using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;

namespace HaatBazeer
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        //private static string theme;

        protected void Page_PreInit(object sender, EventArgs e)
        {
            //string thm;

            //thm = (string)Session["Theme"];

            //if (thm != null)
            //{
            //    Page.Theme = thm;
            //    DropDownList1.Text = thm;
            //}
            //else
            //{
            //   Session["Theme"] = DropDownList1.Text;
            //   Page.Theme = "Blue";
            //}
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;

        }


        public string LoadLogin()
        {
            string s = "";

            if (Session["type"].ToString() == "")
            {
                s += "<li><a href=\"Register.aspx\">Register</a></li><li><a href=\"../aAccount/Login.aspx\">Login</a></li>";
            }
            else
            {
                s += "<li><a href=\"myAccount.aspx\">" + Session["name"].ToString() + "</a></li><li><a href=\"../aAccount/Logout.aspx\">Logout</a></li>";
            }

            return s;

        }
        protected void master_Page_PreLoad(object sender, EventArgs e)
        {


            if (Session["type"].ToString() == "")
            {
                HttpCookie cookie = Request.Cookies["admin"];

                if (cookie != null)
                {
                    Session["id"] = cookie["id"];
                    Session["name"] = cookie["name"];
                    Session["type"] = cookie["type"];
                }
            }


            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }


        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //  //  theme = DropDownList1.SelectedValue.ToString();
        //    Session["Theme"] = DropDownList1.Text;
        //    Server.Transfer(Session["rdr"].ToString());

        // //   Response.Redirect(Session["rdr"] + "?theme=" + theme);
        //}
    }

}