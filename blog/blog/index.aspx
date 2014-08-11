<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="blog.index" %>

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
        #login
        {
            left:0;
            top:0;
            position:fixed;
            height:15%;
            width:15%;
            z-index:-1;
        }
        #register
        {
            left:15%;
            top:0;
            position:fixed;
            height:15%;
            width:15%;
            z-index:-1;
        }
        #loginframe{
            left:25%;
            top:20%;
            position:fixed;
            height:50%;
            width:50%;
            z-index:-1;
        }
         #close{
            left:64%;
            top:21%;
            position:fixed;
            height:10%;
            width:10%;
            z-index:-1;
        }
         #uname{
            left:30%;
            top:30%;
            position:fixed;

            z-index:-1;
         }
         #pword{
            left:30%;
            top:40%;
            position:fixed;

            z-index:-1;
         }
           #wrong{
            left:30%;
            top:20%;
            position:fixed;

            z-index:-1;
         }
         #username{
             position:fixed;
             z-index:0;
             top:30%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
             #password{
             position:fixed;
             z-index:0;
             top:40%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
             #dologin{
             position:fixed;
             z-index:0;
             top:43%;
             left:39%;
             height:25%;
             width:20%;
             }
               #registerframe{
            left:25%;
            top:20%;
            position:fixed;
            height:70%;
            width:50%;
            z-index:-1;
        }
         #registerclose{
            left:64%;
            top:21%;
            position:fixed;
            height:10%;
            width:10%;
            z-index:-1;
        }
         #registeruname{
            left:30%;
            top:30%;
            position:fixed;

            z-index:-1;
         }
         #registerpword{
            left:30%;
            top:40%;
            position:fixed;

            z-index:-1;

         }
           #registerverpword{
            left:30%;
            top:50%;
            position:fixed;

            z-index:-1;
         }
           #registerem{
            left:30%;
            top:60%;
            position:fixed;

            z-index:-1;
         }
         #registerusername{
             position:fixed;
             z-index:0;
             top:30%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
             #registerpassword{
             position:fixed;
             z-index:0;
             top:40%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         } 
             #registerverifypassword{
             position:fixed;
             z-index:0;
             top:50%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
            #registeremail{
             position:fixed;
             z-index:0;
             top:60%;
             left:45%;
             height:2%;
             width:20%;
             font-size:90%;
         }
             #doregister{
             position:fixed;
             z-index:0;
             top:63%;
             left:39%;
             height:25%;
             width:20%;
             font-size:90%;
             }


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id ="top">
    <img src="LOGO.jpg" id="logo"/>
    <img src="STRIPE.jpg" id ="stripe" />
    <asp:ImageButton ID="login" runat="server" ImageUrl="~/LOGIN.jpg" OnClick="login_Click"/>
    <asp:ImageButton ID="register" runat="server" ImageUrl="~/REGISTER.jpg" OnClick="register_Click" />
    </div>
    <asp:panel runat="server" ID="loginscreen" Visible="false">
        <img src="frame.png" id="loginframe" />
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="USER NAME:" ID="wrong" ForeColor="Red" runat="server" />
        <asp:ImageButton ID="close" runat="server" ImageUrl="~/close.png" OnClick="close_Click" />
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="USER NAME:" ID="uname" runat="server" />
        <asp:TextBox ID="username" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%"></asp:TextBox>
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="PASSWORD:" ID="pword" runat="server" />
        <asp:TextBox ID="password" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%" TextMode="Password"></asp:TextBox>
        <asp:ImageButton ID="dologin" runat="server" ImageUrl="~/LOGIN_CLICK.jpg" OnClick="dologin_Click"/>
    </asp:panel>
        <asp:panel runat="server" ID="registerscreen" Visible="false">
        <img src="frame.png" id="registerframe" />
        <asp:ImageButton ID="registerclose" runat="server" ImageUrl="~/close.png" OnClick="registerclose_Click" />
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="USER NAME:" ID="registeruname" runat="server" />
        <asp:TextBox ID="registerusername" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%"></asp:TextBox>
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="PASSWORD:" ID="registerpword" runat="server" />
        <asp:TextBox ID="registerpassword" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%" TextMode="Password"></asp:TextBox>
        <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="VERIFY PASSWORD:" ID="registerverpword" runat="server" />
        <asp:TextBox ID="registerverifypassword" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%" TextMode="Password"></asp:TextBox>
                    <asp:Label Font-Bold="true" Font-Names="Arial Narrow" Font-Size="100%" Text="EMAIL:" ID="registerem" runat="server" />
        <asp:TextBox ID="registeremail" runat="server"  Font-Bold="true" Font-Names="Arial Narrow" Font-Size="90%" Height="2%" Width="20%" ></asp:TextBox>
        <asp:ImageButton ID="doregister" runat="server" ImageUrl="~/REGISTER_CLICK.jpg" OnClick="doregister_Click"/>
    </asp:panel>
    </form>
</body>
</html>
