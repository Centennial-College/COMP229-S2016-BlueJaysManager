<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Players.aspx.cs" Inherits="Blue_Jays_Manager.Player" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container list">
        <div class="page-header">
            <h1>Player Roster</h1>
        </div>
        <h3>Search for Player(s) from the Toronto Blue Jays Database</h3>
        <hr />
        <div class="row">
                <b><asp:Label ID="Label1" CssClass ="col-md-1" style="padding-right:0px; margin-right:0px" runat="server" Text="Search By:"></asp:Label></b>
            <div class="col-md-1" style="padding-right:0px;padding-left:0px; margin-right:20px">
            <asp:DropDownList ID="searchCategory" runat="server" CssClass="form-control" Width="150px">
                <asp:ListItem Text="Player Number" />
                <asp:ListItem Text="Name" />
                <asp:ListItem Text="Position" />
            </asp:DropDownList>
            </div>
            <div class="col-md-1" style="padding-right:0px; padding-left:0px; margin-left: 35px">
                <asp:TextBox ID="searchTextBox" runat="server" CssClass="form-control" Width="150px" />
            </div>

            <div class="col-md-2" style="padding-right:0px;padding-left:15px; margin-left: 35px">
                <asp:Button ID="submitButton" runat="server"
                    Text="Get Data" OnClick="submitButton_Click" style="margin-left:10px" CssClass="btn btn-default" BorderColor="#134A8E" ForeColor="White" Width="125px" BackColor="#134A8E" />
            
            </div>
            <div class="col-md-2"></div>
            <div class="col-md-5">
                <asp:Button ID="AddPlayer" CssClass="pull-right btn btn-default" Visible =" false" runat="server" Text="Add Player" BorderColor="#134A8E" ForeColor="#134A8E" />
                 <asp:Button ID="SavePlayerChanges" runat="server" style="margin-right:10px" Visible="false" CssClass="pull-right btn btn-default" Text="Save Changes" BackColor="#134A8E" BorderColor="#134A8E" ForeColor="White" OnClick="SavePlayerChanges_Click" />
            </div>
            
       </div>
        <br />
        
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
        <asp:HiddenField ID="ViewStateField"  runat="server" />
    </div>
</asp:Content>
