<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="PlayerDetails.aspx.cs" Inherits="Blue_Jays_Manager.PlayerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="coverPhoto" style="height: 30vh; margin-top: ">
        <h1 class="text-center jumbotron">COVER PHOTO GOES HERE</h1>
        <div id="profileSummary" class="panel panel-default">
            <h2 style="float: left">Profile Photo</h2>
            <div style="padding-left: 20%">
                <h2>
                    <asp:Label ID="name" runat="server" Text="Name"></asp:Label>
                    | #
                    <asp:Label ID="playerNumber" runat="server" Text="Number"></asp:Label>
                </h2>
            </div>
            <div style="padding-left: 20%">
                <h3>
                    <asp:Label ID="position" runat="server" Text="position"></asp:Label>
                    | B/T:
                <asp:Label ID="skillOrientation" runat="server" Text="skillOrientation"></asp:Label>
                    |
                <asp:Label ID="height" runat="server" Text="height"></asp:Label>/<asp:Label ID="weight" runat="server" Text="weight"></asp:Label>
                    | Age:
                <asp:Label ID="age" runat="server" Text="Number"></asp:Label>
                </h3>
            </div>
        </div>
        <div>
            NAVIGATION GOES HERE<br />
            SUMMARY | STATS
        </div>
    </div>

    <div id="summaryDiv">
        <div id="bio">
            <span style="font-weight: bold">
                <asp:Label Text="text" runat="server" ID="bioName" />
            </span>
            <span style="font-weight: bold">Born: </span>
            <asp:Label Text="text" runat="server" ID="bioBorn" />
            <span style="font-weight: bold">Draft: </span>
            <asp:Label Text="text" runat="server" ID="bioDraft" />
            <span style="font-weight: bold">
                <asp:Label Text="text" runat="server" ID="bioSchoolType" />
            </span>
            <asp:Label Text="text" runat="server" ID="bioSchool" />
            <span style="font-weight: bold">Debut </span>
            <asp:Label Text="text" runat="server" ID="bioDebut" />

        </div>
        <div id="summaryTable" style="padding-left: 20vw">
        </div>
    </div>

    <div id="statsDiv">
    </div>

</asp:Content>
