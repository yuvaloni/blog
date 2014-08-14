<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogCPanel.aspx.cs" Inherits="blog.BlogCPanel" %>

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
    <ASP:Label runat="server" ForeColor="Black" Font-Size="250%" Font-Bold="true" Font-Names="Arial Narrow" id="myblogstext" Text="MY BLOGS"  />

    </div>
    <asp:Panel ID="Posts" runat="server"></asp:Panel>
    </form>

</body>
</html>
