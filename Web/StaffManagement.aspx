<%@ Page Title="Staff Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="Web.StaffManagement" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <h1>Staff Management</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="AddOrder.aspx" class="btn btn-primary btn-lg">Add New Staff</a>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnBadAtt" runat="server" Text="View Bad Attitude Staff" CssClass="btn btn-primary btn-lg" OnClick="btnBadAtt_Click" />
            </div>
        </div>
    </div>

    <h2>Customer Order List</h2>
    <div class="form-inline my-2 my-lg-0">
        <asp:Button class="btn btn-outline-success my-2 my-sm-0" style="float: right;" OnClick="searchStaff" Text="Search" runat="server" /> 
        <asp:TextBox ID="searchbox" runat="server" CssClass="form-control mr-sm-2" style="float: right; margin-right: 20px;" AutoPostBack="true"></asp:TextBox>
    </div>

    <style>
        .clickable-row:hover {
            cursor: pointer;
            background-color: antiquewhite;
        }
    </style>

    <script>
        jQuery(document).ready(function ($) {
            $(".clickable-row").click(function () {
                window.location = $(this).data("href");
            });
        });
    </script>

    <div id="stafflist" runat="server">
    </div>
</asp:Content>
