<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Blue_Jays_Manager.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="margin-top:50px; min-height:650px; background-color:#fff; padding-left:0; padding-right:0" >
        <div class="jumbotron" style="background-color:#134A8E; color:#fff">
            <h1>User Account Details</h1>
        </div>

                        <div >
                            <h1><asp:label runat="server" ID="LblName" CssClass="page-header"></asp:label></h1>
                        </div>

                    <div class="row">
                             <div class="col-md-1">
                                    <asp:Label ID="Label3" runat="server" Text="Role:"></asp:Label>
                             </div>
                             <div class="col-md-11">
                                   <asp:Label ID="LblRole" runat="server"></asp:Label>
                              </div>
                       </div>   


                        <div class="row">
                            <div class="col-md-1">
                                <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                            </div>
                            <div class="col-md-11">
                                <asp:Label ID="LblEmail" runat="server" ></asp:Label>
                            </div>
                       </div>

                        <div class="row">
                            <div class=" col-md-1">
                                <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
                           </div>
                            <div class="col-md-11">

                              <asp:LinkButton ID="LinkBtnPasswordChange" OnClick="LinkBtnPasswordChange_Click" runat="server" CausesValidation="False">[Change]</asp:LinkButton>

                            <div id="panel" style="margin-top:15px;">
                               <asp:panel runat="server" ID="PasswordPanel" style="padding-left:0; border: 1px solid #134A8E" CssClass="panel panel-default col-md-7">

                                        <div class="form-horizontal" style="margin-top:10px; padding-bottom: 20px;">
                                             <div class=" form-group" style="margin-bottom:0">
                                                <asp:label runat="server" CssClass="col-md-4 control-label" text="Current Password:"></asp:label>
                                                 <div class="col-md-8 ">
                                                        <asp:textbox CssClass="form-control" ID="currentPass" runat="server"></asp:textbox>
                                                        <asp:requiredfieldvalidator runat="server" errormessage="Current password is required" ControlToValidate="currentPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                                 </div>
                                            </div>

                                        <div class="form-group" style="margin-bottom:0">
                                                <asp:label runat="server" CssClass="col-md-4 control-label" text="New Password:"></asp:label>
                                                <div class="col-md-8 ">
                                                    <asp:textbox CssClass="form-control" ID="newPass" runat="server"></asp:textbox>
                                                    <asp:requiredfieldvalidator runat="server" errormessage="New password is required" ControlToValidate="newPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                                    <asp:RegularExpressionValidator ID="PasswordRegularExpressionValidator" CssClass="text-danger"  runat="server" Display="Dynamic" ValidationExpression="^[a-zA-Z]\w{3,14}$" ControlToValidate="newPass" ErrorMessage="Invalid password format"></asp:RegularExpressionValidator>
                                                </div>
                                        </div>

                                        <div class="form-group" style="margin-bottom:0">
                                                <asp:label runat="server"  CssClass=" col-md-4 control-label" text="Confirm Password:"></asp:label>
                                                 <div class="col-md-8">
                                                        <asp:textbox CssClass="form-control" ID="confirmPass" runat="server"></asp:textbox>
                                                         <asp:requiredfieldvalidator runat="server" errormessage="Current password is required" ControlToValidate="confirmPass" CssClass="text-danger"></asp:requiredfieldvalidator>
                                                        <asp:Comparevalidator runat="server" ControlToCompare="newPass" ControlToValidate="confirmPass"  Display="Dynamic"  CssClass="text-danger" errormessage="Confirmed password is invalid"></asp:Comparevalidator>
                                                </div>
                                        </div>

                                         <div class="form-group" style="margin-bottom:0px">   
                                             <div class="col-md-4"></div>     
                                             <div class="col-md-8">
                                                 <asp:Button runat="server" style="background-color:#134A8E; color:#fff; border:1px solid #134A8E" CssClass="btn btn-info" ID="BtnChangePassword" text="Submit" OnClick="BtnChangePassword_Click"  />
                                             </div>                                                 
                                        </div>  
                                    </div>
                             </asp:panel>
                            </div>

                            </div>

                            <div class="row">
                                <asp:label ID="LblConfirm" CssClass="col-md-12" runat="server"></asp:label>
                            </div>
        </div>
 
</asp:Content>
