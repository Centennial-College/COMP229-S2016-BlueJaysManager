<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Coaches.aspx.cs" Inherits="Blue_Jays_Manager.Coaches" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container list">
        <div class="page-header" style="margin-top:20px; margin-bottom:5px">
            <div class="row">
            <h1 style="margin-top:20px" class="pull-left">Manager and Coach Roster</h1> <asp:Image ID="Image1" CssClass="img-responsive pull-right" Height="100px" Width="300px" ImageUrl="~/Images/jayswordlogo.png" runat="server" />
            </div>
        </div>
        <h3>List of Toronto Blue Jays Coaches and Manager</h3>
        <hr />
        <div class="container">
            <div class="row">
                    <asp:Label ID="LblError" CssClass="col-md-8" runat="server"></asp:Label>
                <div class="col-md-3" style="padding-right:50px">                  
                    <asp:Button ID="AddCoach" CssClass="pull-right btn btn-default" runat="server" Text="Add Coach" BorderColor="#134A8E" ForeColor="#134A8E" Visible="False" OnClick="AddCoach_Click" />
                    <asp:Button ID="SaveCoachChanges" CssClass="pull-right btn btn-default" style="margin-right:10px"  runat="server" Text="Save Changes" BackColor="#134A8E" BorderColor="#134A8E" ForeColor="White" OnClick="SaveCoachChanges_Click" Visible="False" />
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
        <br />
        <asp:GridView ID="CoachRosterGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table responsive" BorderColor="#243B69" BorderStyle="None" GridLines="Horizontal" HorizontalAlign="Center" ShowFooter="True" Width="900px" OnRowUpdating="CoachRosterGridView_RowUpdating" OnRowDeleting="CoachRosterGridView_RowDeleting" OnRowCancelingEdit="CoachRosterGridView_RowCancelingEdit" OnRowEditing="CoachRosterGridView_RowEditing" OnRowCommand="EnableUser" AllowSorting="True" OnSorting="CoachRosterGridView_Sorting">
            <Columns>
                <asp:ImageField DataImageUrlField="CoachNumber" DataImageUrlFormatString="~\Images\Coaches\{0}.jpg" HeaderText="Photo" ReadOnly="True" NullDisplayText="N/A" NullImageUrl="Images/Photo-Unavailable.jpg">
                    <ControlStyle CssClass="img-responsive" Height="50px" Width="40px" />
                </asp:ImageField>
                <asp:BoundField DataField="CoachNumber" HeaderText="Coach #" ReadOnly="True" SortExpression="CoachNumber" />
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
