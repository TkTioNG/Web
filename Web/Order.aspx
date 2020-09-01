<%@ Page Title="Order" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Web.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <h1>Order Sub-System</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="AddOrder.aspx" class="btn btn-primary btn-lg">Create New Order</a>
            </div>
            <div class="col-md-3">
                <a href="SalesReport.aspx" class="btn btn-primary btn-lg">Produce Sales Report</a>
            </div>
            <div class="col-md-3">
                <asp:Button ID="Button1" runat="server" Text="Retrieve Cancel Order" CssClass="btn btn-primary btn-lg" OnClick="Button1_Click" />
            </div>
        </div>
    </div>

    <div class="modal fade" id="tutorialModal" tabindex="-1" role="dialog" aria-labelledby="tutorialModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="tutorialModalLabel">Tutorial</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>This is the tutorial.</p>
                    <p>This are the following that you can do for this:</p>
                    <ol>
                        <li>You can sleep.</li>
                        <li>You can eat.</li>
                        <li>You can wake.</li>
                        <li>You can walking.</li>
                        <li>You can traunt.</li>
                        <li>Most importantly, you can pass the assignment.</li>
                    </ol>
                    <p>Hope this tutorial will help. Thanks.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <button type="button" id="btnTutorial" class="btn btn-primary" style="border-radius: 50px; float: right;" data-toggle="modal" data-target="#tutorialModal">
        ?
    </button>

    <h2>Customer Order List</h2>
    <div class="form-inline my-2 my-lg-0">
        <asp:Button class="btn btn-outline-success my-2 my-sm-0" Style="float: right;" OnClick="searchOrder" Text="Search" runat="server" />
        <asp:TextBox ID="searchbox" runat="server" CssClass="form-control mr-sm-2" Style="float: right; margin-right: 20px;" AutoPostBack="true"></asp:TextBox>
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
