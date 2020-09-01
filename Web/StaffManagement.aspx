<%@ Page Title="Staff Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffManagement.aspx.cs" Inherits="Web.StaffManagement" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron jumbotron-fluid">
        <h1>Staff Management</h1>
        <div class="row">
            <div class="col-md-3">
                <a href="AddStaff.aspx" class="btn btn-primary btn-lg">Add New Staff</a>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnBadAtt" runat="server" Text="View Bad Attitude Staff" CssClass="btn btn-primary btn-lg" OnClick="btnBadAtt_Click" />
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
