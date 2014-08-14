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
                
                r.Close();
                SqlCommand com2;
                if(owner)
                     com2 =new SqlCommand("SELECT * FROM BLOG_"+Request.QueryString["blog"],con);
                else
                {
                    com2 =new SqlCommand("SELECT * FROM BLOG_"+Request.QueryString["blog"]+" WHERE [owner]=@u",con);
                    com2.Parameters.Add("@u",SqlDbType.NVarChar).Value=(string)(Session["user"]);
                }
                SqlDataReader r2 = com2.ExecuteReader();
                while(r2.Read())
                {
                    Panel post = new Panel();
                    Label name = new Label();
                    name.Font.Name = "Arial Narrow";
                    name.Font.Size = 50;
                    name.Text = r2.GetString(1);
                    post.Controls.Add(name);
                    Image edit = new ImageButton();
                    edit.ImageUrl = "EDIT.jpg";
                    edit.Attributes.Add("onmouseover", "src='edit_click.jpg'");
                    edit.Attributes.Add("onmouseout", "src='EDIT.jpg'");
                    edit.Height = 100;
                    edit.Width = 150;
                   
                    
                    post.Controls.Add(edit);
                    
                    Image delete = new ImageButton();
                    delete.ImageUrl = "DELETEPOST.jpg";
                   
                    delete.Attributes.Add("onmouseover", "src='deletepost_click.jpg'");
                    delete.Attributes.Add("onmouseout", "src='DELETEPOST.jpg'");
                    delete.Height = 100;
                    delete.Width = 150;
                     
                    post.Controls.Add(delete);
                   Posts.Controls.Add(post);


                }
                r2.Close();
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