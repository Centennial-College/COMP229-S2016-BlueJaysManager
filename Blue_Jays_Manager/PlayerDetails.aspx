<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="PlayerDetails.aspx.cs" Inherits="Blue_Jays_Manager.PlayerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="coverPhoto" class="jumbotron" style="background-color: forestgreen; margin-bottom: 0; padding-bottom: 0; padding-left: 3vw; padding-right: 3vw">
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
        <br />
        <div class="row" style="width: 94vw;">
            <div id="summaryDiv" class="panel panel-default">
                <div class="panel-heading text-center">
                    <h4>Summary | Stats
                    </h4>
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
                        <span style="font-weight: bold">
                            <asp:Label Text="text" runat="server" ID="bioDraftHead" />
                        </span>
                        <asp:Label Text="text" runat="server" ID="bioDraft" />
                        <br />
                        <span style="font-weight: bold">
                            <asp:Label Text="text" runat="server" ID="bioSchoolType" />
                        </span>
                        <asp:Label Text="text" runat="server" ID="bioSchool" />
                        <br />
                        <span style="font-weight: bold">Debut </span>
                        <asp:Label Text="text" runat="server" ID="bioDebut" />
                    </div>
                    <div id="summaryTable" class="col-md-8">
                        <asp:GridView ID="PlayerRosterGridView" runat="server" CssClass="table table-condensed" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True">

                            <Columns>
                                <asp:BoundField DataField="SummaryYear" HeaderText="Year" />
                                <asp:BoundField DataField="Wins" HeaderText="W" />
                                <asp:BoundField DataField="Losses" HeaderText="L" />
                                <asp:BoundField DataField="EarnedRunsAverage" HeaderText="ERA" />
                                <asp:BoundField DataField="Games" HeaderText="G" />
                                <asp:BoundField DataField="GamesStarted" HeaderText="GS" />
                                <asp:BoundField DataField="Saves" HeaderText="SV" />
                                <asp:BoundField DataField="InningsPitched" HeaderText="IP" />
                                <asp:BoundField DataField="StrikeOuts" HeaderText="SO" />
                                <asp:BoundField DataField="WalkAndHitsPerInningsPitched" HeaderText="WHIP" />
                            </Columns>

                            <FooterStyle BackColor="#243B69" BorderStyle="None" />
                            <HeaderStyle BackColor="#243B69" ForeColor="White" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>

        <%--STATS--%>
        <div class="row" style="width: 94vw;">
            <div id="statsDiv" class="panel panel-default">
                <div class="row">
                    <div class="col-md-5">
                        <hr />
                    </div>
                    <div class="col-md-2 text-center">
                        <h4>Stats</h4>
                    </div>
                    <div class="col-md-5">
                        <hr />
                    </div>
                </div>

                <div class="row">
                    <ul class="nav nav-tabs col-md-offset-1 col-md-7">
                    <%--<ul class="nav nav-tabs col-md-offset-4 col-md-4">--%>
                        <li class="active"><a data-toggle="tab" href="#pitching">PITCHING</a></li>
                        <li class=""><a data-toggle="tab" href="#batting">BATTING</a></li>
                        <li class=""><a data-toggle="tab" href="#fielding">FIELDING</a></li>
                    </ul>
                    <span class="col-md-4">
                        <asp:Label Text="Filter by year: " runat="server" />
                        <asp:TextBox ID="statsFilterTextBox" runat="server" />
                        <asp:Button ID="filterStatsButton" Text="Filter Stats" runat="server" OnClick="filterStatsButton_Click" cssclass="btn btn-default" bordercolor="#134A8E" forecolor="White" backcolor="#134A8E" />
                    </span>
                </div>

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="tab-content" style="padding-left: 5vw; padding-right: 5vw; min-height: 30vh">
                            <div id="pitching" class="tab-pane fade in active">
                                <h3>
                                    <asp:Label ID="pitchingName" runat="server" Text="Name"></asp:Label>
                                    Pitching Stats
                                </h3>
                                <asp:Label ID="nullPitchStatsLabel" runat="server" Text="This player does not currently have any pitching stats." ForeColor="red" />



                                <asp:GridView ID="PitchingStatsGridView" runat="server" CssClass="table table-condensed" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True">

                                    <Columns>
                                        <asp:BoundField DataField="PitchStatYear" HeaderText="Year" />
                                        <asp:BoundField DataField="Team" HeaderText="Team" />
                                        <asp:BoundField DataField="League" HeaderText="LG" />
                                        <asp:BoundField DataField="Wins" HeaderText="W" />
                                        <asp:BoundField DataField="Losses" HeaderText="L" />
                                        <asp:BoundField DataField="EarnedRunsAverage" HeaderText="ERA" />
                                        <asp:BoundField DataField="Games" HeaderText="G" />
                                        <asp:BoundField DataField="GamesStarted" HeaderText="GS" />
                                        <asp:BoundField DataField="CompleteGames" HeaderText="CG" />
                                        <asp:BoundField DataField="ShutOuts" HeaderText="SHO" />
                                        <asp:BoundField DataField="Saves" HeaderText="SV" />
                                        <asp:BoundField DataField="SaveOpportunities" HeaderText="SVO" />
                                        <asp:BoundField DataField="InningsPitched" HeaderText="IP" />
                                        <asp:BoundField DataField="Hits" HeaderText="H" />
                                        <asp:BoundField DataField="Runs" HeaderText="R" />
                                        <asp:BoundField DataField="EarnedRuns" HeaderText="ER" />
                                        <asp:BoundField DataField="HomeRuns" HeaderText="HR" />
                                        <asp:BoundField DataField="HitBatsmen" HeaderText="HB" />
                                        <asp:BoundField DataField="BasesOnBalls" HeaderText="BB" />
                                        <asp:BoundField DataField="IntentionalBasesOnBalls" HeaderText="IBB" />
                                        <asp:BoundField DataField="StrikeOuts" HeaderText="SO" />
                                        <asp:BoundField DataField="BattingAverage" HeaderText="AVG" />
                                        <asp:BoundField DataField="WalksAndHitsPerInningsPitched" HeaderText="WHIP" />
                                        <asp:BoundField DataField="GroundOrAirOuts" HeaderText="GO/AO" />
                                    </Columns>

                                    <FooterStyle BackColor="#243B69" BorderStyle="None" />
                                    <HeaderStyle BackColor="#243B69" ForeColor="White" />
                                </asp:GridView>



                            </div>
                            <div id="batting" class="tab-pane fade">
                                <h3>
                                    <asp:Label ID="battingName" runat="server" Text="Name"></asp:Label>
                                    Batting Stats
                                </h3>
                                <asp:Label ID="nullBatStatsLabel" runat="server" Text="This player does not currently have any batting stats." ForeColor="red" />
                                <asp:GridView ID="BattingStatsGridView" runat="server" CssClass="table table-condensed" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True">

                                    <Columns>
                                        <asp:BoundField DataField="BatStatYear" HeaderText="Year" />
                                        <asp:BoundField DataField="Team" HeaderText="Team" />
                                        <asp:BoundField DataField="League" HeaderText="LG" />
                                        <asp:BoundField DataField="Games" HeaderText="G" />
                                        <asp:BoundField DataField="AtBats" HeaderText="AB" />
                                        <asp:BoundField DataField="Runs" HeaderText="R" />
                                        <asp:BoundField DataField="Hits" HeaderText="H" />
                                        <asp:BoundField DataField="TotalBases" HeaderText="TB" />
                                        <asp:BoundField DataField="Doubles" HeaderText="2B" />
                                        <asp:BoundField DataField="Triples" HeaderText="3B" />
                                        <asp:BoundField DataField="HomeRuns" HeaderText="HR" />
                                        <asp:BoundField DataField="RunsBattedIn" HeaderText="RBI" />
                                        <asp:BoundField DataField="BasesOnBalls" HeaderText="BB" />
                                        <asp:BoundField DataField="IntentionalBasesOnBalls" HeaderText="IBB" />
                                        <asp:BoundField DataField="Strikeouts" HeaderText="SO" />
                                        <asp:BoundField DataField="StolenBases" HeaderText="SB" />
                                        <asp:BoundField DataField="CaughtStealing" HeaderText="CS" />
                                        <asp:BoundField DataField="BattingAverage" HeaderText="AVG" />
                                        <asp:BoundField DataField="OnBasePercentage" HeaderText="OBP" />
                                        <asp:BoundField DataField="SluggingPercentage" HeaderText="SLG" />
                                        <asp:BoundField DataField="OnBasePlusSlugging" HeaderText="OPS" />
                                        <asp:BoundField DataField="GroundOrAirOuts" HeaderText="GO/AO" />
                                    </Columns>

                                    <FooterStyle BackColor="#243B69" BorderStyle="None" />
                                    <HeaderStyle BackColor="#243B69" ForeColor="White" />
                                </asp:GridView>
                            </div>
                            <div id="fielding" class="tab-pane fade">
                                <h3>
                                    <asp:Label ID="fieldingName" runat="server" Text="Name"></asp:Label>
                                    Fielding Stats
                                </h3>
                                <asp:Label ID="nullFieldStatsLabel" runat="server" Text="This player does not currently have any fielding stats." ForeColor="red" />
                                <asp:GridView ID="FieldingStatsGridView" runat="server" CssClass="table table-condensed" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True">

                                    <Columns>
                                        <asp:BoundField DataField="FieldStatYear" HeaderText="Year" />
                                        <asp:BoundField DataField="Team" HeaderText="Team" />
                                        <asp:BoundField DataField="League" HeaderText="LG" />
                                        <asp:BoundField DataField="Position" HeaderText="POS" />
                                        <asp:BoundField DataField="Games" HeaderText="G" />
                                        <asp:BoundField DataField="GamesStarted" HeaderText="GS" />
                                        <asp:BoundField DataField="InningsAtThisPosition" HeaderText="INN" />
                                        <asp:BoundField DataField="TotalChances" HeaderText="TC" />
                                        <asp:BoundField DataField="Putouts" HeaderText="PO" />
                                        <asp:BoundField DataField="Assists" HeaderText="A" />
                                        <asp:BoundField DataField="Errors" HeaderText="E" />
                                        <asp:BoundField DataField="DoublePlays" HeaderText="DP" />
                                        <asp:BoundField DataField="PassedBall" HeaderText="PB" />
                                        <asp:BoundField DataField="StolenBases" HeaderText="SB" />
                                        <asp:BoundField DataField="CaughtStealing" HeaderText="CS" />
                                        <asp:BoundField DataField="RangeFactor" HeaderText="RF" />
                                        <asp:BoundField DataField="FieldingPercentage" HeaderText="FPCT" />

                                    </Columns>

                                    <FooterStyle BackColor="#243B69" BorderStyle="None" />
                                    <HeaderStyle BackColor="#243B69" ForeColor="White" />
                                </asp:GridView>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="filterStatsButton" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>



    </div>

</asp:Content>
