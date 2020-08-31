<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Ordering and Inventory System</h1>
        <p class="lead">This system contains Order Sub-system, Store sub-system and Staff management.</p>
        <p><a href="CustomerOrder.aspx" class="btn btn-primary btn-lg">Go to Customer Order &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-5">
            <h2>Order Sub-system</h2>
            <p>
                Input Order, Modify Order, Cancel Order, Generate Order in PDF, retrieve cancelled order and produce sales report.
            </p>
            <p>
                <a class="btn btn-default" href="CustomerOrder.aspx">Go to Customer Order &raquo;</a>
            </p>
        </div>
        <div class="col-md-5">
            <h2>Store Sub-system</h2>
            <p>
               Add new product, update product info, calculate latest stock quantity, integrate with order sub-system, show stock level, adjust stock quantity.
            </p>
            <p>
                <a class="btn btn-default" href="Store.aspx">Go to Store Sub-system &raquo;</a>
            </p>
        </div>
        <div class="col-md-2">
            <h2>Staff Management</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="#">Go to Staff Management &raquo;</a>
            </p>
        </div>
    </div>

    <style>
        .tables {
            border-collapse: collapse;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 20px;
        }

            .tables td, .tables th {
                border: 1px solid black;
                text-align: center;
                padding: 3px;
            }

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

    <asp:Label ID="lblCount" runat="server" Visible="false" Text="Label"></asp:Label>
    <asp:GridView ID="gvTesting" runat="server" Visible="false" CssClass="tables"></asp:GridView>
    <br />
    <asp:GridView ID="gvShipment" Visible="false" runat="server"></asp:GridView>
    <div id="wow" runat="server"></div>

</asp:Content>
