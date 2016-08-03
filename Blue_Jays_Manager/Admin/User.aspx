<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Blue_Jays_Manager.Admin.User" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:70px; background-color:#fff; padding-left:0px; padding-right:0px">
        <div class="jumbotron">
            <h1>User Account Settings</h1>
        </div>

        <div>
            <p class="page-header">Change Account Settings</p>

            <div class="row">
                <div class="col-md-1">
                    <asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
               </div>
                <div class="col-md-11">
                    <input id="btnreset" onclick="btnReset" type="button" value="button" />
                </div>
           </div>
        </div>
    </div>


</asp:Content>
