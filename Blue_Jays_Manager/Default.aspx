<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Blue_Jays_Manager.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headerContentPlaceHolder" runat="server">
    <!--Header-->
    <header class="container-fluid" style="margin-top: 50px;">
        <div class="row">
            <asp:Image ID="coverPhoto" runat="server" ImageUrl="~/Images/banner.jpg" Width="100%" CssClass="img-responsive" />
        </div>
    </header>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <%--<div class="container" style="height: 500px;">--%>
        <div class="row">
            <div class="col-md-4">
                <h2>If you're a regular user:</h2>
                <p>
                    ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4">
                <h2>If you're a coach:</h2>
                <p>
                    NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4">
                <h2>If you're a manager:</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </div>
        </div>
    </div>
</asp:Content>
