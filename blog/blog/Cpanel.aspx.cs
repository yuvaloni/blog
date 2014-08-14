using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Data.SqlClient;
using System.Data;
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
            bool ver = true;
            if (blog.Text == "")
            {
                ver = false;
                notification.ForeColor = System.Drawing.Color.Red;
                notification.Text="BLOG'S NAME CAN'T BE EMPTY";

            }
            else
            {
                SqlConnection con = new SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
                con.Open();
                SqlCommand com = new SqlCommand("Select * from blogs WHERE name=@n", con);
                com.Parameters.Add("@n" ,SqlDbType.NVarChar).Value=blog.Text;
                SqlDataReader r = com.ExecuteReader();
                if(r.Read())
                {
                    ver = false;
                    notification.ForeColor = System.Drawing.Color.Red;
                    notification.Text = "BLOG'S NAME ALREADY TAKEN";
                }
                r.Close();
                if(ver)
                {
                    SqlCommand com2 = new SqlCommand("INSERT INTO blogs(name,title,subtitle,uname,posts) values(@n,@t,@sb,@u,0)", con);
                    com2.Parameters.Add("@n", SqlDbType.NVarChar).Value = blog.Text;
                    com2.Parameters.Add("@t", SqlDbType.NVarChar).Value = title.Text;
                    com2.Parameters.Add("@sb", SqlDbType.NVarChar).Value = subtitle.Text;
                    com2.Parameters.Add("@u", SqlDbType.NVarChar).Value = (string)(Session["user"]);
                    com2.ExecuteNonQuery();
                    SqlCommand com3 = new SqlCommand("INSERT INTO USER_" + (string)(Session["user"])+"(blog,[owner]) values(@n,1)", con);
                    com3.Parameters.Add("@n", SqlDbType.NVarChar).Value = blog.Text;
                    com3.ExecuteNonQuery();
                    SqlCommand com4 = new SqlCommand("CREATE TABLE BLOG_" + blog.Text + "(id bigint, title nvarchar(max), content text, [owner] nvarchar(max), [time] nvarchar(max))", con);
                    com4.ExecuteNonQuery();
                    SqlCommand com5 = new SqlCommand("CREATE TABLE BLOGEDITORS_" + blog.Text + "([name] nvarrchar(max))", con);
                    com5.ExecuteNonQuery();
                    con.Close();
                    notification.ForeColor = System.Drawing.Color.Green;
                    notification.Text = "BLOG CREATED SUCCESSFULLY";
                }

            }
        }


    }
}