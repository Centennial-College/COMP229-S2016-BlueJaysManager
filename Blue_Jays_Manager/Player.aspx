<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Player.aspx.cs" Inherits="Blue_Jays_Manager.Player" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container list">
        <div class="page-header" >
         <h1>Player Roster</h1>
        </div>
    <asp:GridView ID="PlayerRosterGridView" runat="server" CssClass="table table-striped table-responsive" AutoGenerateColumns="False" GridLines="Horizontal" HorizontalAlign="Center" Width="975px" BorderColor="#243B69" BorderStyle="None" EmptyDataText="Null" EnableTheming="True" ShowFooter="True">
        <Columns>
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
