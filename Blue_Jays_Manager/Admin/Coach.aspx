<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Coach.aspx.cs" Inherits="Blue_Jays_Manager.Admin.Coach" %>
<%@ Import Namespace="Blue_Jays_Manager.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" style="margin-top:60px; background-color:#fff">
        <div class="page-header">
            <h1>Coach Roster</h1>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <asp:GridView ID="CoachRosterGridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table responsive" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True" Width="900px" OnRowCommand="EnableUser">
            <Columns>
                <asp:CommandField HeaderText="Action" ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CoachNumber" HeaderText="Coach #" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Position" HeaderText="Position" />
                
                <asp:BoundField HeaderText="Account" />
                
                <asp:TemplateField HeaderText="Enable">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Enable User" style="width:105px" CommandArgument='<%#Eval("Name") %>' CssClass="btn btn-primary" 
                            Enabled="true" />
                    </ItemTemplate>
                    <ControlStyle BackColor="#243B69" BorderColor="#243B69" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" />
                </asp:TemplateField>
                    
            </Columns>
            <FooterStyle BackColor="#243B69" BorderStyle="None" />
            <HeaderStyle BackColor="#243B69" CssClass="text-center" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
         </asp:GridView>
    </div>
</asp:Content>
