using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
namespace blog
{
    public partial class Cpanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            logout.Attributes.Add("onmouseover", "src='LOGOUT_CLICK.jpg'");
            logout.Attributes.Add("onmouseout", "src='LOGOUT.jpg'");
            docreate.Attributes.Add("onmouseover", "src='CREATE_CLICK.jpg'");
            docreate.Attributes.Add("onmouseout", "src='CREATE.jpg'");
            hello.Text = "HELLO " + (string)(Session["user"]);
        }

        protected void logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("http://mindblogging.apphb.com/index.aspx");
        }

        protected void docreate_Click(object sender, ImageClickEventArgs e)
        {

        }


    }
}