<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Web.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <h1>Order Sub-System</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="http://www.asp.net" class="btn btn-primary btn-lg">Create New Order</a>
            </div>
            <div class="col-md-3">
                <a href="http://www.asp.net" class="btn btn-primary btn-lg">Produce Sales Report</a>
            </div>
            <div class="col-md-3">
                <a href="http://www.asp.net" class="btn btn-primary btn-lg">Retrieve Cancel Order</a>
            </div>
        </div>
    </div>

    <h2>Customer Order List</h2>
    <div class="form-inline my-2 my-lg-0">
        <asp:Button class="btn btn-outline-success my-2 my-sm-0" style="float: right;" OnClick="searchOrder" Text="Search" runat="server" /> 
        <input id="searchbox" class="form-control mr-sm-2" type="search" style="float: right; margin-right: 20px;" placeholder="Search" aria-label="Search" runat="server">
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

    <div id="list" runat="server">
    </div>
</asp:Content>
