<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="PlayerDetails.aspx.cs" Inherits="Blue_Jays_Manager.PlayerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="coverPhoto" class="jumbotron" style="background-color: forestgreen; margin-bottom: 0; padding-bottom: 0;">
        <div class="row">
            <h1 class="text-center">COVER PHOTO GOES HERE</h1>
            <div id="profileSummary" class="row">
                <h2 class="col-md-2">Profile Photo</h2>
                <div class="col-md-10">
                    <h2>
                        <asp:Label ID="name" runat="server" Text="Name"></asp:Label>
                        | #
                    <asp:Label ID="playerNumber" runat="server" Text="Number"></asp:Label>
                    </h2>
                </div>
                <span class="col-md-offset-2 col-md-10">
                    <asp:Label ID="position" runat="server" Text="position"></asp:Label>
                    | B/T:
                <asp:Label ID="skillOrientation" runat="server" Text="skillOrientation"></asp:Label>
                    |
                <asp:Label ID="height" runat="server" Text="height"></asp:Label>/<asp:Label ID="weight" runat="server" Text="weight"></asp:Label>
                    | Age:
                <asp:Label ID="age" runat="server" Text="Number"></asp:Label>
                </span>
            </div>
        </div>
        <div class="row">
            <div id="summaryDiv" class="panel panel-default">
                <div class="panel-heading text-center">
                    SUMMARY | STATS
                </div>
                <div class="panel-body">
                    <div id="bio" class="col-md-4">
                        <span style="font-weight: bold">
                            <asp:Label Text="text" runat="server" ID="bioName" />
                        </span>
                        <br />
                        <span style="font-weight: bold">Born: </span>
                        <asp:Label Text="text" runat="server" ID="bioBorn" />
                        <br />
                        <span style="font-weight: bold">Draft: </span>
                        <asp:Label Text="text" runat="server" ID="bioDraft" />
                        <br />
                        <span style="font-weight: bold">
                            <asp:Label Text="text" runat="server" ID="bioSchoolType" />:
                        </span>
                        <asp:Label Text="text" runat="server" ID="bioSchool" />
                        <br />
                        <span style="font-weight: bold">Debut </span>
                        <asp:Label Text="text" runat="server" ID="bioDebut" />:
                    </div>
                    <div id="summaryTable" class="col-md-8">
                        HAHAHAHA I AM A  BIG FAT TABLE
                    </div>
                </div>
            </div>
        </div>

        <div id="statsDiv">
        </div>
    </div>

</asp:Content>
