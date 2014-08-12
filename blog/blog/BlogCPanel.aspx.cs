using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace blog
{
    public partial class BlogCPanel : System.Web.UI.Page
    {
        bool owner;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            SqlCommand com =new SqlCommand("SELECT * FROM USER_"+(string)(Session["user"])+" WHERE blog=@b",con);
            com.Parameters.Add("@b", SqlDbType.NVarChar).Value = Request.QueryString["blog"];
            SqlDataReader r = com.ExecuteReader();
            if(!r.Read())
            {
                r.Close();
                con.Close();
                Response.Redirect("http://mindblogging.apphb.com/cpanel.aspx");
            }
            else
            {
                owner = r.GetInt32(1) == 1;
                do
                {
                    ImageButton shit = new ImageButton();
                    shit.ImageUrl = "CREATE.jpg";
                    shit.Attributes.Add("onmouseover", "src='LOGOUT_CLICK.jpg'");
                    shit.Attributes.Add("onmouseout", "src='LOGOUT.jpg'");
                    form1.Controls.Add(shit);
                    
                }
                while (r.Read());
                r.Close();
                con.Close();
            }
            logout.Attributes.Add("onmouseover", "src='LOGOUT_CLICK.jpg'");
            logout.Attributes.Add("onmouseout", "src='LOGOUT.jpg'");
            hello.Text = "HELLO " + (string)(Session["user"]);
           
        }

        protected void logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("http://mindblogging.apphb.com/index.aspx");
        }

    }
}