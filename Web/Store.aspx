<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="Web.Store" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="CSS/CustomerOrder.css" rel="stylesheet" type="text/css" />

    <div class="jumbotron jumbotron-fluid">
        <h1>Order Sub-System</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="AddStockProduct.aspx" class="btn btn-primary btn-lg">Add New Product</a>
            </div>
        </div>
    </div>

    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" aria-expanded="true">Stock Product List</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Inventory By Location</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Inventory By Product</a>
        </li>
    </ul>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
            <h2>Stock Product List</h2>

            <div id="prod_list" runat="server"></div>
        </div>
        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <h2>Inventory Stock Levels by Location</h2>

            <asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged">
                <asp:ListItem Value="W00001" Selected="True">Penang, Malaysia</asp:ListItem>
                <asp:ListItem Value="W00002">Johor, Malaysia</asp:ListItem>
                <asp:ListItem Value="W00003">Yiwu, China</asp:ListItem>
                <asp:ListItem Value="W00004">Guang Zhou, China</asp:ListItem>
            </asp:DropDownList>

            <div id="location" runat="server"></div>
        </div>
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <h2>Inventory Stock Levels by Product Categories</h2>

            <asp:DropDownList ID="ddlProduct" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
                <asp:ListItem Value="Music & Entertainment" Selected="True">Music & Entertainment</asp:ListItem>
                <asp:ListItem Value="Shoes & Socks">Shoes & Socks</asp:ListItem>
                <asp:ListItem Value="Clothes & Fabrics">Clothes & Fabrics</asp:ListItem>
            </asp:DropDownList>

            <div id="product" runat="server"></div>
        </div>
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

</asp:Content>
