<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="PlayerDetails.aspx.cs" Inherits="Blue_Jays_Manager.PlayerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-top: 100px;">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    </div>

    <asp:Label ID="playerLabel" runat="server" />

    <div id="coverPhoto">
        <h1 class="text-center">COVER PHOTO GOES HERE</h1>
        <div id="briefDetails">
            <h2 style="float: left">Profile Photo</h2>
            <h3 style="padding-left: 20%">Name | #
                <br />
                Position | B/T: R/R | 183 cm | Age: 23
            </h3>
        </div>
    </div>

    <div id="summaryDiv"></div>



</asp:Content>
