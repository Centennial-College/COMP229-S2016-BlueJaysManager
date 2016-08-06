<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Blue_Jays_Manager.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:150px">
        
        <div class="col-md-4"></div>
            <div class="col-md-4">

            <div class="form-horizontal loginForm" style="margin-left:15px; margin-right:30px">
               <div class="page-header" style="margin-bottom:5px">
                    <div class="row">
                        <h1 style="margin-top:20px" class="pull-left">Jays Login</h1> 
                    </div>
             </div>
                   <asp:Label ID="InvalidLabel" runat="server"></asp:Label>
                <br />
             <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-4 control-label">User Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The User Name is required." />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="Password is required." />
            </div>
        </div>
        <div class="form-group ">
            <div class="col-md-4"></div>
            <asp:CheckBox ID="checkboxRemeber" runat="server" Text="Remember me" CssClass="col-md-8 checkbox"/>          
        </div>
                <hr />
        <div class="form-group pull-right" style="margin-right: 5px;">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Login" CssClass="btn btn-default" style="width: 90px; margin-bottom:10px;" ID="BtnLogin" OnClick="BtnLogin_Click" BackColor="#134A8E" BorderColor="#134A8E" ForeColor="White" />
            </div>
        </div>
      </div>
        

                </div>
         <div class="col-md-2" style="padding-left:0px">
            <asp:Image ID="Image1" CssClass="img-responsive pull-right" style="margin-right:20px;" Height="200px" Width="230px" ImageURL="~/Images/torontologo.png" runat ="server" />
        </div>
        <div class="col-md-2"></div>
       
        </div>
        
    
</asp:Content>
