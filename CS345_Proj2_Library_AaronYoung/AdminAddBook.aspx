<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddBook.aspx.cs" Inherits="CS345_Proj2_Library_AaronYoung.AdminAddBook" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add Book</title>
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

    <!--Start Add Book-->
    
    <form id="addBookForm" runat="server" class="form-horizontal col-sm-offset-3 col-sm-6">
        <div style="text-align:center;">
            <asp:Label ID="Label1" runat="server" Text="Add a Book" Font-Size="25pt" ForeColor="#66FFFF"></asp:Label>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-book"></span></span>
                <asp:TextBox ID="title_TB" runat="server" Text="" CssClass="form-control" ToolTip="Title"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
             <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                 <asp:TextBox ID="author_TB" runat="server" Text="" CssClass="form-control" ToolTip="Author"></asp:TextBox>
             </div>
        </div>
        <div class="form-group">
             <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-barcode"></span></span>
                 <asp:TextBox ID="isbn_TB" runat="server" Text="" CssClass="form-control" ToolTip="13 digit ISBN"></asp:TextBox>
             </div>
        </div>
        <br />
        <!--CHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAANGE-->
        <div class="form-group">
            <asp:Button ID="add_BTN" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="add_BTN_Click"/>
            <!--onclick-->
        </div>
        <div style="text-align:center;">
            <asp:Label ID="message_LBL" runat="server" Text="testest" Visible="False" Font-Size="20pt" ForeColor="#66FFFF"></asp:Label>
        </div>

        <!--Start Grid View-->

        <div style="text-align:center;">
            <asp:Label ID="remove_LBL" runat="server" Text="Remove Books" Visible="True" Font-Size="25pt" ForeColor="#66FFFF"></asp:Label>
        </div>
        <div class="col-md-12 col-lg-12 col-md-offset-2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="admin_Books_DS" OnLoad="Page_Load" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="bookDeleteBTN" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:Button>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="author" HeaderText="Author" SortExpression="author" />
                    <asp:BoundField DataField="loan_ID" HeaderText="Loan ID" SortExpression="loan_ID" />
                    <asp:BoundField DataField="current_branch" HeaderText="Current Branch" SortExpression="current_branch" />
                    <asp:BoundField DataField="number_of_copies" HeaderText="Number of Copies" SortExpression="number_of_copies" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="admin_Books_DS" runat="server" ConnectionString="<%$ ConnectionStrings:ay_library %>" SelectCommand="SELECT * FROM [Books]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Books] WHERE [ISBN] = @original_ISBN AND [title] = @original_title AND [author] = @original_author AND [loan_ID] = @original_loan_ID AND [current_branch] = @original_current_branch AND [number_of_copies] = @original_number_of_copies" InsertCommand="INSERT INTO [Books] ([ISBN], [title], [author], [loan_ID], [current_branch], [number_of_copies]) VALUES (@ISBN, @title, @author, @loan_ID, @current_branch, @number_of_copies)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Books] SET [title] = @title, [author] = @author, [loan_ID] = @loan_ID, [current_branch] = @current_branch, [number_of_copies] = @number_of_copies WHERE [ISBN] = @original_ISBN AND [title] = @original_title AND [author] = @original_author AND [loan_ID] = @original_loan_ID AND [current_branch] = @original_current_branch AND [number_of_copies] = @original_number_of_copies">
                <DeleteParameters>
                    <asp:Parameter Name="original_ISBN" Type="String" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter Name="original_author" Type="String" />
                    <asp:Parameter Name="original_loan_ID" Type="Int32" />
                    <asp:Parameter Name="original_current_branch" Type="String" />
                    <asp:Parameter Name="original_number_of_copies" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ISBN" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="loan_ID" Type="Int32" />
                    <asp:Parameter Name="current_branch" Type="String" />
                    <asp:Parameter Name="number_of_copies" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="loan_ID" Type="Int32" />
                    <asp:Parameter Name="current_branch" Type="String" />
                    <asp:Parameter Name="number_of_copies" Type="Int32" />
                    <asp:Parameter Name="original_ISBN" Type="String" />
                    <asp:Parameter Name="original_title" Type="String" />
                    <asp:Parameter Name="original_author" Type="String" />
                    <asp:Parameter Name="original_loan_ID" Type="Int32" />
                    <asp:Parameter Name="original_current_branch" Type="String" />
                    <asp:Parameter Name="original_number_of_copies" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>


    <script src="js/slider/jquery.liquid-slider.min.js"></script>
    <script src="js/jquery.localize.min.js"></script>
    <script src="js/intro.js"></script>
    <script src="js/drawer.js"></script>
    <script src="js/ay_library.js"></script>
</body>
</html>
