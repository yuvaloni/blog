﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogCPanel.aspx.cs" Inherits="blog.BlogCPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    <form id="form1" runat="server">
<div id ="top">
    <img src="LOGO.jpg" id="logo"/>
    <img src="STRIPE.jpg" id ="stripe" />
    <ASP:Label runat="server" ForeColor="White" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="hello"/>
    <asp:ImageButton ID="logout" runat="server" ImageUrl="~/LOGOUT.jpg" OnClick="logout_Click" />
    
    </div>
   <div id="myposts">
    <ASP:Label runat="server" ForeColor="Black" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="myblogstext" Text="MY BLOGS" />
        <%
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand("Select * FROM USER_" + (string)(Session["user"]), con);
            System.Data.SqlClient.SqlDataReader r = com.ExecuteReader();
            %>
       <table>

<%
    
            while (r.Read())
            {
                
        %>
                       
<tr>
    <td>
            <asp:ImageButton ID="img1" runat="server" ImageUrl="~/LOGOUT.jpg" />
    </td>
    </tr>

       <% 
                img1.Click += new ImageClickEventHandler((object sender, ImageClickEventArgs e) => {Response.Write("zona") ;});
                img1.Attributes.Add("onmouseover", "src='LOGOUT_CLICK.jpg'");
                img1.Attributes.Add("onmouseout", "src='LOGOUT.jpg'");
            }
             %>
           </table>
    </div>
    </form>
</body>
</html>