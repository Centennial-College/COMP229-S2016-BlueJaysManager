<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Player.aspx.cs" Inherits="Blue_Jays_Manager.Player" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container list">
        <div class="page-header">
            <h1>Player Roster</h1>
        </div>
        <h3>Search for Player(s) from the Toronto Blue Jays Database</h3>
        <hr />
        Search by:
    <asp:DropDownList ID="searchCategory" runat="server">
        <asp:ListItem Text="Player Number" />
        <asp:ListItem Text="Name" />
        <asp:ListItem Text="Position" />
    </asp:DropDownList>
        <asp:TextBox ID="searchTextBox" runat="server" />
        <asp:Button ID="submitButton" runat="server"
            Text="Get Data" OnClick="submitButton_Click" /><br />
        <br />
        <asp:GridView ID="PlayerRosterGridView" runat="server" CssClass="table table-striped table-responsive" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" Width="975px" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True" OnSelectedIndexChanged="PlayerRosterGridView_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="View Details" ShowSelectButton="True" />
                <asp:BoundField DataField="PlayerNum" HeaderText="Player #" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Position" HeaderText="Position" />
                <asp:BoundField DataField="Height" HeaderText="Height" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="D.O.B" />
            </Columns>
            <FooterStyle BackColor="#243B69" BorderStyle="None" />
            <HeaderStyle BackColor="#243B69" ForeColor="White" />
        </asp:GridView>
        <br />
    </div>
</asp:Content>
