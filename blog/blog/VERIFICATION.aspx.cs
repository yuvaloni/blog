using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Data;
using System.Data.SqlClient;
namespace blog
{
    public partial class VERIFICATION : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            SqlCommand com = new SqlCommand("UPDATE TABLE users SET approved=1 WHERE email = @e");
            com.Parameters.Add("@e", SqlDbType.NVarChar).Value = Request.QueryString["email"];
            com.ExecuteNonQuery();
            con.Close();
            Thread.Sleep(5000);
            Response.Redirect("http://mindblogging.apphb.com/index.aspx")
        }
    }
}