<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="CS345_Proj2_Library_AaronYoung.ResetPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Reset Password</title>
    <!--change title-->
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
    <br /><br /><br /><br />
    <form id="form1" runat="server" class="form-horizontal">
                <div class="form-group"><asp:Label ID="Label3" runat="server" Text="Library Card Number:" CssClass="control-label col-sm-4" for="library_Card_Number_TB"></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="library_Card_Number_TB" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Enter your library card number" ControlToValidate="library_Card_Number_TB" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group"><asp:Label ID="Label4" runat="server" Text="Email:" CssClass="control-label col-sm-4" for="email_TB"></asp:Label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="email_TB" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="Enter your email" ControlToValidate="email_TB" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            <div class="form-group">
                <asp:Label ID="LabelMessage" runat="server" Text="" CssClass="col-sm-4 control-label" for="ButtonResetPassword"></asp:Label>
                <asp:Button ID="password_Reset_BTN" runat="server" class="btn btn-primary btn-lg" Text="NewPassword" OnClick="ButtonResetPassword_Click" />
            </div>
    </form>
    <script src="js/slider/jquery.liquid-slider.min.js"></script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/intro.js"></script>
    <script src="js/drawer.js"></script>
    <script src="js/ay_library.js"></script>
</body>
</html>

