<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Coaches.aspx.cs" Inherits="Blue_Jays_Manager.Coaches" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container list">
        <div class="page-header">
            <h1>Coach Roster</h1>
        </div>
        <asp:GridView ID="CoachRosterGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table responsive" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True" Width="700px">
            <Columns>
                <asp:BoundField DataField="CoachNumber" HeaderText="Coach #" ReadOnly="True" >
                <ControlStyle Width="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" >
                <ControlStyle Width="30px" />
                </asp:BoundField>
                <asp:BoundField DataField="Position" HeaderText="Position" >
                <ControlStyle Width="30px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#243B69" BorderStyle="None" />
            <HeaderStyle BackColor="#243B69" ForeColor="White" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
