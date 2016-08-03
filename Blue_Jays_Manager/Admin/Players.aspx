<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Players.aspx.cs" Inherits="Blue_Jays_Manager.Admin.Players" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container" style="background-color:#fff">
        <div class="page-header" style="margin-top:60px">
         <h1>Player Roster</h1>
        </div>
    <asp:GridView ID="PlayerRosterGridView1" runat="server" OnRowEditing="PlayerRosterGridView1_RowEditing" OnRowDeleting ="PlayerRosterGridView1_RowDeleting" CssClass="table table-striped table-responsive" AutoGenerateColumns="False" OnRowCancelingEdit="PlayerRosterGridView1_RowCancelingEdit" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" ShowFooter="True" OnRowUpdated="PlayerRosterGridView1_RowUpdated" OnRowUpdating="PlayerRosterGridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="PlayerNum" HeaderText="Player #" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Position" HeaderText="Position" />
            <asp:BoundField DataField="Height" HeaderText="Height" />
            <asp:BoundField DataField="Weight" HeaderText="Weight" />
            <asp:BoundField DataField="DateOfBirth" HeaderText="D.O.B" ReadOnly="True" />
        </Columns>
        <EditRowStyle BorderStyle="Inset" HorizontalAlign="Center" VerticalAlign="Middle" />
        <FooterStyle BackColor="#243B69" BorderColor="#243B69" />
        <HeaderStyle BackColor="#243B69" BorderColor="#243B69" BorderStyle="None" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:GridView>
<br />
        </div>

    </asp:Content>
