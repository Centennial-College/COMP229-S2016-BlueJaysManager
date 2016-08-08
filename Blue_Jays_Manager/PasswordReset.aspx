﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="Blue_Jays_Manager.PasswordReset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Reset</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="container" style="min-height:700px;">
             <div class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" runat="server" href="~/">Toronto Blue Jays</a>
                        </div>
                    </div>
                </div>
             <h1  style="margin-top:70px" class="page-header"> <asp:Label ID="RsetPassword" runat="server">Admin Password Reset</asp:Label></h1>
             <asp:Label ID="confirmLabel" runat="server"></asp:Label>
             <div class="form-group row">
            <asp:Label runat="server" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New Password</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="NewPassword" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="NewPassword"
                    CssClass="text-danger" ErrorMessage="New Password is required." />
                 <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" CssClass="text-danger"  runat="server" Display="Dynamic" ValidationExpression="^[a-zA-Z]\w{3,14}$" ControlToValidate="NewPassword" ErrorMessage="Invalid password format"></asp:RegularExpressionValidator>
            </div>
                 <div class="col-md-6"></div>
        </div>

        <div class="form-group row" style="margin-bottom:0">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm Password</asp:Label>
            <div class="col-md-4">
                <asp:TextBox runat="server" ID="ConfirmPassword" CssClass="form-control" TextMode="Password" />
                 <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" ErrorMessage="Password is not confirmed." />
                 <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
        </div>
            <div class="col-md-6"></div>
        </div>
              <div class="form-group" style="margin-right: 5px;">
            <div class="col-md-2"></div>
            <div class="col-md-4">
                <asp:Button runat="server" CssClass="btn btn-default" Text="Reset" style="width: 115px; margin-bottom:10px;" ID="BtnResetPassword" BackColor="#134A8E" BorderColor="#134A8E" ForeColor="White" OnClick="BtnReset_Click" />
            </div>
            <div class="col-md-6"></div>   
        </div>
    </div>


       


    
    
    </form>
     <div class="container">
        <hr style="background-color:#232323; border: 1px solid #232323; border-radius:5px " />
                    <footer>
                        <p>&copy; <%: DateTime.Now.Year %> - Toronto Blue Jays Manager <span class="pull-right">Developers: Vinood Persad | Kevin Ma</span></p>

                    </footer>
         </div>
</body>
</html>
