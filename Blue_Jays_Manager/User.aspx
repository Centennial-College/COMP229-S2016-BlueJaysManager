<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Blue_Jays_Manager.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="container" style="margin-top:70px; background-color:#fff; padding-left:0px; padding-right:0px">
		<div class="jumbotron">
			<h1>User Account Details</h1>
		</div>

		<div>
			<h1><asp:label runat="server" ID="LblName" CssClass="page-header"></asp:label></h1>

			<div class="row">
				<div class="col-md-1">
					<asp:Label ID="LblPassword" runat="server" Text="Password:"></asp:Label>
			   </div>
				<div class="col-md-11">
					<asp:LinkButton ID="resetPassword" runat="server" OnClientClick="resetPassword()">[Change]</asp:LinkButton>
				</div>
		   </div>

			<div class="row">
				<div class="col-md-1">
					<asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
			   </div>
				<div class="col-md-11">
					<asp:Label ID="LblEmail" runat="server"></asp:Label>
				</div>
		   </div>

			<div class="row">
				<div class="col-md-1">
					<asp:Label ID="Label3" runat="server" Text="Role:"></asp:Label>
			   </div>
				<div class="col-md-11">
					<asp:Label ID="LblRole" runat="server"></asp:Label>
				</div>
		   </div>






		</div>
	</div>

</asp:Content>
