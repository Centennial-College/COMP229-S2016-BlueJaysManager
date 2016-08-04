<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Blue_Jays_Manager.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="background-color:#243B69; padding-bottom: 100px">
        
        <div class="col-md-4"></div>
        <div class="col-md-4 container registerView">

    <div class="form-horizontal" style="margin-right: 50px; margin-left:5px;">
        <h2 class="page-header">Register Admin User</h2>
        <asp:Label ID="UserExists" runat="server"></asp:Label>
        <br />
        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CoachId" CssClass="col-md-4 control-label">Coach Number</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="CoachId" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CoachId"
                    CssClass="text-danger" ErrorMessage="The Coach Number field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-4 control-label">First Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                    CssClass="text-danger" ErrorMessage="The First Name field is required." />
            </div>
        </div>

         <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-4 control-label">Last Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                    CssClass="text-danger" ErrorMessage="The Last Name field is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">User Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The username field is required." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" CssClass="text-danger"  runat="server" Display="Dynamic" ValidationExpression="^[a-zA-Z]\w{3,14}$" ControlToValidate="Password" ErrorMessage="Invalid password format"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-4 control-label">Confirm password</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

        <hr />
        <div class="form-group pull-right">
            <div class="col-md-12">
                <input id="Resetbtn" type="reset" class="btn btn-default" style="width: 90px"  value="reset" />
                 <asp:Button runat="server" Text="Register" CssClass="btn btn-primary" style="width: 90px"  ID="BtnRegister" OnClick="BtnRegister_Click"/>
               
            </div>
        </div>
    </div>
     </div>

        <div class="col-md-4"></div>
    </div>
</asp:Content>
