<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Players.aspx.cs" Inherits="Blue_Jays_Manager.Player" %>

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
        <asp:Label ID="NoRecords" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="PlayerRosterGridView" runat="server" CssClass="table table-striped table-responsive" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" Width="975px" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True" OnSelectedIndexChanged="PlayerRosterGridView_SelectedIndexChanged" OnRowCancelingEdit="PlayerRosterGridView_RowCancelingEdit" OnRowDeleting="PlayerRosterGridView_RowDeleting" OnRowEditing="PlayerRosterGridView_RowEditing" OnRowUpdating="PlayerRosterGridView_RowUpdating">
            <Columns>
                <asp:ImageField DataImageUrlField="PlayerNum" DataImageUrlFormatString="~\Images\Players\{0}.jpg" HeaderText="Photo" ReadOnly="True">
                    <ControlStyle CssClass="img-responzsive" Height="50px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="PlayerNum" HeaderText="Player #" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Position" HeaderText="Position" />
                <asp:BoundField DataField="Height" HeaderText="Height" />
                <asp:BoundField DataField="Weight" HeaderText="Weight" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" ReadOnly="True" />
                <asp:CommandField SelectText="View Details" ShowSelectButton="True" HeaderText="Details" />
            </Columns>
            <FooterStyle BackColor="#243B69" BorderStyle="None" />
            <HeaderStyle BackColor="#243B69" ForeColor="White" />
        </asp:GridView>
        <br />
    </div>
</asp:Content>
