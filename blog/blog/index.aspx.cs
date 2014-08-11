using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
namespace blog
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            login.Attributes.Add("onmouseover", "src='LOGIN_CLICK.jpg'");
            login.Attributes.Add("onmouseout", "src='LOGIN.jpg'");
            register.Attributes.Add("onmouseover", "src='REGISTER_CLICK.jpg'");
            register.Attributes.Add("onmouseout", "src='REGISTER.jpg'");
            
        }

        protected void login_Click(object sender, ImageClickEventArgs e)
        {
            loginscreen.Visible = true;
        }

        protected void close_Click(object sender, ImageClickEventArgs e)
        {
            loginscreen.Visible = false;
        }

        protected void dologin_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void doregister_Click(object sender, ImageClickEventArgs e)
        {   bool ver = true;

            SqlConnection con = new SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            if(registerpassword.Text!=registerverifypassword.Text)
            {
                ver = false;
                registerpword.Text="PASSWORDS DON'T MATCH";
                registerpword.ForeColor=System.Drawing.Color.Red;
            }
            SqlCommand com =new SqlCommand("SELECT * FROM users WHERE uname = @n",con);
            com.Parameters.Add("@n",SqlDbType.NVarChar).Value=registerusername.Text;
            SqlDataReader r = com.ExecuteReader();
            if(r.Read())
            {
                ver = false;
                registeruname.Text="USERNAME ALREADY EXISTS";
                registeruname.ForeColor=System.Drawing.Color.Red;

            }
            r.Close();
            SqlCommand com2 =new SqlCommand("SELECT * FROM users WHERE email = @n",con);
            com2.Parameters.Add("@n",SqlDbType.NVarChar).Value=registeremail.Text;
            SqlDataReader r2 = com.ExecuteReader();
            if(r2.Read())
            {
                ver = false;
                registeruname.Text="EMAIL ALREADY EXISTS";
                registeruname.ForeColor=System.Drawing.Color.Red;

            }
            r2.Close();
            if(ver)
            {
                 SqlCommand com3 =new SqlCommand("INSERT INTO users(uname, passwd, email, approved) VALUES(@u,@p,@e,@a)",con);
                 com3.Parameters.Add("@u",SqlDbType.NVarChar).Value=registerusername.Text;
                com3.Parameters.Add("@p",SqlDbType.NVarChar).Value=registerpassword.Text;
                com3.Parameters.Add("@e",SqlDbType.NVarChar).Value=registeremail.Text;
                com3.Parameters.Add("@a",SqlDbType.Int).Value=0;
                SmtpClient c = new SmtpClient()
                {
                    Host = "smtp.mandrillapp.com",
                    Port = 587,
                    EnableSsl=true,
                    UseDefaultCredentials=false,
                    Credentials = new NetworkCredential("mindblogging14@gmail.com", "7Mt68OBNNAia1ccGuUMuXQ")
                    
                };
                MailMessage m = new MailMessage(new MailAddress("mindblogging14@gmail.com", "MindBlogging team"), new MailAddress(registeremail.Text))
                {
                    Subject = "Please verify your email address",
                    IsBodyHtml = true,
                    Body = "Hello " + registerusername.Text + "! <br/> We welcome you to Mindblogging and look forward to see you using our website <br/> but first, please click the following link to verify your email address: <br/> <a href='http://mindblogging.apphb.com/VERIFICATION.aspx?email='" + registeremail.Text + "'>http://mindblogging.apphb.com/VERIFICATION.aspx?email=" + registeremail.Text + "</a> <br/> See you soon <br/> the mindblogging team" 
                    
                };
                com3.ExecuteNonQuery();
                c.Send(m);
               

               
            }
            con.Close();
            
        }

        protected void register_Click(object sender, ImageClickEventArgs e)
        {
            registerscreen.Visible = true;
        }

        protected void registerclose_Click(object sender, ImageClickEventArgs e)
        {
            registerscreen.Visible = false;
        }
    }
}