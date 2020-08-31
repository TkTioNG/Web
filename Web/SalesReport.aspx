<%@ Page Title="SalesReport" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="Web.SalesReport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <h1>Sales Report</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="#month" class="btn btn-primary btn-lg">By Month</a>
            </div>
            <div class="col-md-3">
                <a href="#salesperson" class="btn btn-primary btn-lg">By Salesperson</a>
            </div>
            <div class="col-md-3">
                <a href="#product" class="btn btn-primary btn-lg">By Product</a>
            </div>
        </div>
    </div>

    <link href="CSS/CustomerOrder.css" rel="stylesheet" type="text/css" />

    <h2>Sales Report</h2>

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

    <div id="month" runat="server" class="filter" style="padding-left: 50px; padding-right: 0px;">
        <h2>Sales Report by September</h2>
        <br />
        <div class="form-part filter-left" id="filter-left" style="padding-top: 15px; width: 33%;">
            <div class="form-group">
                <label>Month</label><br>
                <input id="months" type="text" class="form-control" runat="server" value="September 2020" name="customer">
            </div>
            <div class="form-group">
                <label>No. of Customer</label>
                <input id="custno" type="text" class="form-control" runat="server" name="contact">
            </div>
            <div class="form-group">
                <label>No. of Transaction</label>
                <input id="transno" type="text" class="form-control editable" runat="server" name="email">
            </div>
        </div>
        <div class="form-part filter-right" id="filter-right" style="padding-top: 15px; width: 33%; float: left; clear: none;">
            <div class="form-group">
                <label>No. of Orders</label><br>
                <input id="orderno" type="text" class="form-control" runat="server" name="salesperson">
            </div>
            <div class="form-group">
                <label>No. of Product Sold</label>
                <input id="soldno" type="text" class="form-control" runat="server" name="editable">
            </div>
            <div class="form-group">
                <label>No. of Completed Payment</label>
                <input id="paymentno" type="text" class="form-control" runat="server" name="editable">
            </div>
        </div>
        <div id="revenue" style="float: right; margin-right: 60px; text-align: right; font-size: x-large; width: 30%; top: -50px; position: relative;" runat="server"></div>
    </div>
    <hr />
    <hr />
    <div id="salesperson" runat="server" class="filter" style="padding-left: 50px; padding-right: 0px;">
        <h2>Sales Report by Salesperson</h2>
        <br />        
        <div id="bySalesperson" runat="server"></div>
        <h3 id="topsalesperson" runat="server"></h3>
        <h3 id="topsalespersontotal" runat="server"></h3>
    </div>
    <hr />
    <hr />
    <div id="product" runat="server" class="filter" style="padding-left: 50px; padding-right: 0px;">
        <h2>Sales Report by Product</h2>
        <br />
        <div id="byProduct" runat="server"></div>
        <h3 id="topproduct" runat="server"></h3>
        <h3 id="topproducttotal" runat="server"></h3>
    </div>
</asp:Content>
