<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Blue_Jays_Manager.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:70px; background-color:#fff; padding-left:10px; padding-right:10px">
        <div class="jumbotron">
            <h1>User Account Details</h1>
        </div>

        <div>
            <h1><asp:label runat="server" ID="LblName" CssClass="page-header"></asp:label></h1>
            <div class="row form-group">
                <div>
                    <asp:Label ID="LblPassword" CssClass="col-md-1" runat="server" Text="Password:"></asp:Label>
               </div>
                <div class="col-md-11">
                    <asp:linkbutton runat="server" ID="LinkBtnPasswordChange" OnClick="LinkBtnPasswordChange_Click" CausesValidation="False">[Change]</asp:linkbutton>

                    <div style="margin-top:15px; background-color:#134A8E">
                        <asp:panel runat="server" ID="PasswordPanel" CssClass="panel panel-default col-md-7">
                            <div class="form-horizontal"n style="margin-top:10px">
                               <div class=" form-group">
                                   <asp:label runat="server" CssClass="col-md-4 control-label" text="Current Password:"></asp:label>
                                   <div class="col-md-8 ">
                                        <asp:textbox CssClass="form-control" ID="currentPass" runat="server"></asp:textbox>
                                       <asp:requiredfieldvalidator runat="server" errormessage="Current password is required" ControlToValidate="currentPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                   </div>
                               </div>
                                <div class="form-group">
                                   <asp:label runat="server" CssClass="col-md-4 control-label" text="New Password:"></asp:label>
                                    <div class="col-md-8 ">
                                    <asp:textbox CssClass="form-control" ID="newPass" runat="server"></asp:textbox>
                                        <asp:requiredfieldvalidator runat="server" errormessage="New password is required" ControlToValidate="newPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                        <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" CssClass="text-danger"  runat="server" Display="Dynamic" ValidationExpression="^[a-zA-Z]\w{3,14}$" ControlToValidate="newPass" ErrorMessage="Invalid password format"></asp:RegularExpressionValidator>
                               </div>
                               </div>
                                <div class="form-group">
                                   <asp:label runat="server"  CssClass=" col-md-4 control-label" text="Confirm Password:"></asp:label>
                                     <div class="col-md-8">
                                        <asp:textbox CssClass="form-control" ID="confirmPass" runat="server"></asp:textbox>
                                         <asp:requiredfieldvalidator runat="server" errormessage="Current password is required" ControlToValidate="confirmPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                          <asp:Comparevalidator runat="server" ControlToCompare="newPass" ControlToValidate="confirmPass"  Display="Dynamic"  CssClass="text-danger" errormessage="Confirmed password is invalid"></asp:Comparevalidator>
                                    </div>

                                <div class="form-group" style="margin-bottom:0px">        
                                    <div class="col-md-10 pull-right">
                                        <asp:Button runat="server" CssClass="btn btn-info" ID="BtnChangePassword" text="Submit" OnClick="BtnChangePassword_Click"  />
                                    </div>
                                 </div>
                        </asp:panel>
                       </div>
                    </div>
                </div>
            </div>
            <div class="row">
                    <asp:Label ID="Label2" CssClass=" col-md-1" runat="server" Text="Email:"></asp:Label>
                <div class="col-md-11">
                    <asp:Label ID="LblEmail" runat="server" ></asp:Label>
                </div>
           </div>

            <div class="row">
                <div ">
                    <asp:Label ID="Label3" CssClass="col-md-1" runat="server" Text="Role:"></asp:Label>
                <div class="col-md-11">
                    <asp:Label ID="LblRole" runat="server"></asp:Label>
                </div>
           </div>
                <asp:label ID="LblConfirm" runat="server"></asp:label>
        </div>
    </div>

    

</asp:Content>
