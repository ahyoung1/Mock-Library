﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CS345_Proj2_Library_AaronYoung.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <!--change title-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/introjs.css" />
    <link rel="stylesheet" href="css/bootstrap-drawer.css" />
    <link rel="stylesheet" href="css/liquid-slider.css" />
    <link rel="stylesheet" href="css/ay_library.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.touchswipe/1.6.4/jquery.touchSwipe.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ckeditor_4.5.7_standard/ckeditor/ckeditor.js"></script>
    <!--add color for form-->
    <style type="text/css">
        footer p {
        color:white;
        }
    </style>
</head>
<body class="has-drawer">
    <header class="container">
        <nav class="collapse navbar-collapse navbar-inverse">
            <ul class="nav navbar-nav" id="navBar">
                <li><a href="Home.aspx" data-localize="nav.home">Home</a></li>
                <li><a href="Login.aspx" data-localize="nav.login">Login</a></li>
                <li><a href="Registration.aspx" data-localize="nav.register">Register</a></li>
                <li><a href="Contact.aspx" data-localize="nav.contact">Contact</a></li>
                <li><a href="PatronBooks.aspx" data-localize="nav.my_books">My Books</a></li>
                <li><a href="PatronInfo.aspx" data-localize="nav.patron_info">Patron Information</a></li>
                <li><a href="AllBooks.aspx" data-localize="nav.full_catalog">Full Catalog</a></li>
                <li><a href="AdminSeePatrons.aspx" data-localize="nav.all_patrons">ADMIN See All Patrons</a></li>
                <li><a href="AdminAddBook.aspx" data-localize="nav.add_book">ADMIN Add a Book</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-localize="nav.options" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span>Options</span><span class="caret" /></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-submenu"><a href="#" data-localize="nav.languages">Languages</a>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="en" data-localize="nav.english">English</a></li>
                                <li><a href="#" id="ch" data-localize="nav.chinese">Chinese</a></li>
                                <li><a href="#" id="sp" data-localize="nav.spanish">Spanish</a></li>
                            </ul>
                        </li>
                        <li><a href="#" id="help" onclick="startIntro();" data-localize="nav.tutorial">Tutorial</a></li>
                        <li><a href="AdminStuff.aspx" data-localize="nav.admin">Admin Login</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>
    <div id="drawerMenu" class="drawer dw-xs-8 fold">
        <div class="drawer-controls visible-xs-block">
            <a href="#drawerMenu" data-toggle="drawer" class="btn btn-primary btn-lg" style="font-size: 30px; padding: 0px 5px 0px 5px">≡</a>
        </div>
        <div class="drawer-contents">
            <div class="drawer-heading">
                <h2 class="drawer-title">Menu</h2>
            </div>
            <ul class="drawer-nav">
                <li role="presentation"><a href="Home.aspx">Home</a></li>
                <li role="presentation"><a href="Login.aspx">Login</a></li>
                <li role="presentation"><a href="Registration.aspx">Register</a></li>
                <li role="presentation"><a href="Contact.aspx">Contact</a></li>
                <li role="presentation"><a href="PatronBooks.aspx">My Books</a></li>
                <li role="presentation"><a href="PatronInfo.aspx">Patron Info</a></li>
                <li role="presentation"><a href="AllBooks.aspx">Full Catalog</a></li>
                <li role="presentation"><a href="AdminSeePatrons.aspx">ADMIN See All Patrons</a></li>
                <li role="presentation"><a href="AdminAddBook.aspx">ADMIN Add a Book</a></li>
            </ul>
            <div class="drawer-body">
                <p>
                    This website is for the patrons of the Wonderland Library System
                </p>
                <p><a href="#" onclick="en.click()">English</a></p>
                <p><a href="#" onclick="ch.click()">Chinese</a></p>
                <p><a href="#" onclick="sp.click()">Spanish</a></p>
                <p><a href="#" onclick="startIntro();">Help</a></p>
            </div>
            <div class="drawer-footer locked text-center">
                <small>&copy; Aaron Young</small>
            </div>
        </div>
    </div>

    <form id="loginForm" runat="server" class="form-horizontal col-sm-offset-3 col-sm-6">
        <h3>Login to your account</h3>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-credit-card"></span></span>
                <asp:TextBox ID="libCard_TB" runat="server" Text="" CssClass="form-control" ToolTip="Library Card Number"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
             <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                 <asp:TextBox ID="password_TB" runat="server" Text="" CssClass="form-control" TextMode="Password" ToolTip="Password"></asp:TextBox>
             </div>
        </div>
        <hr/>
        <a href="Registration.aspx">Create an account</a>
        <br />
        <div class="form-group">
            <asp:Button ID="login_BTN" runat="server" Text="Login" CssClass="btn btn-success" OnClick="login_BTN_Click" />
            <asp:Label ID="message_LBL" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:LinkButton ID="resetLink_BTN" runat="server" Enabled="false" Visible="false" PostBackUrl="~/ResetPassword.aspx">Forgot Password</asp:LinkButton>

        </div>
    </form>

    <script src="js/slider/jquery.liquid-slider.min.js"></script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/intro.js"></script>
    <script src="js/drawer.js"></script>
    <script src="js/ay_library.js"></script>
</body>
</html>
