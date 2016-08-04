<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Coaches.aspx.cs" Inherits="Blue_Jays_Manager.Coaches" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container list">
        <div class="page-header">
            <h1>Coach Roster</h1>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <%--<asp:GridView ID="CoachRosterGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table responsive" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True" Width="700px">
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
        </asp:GridView>--%>

        <asp:GridView ID="CoachRosterGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table responsive" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True" Width="900px" OnRowUpdating="CoachRosterGridView_RowUpdating" OnRowDeleting="CoachRosterGridView_RowDeleting" OnRowCancelingEdit="CoachRosterGridView_RowCancelingEdit" OnRowEditing="CoachRosterGridView_RowEditing" OnRowCommand="EnableUser">
            <Columns>
                <asp:ImageField DataImageUrlField="CoachNumber" DataImageUrlFormatString="~\Images\Coaches\{0}.jpg" HeaderText="Photo" ReadOnly="True">
                    <ControlStyle CssClass="img-responsive" Height="50px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="CoachNumber" HeaderText="Coach #" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Position" HeaderText="Position" />
                
                <asp:BoundField HeaderText="Account" ReadOnly="True" DataField="IsLocked" />

                <asp:TemplateField HeaderText="Enable">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" Text="Enable User" Style="width: 105px; border: 1px solid #002A5E; color:#002A5E" CommandArgument='<%#Eval("Name") %>' CssClass="btn btn-default"
                            Enabled='<%#Eval("IsLocked").ToString() == "Locked" %>' />
                    </ItemTemplate>
                    <ControlStyle BorderColor="#243B69" BorderStyle="Solid" BorderWidth="1px" ForeColor="#243B69" CssClass="btn btn-default" />
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#243B69" BorderStyle="None" />
            <HeaderStyle BackColor="#243B69" CssClass="text-center" Font-Size="Small" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>
    </div>
</asp:Content>
