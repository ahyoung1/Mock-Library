<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CS345_Proj2_Library_AaronYoung.Registration" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registration</title>
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
        form{
            color:white;
        }
    </style>
    <script src='https://www.google.com/recaptcha/api.js'></script>
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
    <br /><br />
    <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="control-label col-sm-4" for="TextBoxFName"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxFName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="ReqFieldValidFName" runat="server" ControlToValidate="TextBoxFName" ErrorMessage="First Name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="control-label col-sm-4" for="TextBoxLName"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="TextBoxLName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxLName" ErrorMessage="Last Name is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Library Card Number" CssClass="control-label col-sm-4" for="library_Card_Num_TB"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="library_Card_Num_TB" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Library card number is required!" ControlToValidate="library_card_Num_TB" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <br />
            </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email" CssClass="control-label col-sm-4" for="TextBoxEmail"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email is required!" ControlToValidate="TextBoxEmail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="You must enter a valid email address!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Password" CssClass="control-label col-sm-4" for="TB_Password"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TB_Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TB_Password" Display="Dynamic" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TB_Password" Display="Dynamic" ErrorMessage="Password must be at least 6 characters without special characters!" ValidationExpression="[a-zA-Z0-9]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
            <br />
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Confirm Password" CssClass="control-label col-sm-4" for="TB_Password_Confirm"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="TB_Password_Confirm" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" display="Dynamic" runat="server" ErrorMessage="You must confirm your password!" ControlToValidate="TB_Password_Confirm" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" display="Dynamic" ControlToCompare="TB_Password" ControlToValidate="TB_Password_Confirm" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>
            </div>
            <br />
        </div>

        <!--site key: 6LdedR8UAAAAAF5FU4jgVkmnCMoQqbXYuwOf1gnt-->
        <!--secret key: 6LdedR8UAAAAALg05w_DGSUOZxUqGSeh9TxQ9c0V-->
        <div class="g-recaptcha col-md-6 col-md-offset-4" data-sitekey="6LdedR8UAAAAAF5FU4jgVkmnCMoQqbXYuwOf1gnt"></div>
        <br /><br />
        <div class="form-group">
            <asp:Label ID="Label10" runat="server" Text="Welcome" CssClass="control-label col-sm-4"></asp:Label>
            <div class="col-sm-4">
                <asp:Button class="btn btn-primary" ID="BTN_Submit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" usesubmitbehavior="true"/>
                <asp:Button class="btn btn-warning" type="reset" ID="BTN_Reset" runat="server" Text="Reset" />
            </div>
        </div>
    </form>

    <script src="js/slider/jquery.liquid-slider.min.js"></script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/intro.js"></script>
    <script src="js/drawer.js"></script>
    <script src="js/ay_library.js"></script>
</body>
</html>
