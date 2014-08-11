<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cpanel.aspx.cs" Inherits="blog.Cpanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
        <style type="text/css">
        #logo{
            right:0;
            top:0;
            position:fixed;
            height:15%;
            width:40%;
            z-index:0;
        }
        #stripe{
            right:0;
            top:0;
            position:fixed;
            height:15%;
            width:100%;
            z-index:-1;
            
        }
        #hello{
            position:fixed;
            left:1%;
            top:5%;
            z-index:-1;
        }
                #logout
        {
            left:20%;
            top:0;
            position:fixed;
            height:15%;
            width:15%;
            z-index:-1;
        }
            </style>
<body>
    <form id="form1" runat="server">
<div id ="top">
    <img src="LOGO.jpg" id="logo"/>
    <img src="STRIPE.jpg" id ="stripe" />
    <ASP:Label runat="server" ForeColor="White" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="hello"/>
    <asp:ImageButton ID="logout" runat="server" ImageUrl="~/LOGOUT.jpg" OnClick="logout_Click" />
    
    </div>
    <div id="myblogs">
    <ASP:Label runat="server" ForeColor="White" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="myblogs" Text="MY BLOGS" />
        <%
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand("Select * FROM USER_" + Session["user"], con);
            System.Data.SqlClient.SqlDataReader r = com.ExecuteReader();
            while (r.Read())
            {
                Response.Write("<p style='background-color:black;color:white;20% Arial Narrow;'>" + r.GetString(0) + "</P>");
            }
             %>
    </div>
    </form>
</body>
</html>
