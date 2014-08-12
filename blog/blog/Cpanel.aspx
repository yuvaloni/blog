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
          #myblogs{
            position:ABSOLUTE;
            left:5%;
            top:65%;
            z-index:1;
        }
          #create{
            position:ABSOLUTE;
            left:30%;
            top:20%;
            z-index:1;
          }
           #b{
            left:30%;
            top:30%;
            position:absolute;

            z-index:1;
         }
           #blog{
             position:absolute;
             z-index:1;
             top:30%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
                      #t{
            left:30%;
            top:40%;
            position:absolute;

            z-index:1;
         }
           #title{
             position:absolute;
             z-index:1;
             top:40%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
                      #sb{
            left:30%;
            top:50%;
            position:absolute;

            z-index:1;
         }
           #subtitle{
             position:absolute;
             z-index:1;
             top:50%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
           #docreate{
               position:absolute;
               top:60%;
               left:30%;
               height:5%;
               width:15%
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
    <div id="AddBlog">
        <ASP:Label runat="server" ForeColor="Black" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="create" Text="CREATE A BLOG" />
        <br />
         <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="BLOG'S NAME:" ID="b" runat="server" />
        <asp:TextBox ID="blog" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%"></asp:TextBox>
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="TITLE:" ID="t" runat="server" />
        <asp:TextBox ID="title" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%"></asp:TextBox>
         <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="SUB TITLE:" ID="sb" runat="server" />
        <asp:TextBox ID="subtitle" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%"></asp:TextBox>
         <asp:ImageButton ID="docreate" runat="server" ImageUrl="~/CREATE.jpg" OnClick="docreate_Click" />
    </div>
    <div id="myblogs">
    <ASP:Label runat="server" ForeColor="Black" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="myblogstext" Text="MY BLOGS" />
        <%
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("Data Source=6ed4b43a-6774-4c49-ace3-a38400c2e65b.sqlserver.sequelizer.com;Initial Catalog=db6ed4b43a67744c49ace3a38400c2e65b;Persist Security Info=True;User ID=wjjlfjckldmgpzwa;Password=nAgMM6DJAFoNs4ziyXhfj6KqXaTd3hM6h5GJtHH5YV8PgygENuXVXWZqYYXMkzQt");
            con.Open();
            System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand("Select * FROM USER_" + Session["user"], con);
            System.Data.SqlClient.SqlDataReader r = com.ExecuteReader();
            while (r.Read())
            {
                Response.Write("<a href='http://mindblogging.apphb.com/blogcpanel.aspx?blog="+r.GetString(0)+"<p style='font-family:arial;color:white;background:black;font-size:250%;font-weight:bold;'>" + r.GetString(0) + "</P>");
            }
             %>
    </div>
    </form>
</body>
</html>
