<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JaysReset.aspx.cs" Inherits="Blue_Jays_Manager.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue Jays Reset</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body ">
    <form id="form1" runat="server">
        <div class="container" style="min-height:700px;">
             <div class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <a class="navbar-brand" runat="server" href="~/">Toronto Blue Jays</a>
                        </div>
                    </div>
                </div>
            
                <h1  style="margin-top:70px" class="page-header"> <asp:Label ID="LblPageHeader" runat="server"></asp:Label></h1>
            <asp:Label ID="ConfirmLbl" style="margin-top:60px;" runat="server" ></asp:Label>

           <div class="form-group row">
            <asp:Label runat="server" style="margin-right:0" ID="LblReset" AssociatedControlID="reset" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-4" style="margin-left:0">
                <asp:TextBox runat="server" ID="reset" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="reset"
                    CssClass="text-danger" ErrorMessage="The User Name is required." />
            </div>
               <div class="col-md-6"></div>       
        </div>
                     <hr  style="margin-bottom:0"/>
        <div class="form-group" style="margin-right: 5px;">
            <div class="col-md-2"></div>
            <div class="col-md-4">
                <asp:Button runat="server" CssClass="btn btn-default" style="width: 125px; margin-bottom:10px;" ID="BtnReset" BackColor="#134A8E" BorderColor="#134A8E" ForeColor="White" OnClick="BtnReset_Click" />
            </div>
            <div class="col-md-6"></div>   
        </div>
            
            
      </div>
    </form>
    <div class="container">
        <hr style="background-color:#232323; border: 1px solid #232323; border-radius:5px " />
                    <footer>
                        <p>&copy; <%: DateTime.Now.Year %> - Toronto Blue Jays Manager <span class="pull-right">Developers: Vinood Persad | Kevin Ma</span></p>

                    </footer>
    </div>
     
</body>
</html>
