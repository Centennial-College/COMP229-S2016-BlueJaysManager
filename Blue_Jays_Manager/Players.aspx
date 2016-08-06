<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Players.aspx.cs" Inherits="Blue_Jays_Manager.Player" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container list">
        <div class="page-header">
            <h1>Player Roster</h1>
        </div>
        <h3>Search for Player(s) from the Toronto Blue Jays Database</h3>
        <hr />
        <div class="row">
            <b>
                <asp:label id="Label1" cssclass="col-md-1" style="padding-right: 0px; margin-right: 0px" runat="server" text="Search By:"></asp:label>
            </b>
            <div class="col-md-1" style="padding-right: 0px; padding-left: 0px; margin-right: 20px">
                <asp:dropdownlist id="searchCategory" runat="server" cssclass="form-control" width="150px">
                <asp:ListItem Text="Player Number" />
                <asp:ListItem Text="Name" />
                <asp:ListItem Text="Position" />
            </asp:dropdownlist>
            </div>
            <div class="col-md-1" style="padding-right: 0px; padding-left: 0px; margin-left: 35px">
                <asp:textbox id="searchTextBox" runat="server" cssclass="form-control" width="150px" />
            </div>

            <div class="col-md-2" style="padding-right: 0px; padding-left: 15px; margin-left: 35px">
                <asp:button id="submitButton" runat="server"
                    text="Get Data" onclick="submitButton_Click" style="margin-left: 10px" cssclass="btn btn-default" bordercolor="#134A8E" forecolor="White" width="125px" backcolor="#134A8E" />

            </div>
            <div class="col-md-2"></div>
            <div class="col-md-5">
                <asp:button id="AddPlayer" cssclass="pull-right btn btn-default" visible=" false" runat="server" text="Add Player" bordercolor="#134A8E" forecolor="#134A8E" />
                <asp:button id="SavePlayerChanges" runat="server" style="margin-right: 10px" visible="false" cssclass="pull-right btn btn-default" text="Save Changes" backcolor="#134A8E" bordercolor="#134A8E" forecolor="White" onclick="SavePlayerChanges_Click" />
            </div>

        </div>
        <br />

        <asp:label id="NoRecords" runat="server" text="Label" visible="false" forecolor="Red"></asp:label>
        <br />
        <asp:gridview id="PlayerRosterGridView" runat="server" cssclass="table table-striped table-responsive" autogeneratecolumns="False" gridlines="Horizontal" horizontalalign="Center" width="975px" bordercolor="#243B69" borderstyle="None" emptydatatext="Null" enabletheming="True" showfooter="True" onselectedindexchanged="PlayerRosterGridView_SelectedIndexChanged" onrowcancelingedit="PlayerRosterGridView_RowCancelingEdit" onrowdeleting="PlayerRosterGridView_RowDeleting" onrowediting="PlayerRosterGridView_RowEditing" onrowupdating="PlayerRosterGridView_RowUpdating">
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
        </asp:gridview>
    </div>
</asp:Content>
