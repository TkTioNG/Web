<%@ Page Title="Customer Order" Language="C#" AutoEventWireup="true" CodeBehind="CustomerOrder.aspx.cs" Inherits="Web.CustomerOrder" %>

<html>
<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
    <link href="CSS/CustomerOrder.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=R5qUTB3ysvNMOJbbJkstod_HpfB_EziI966YJ75jPitR3BqXjx2hrlnP2E3_-jxYPB2gCY_yfkgd0-eRVs_m2_sThJXrxhfyMCEEOsr_VKs0MTKWUspZyfIsFpjRrAtAZWHiheWXf7uc2-MGYAfrNwwTCrQaTtkf1Ah0p7UiGO3WbPlVYM1IRStD47Cls7rVsNIfwvQgxB27JN4Q7Py5o-0biTMh1wsEu6f3pShAuSU9x6CsuVitSRiqqSZzgGqlonaedNPqzHpB_3Jhk3cWPeRG41QgMhCixzWeAgEWANqSTn_dMW2f2MfN56P41FhD-Is-uL_KR1XKo2X8FR0MZyT-qjKowXDZk24SuOrL31p2COeF4hLEw7XA5MjDrqHcnFa7I3tSb_vbeE3qfWqOCyb5Hl_J8hR8vGniEHxC6anl3hLx0iCgYSmk78Wh9BdXxHPXEr-NLbbV5Cw0q_4ttA" charset="UTF-8"></script>
    <link rel="stylesheet" crossorigin="anonymous" href="https://gc.kis.v2.scr.kaspersky-labs.com/E3E8934C-235A-4B0E-825A-35A08381A191/abn/main.css?attr=aHR0cHM6Ly9kb2MtMGMtNjgtZG9jcy5nb29nbGV1c2VyY29udGVudC5jb20vZG9jcy9zZWN1cmVzYy9rbDQ4NGhsbWxqOTgyNzY1amY0Y2hjY29xYmNqZGNyZi90Zms4NTJzNWs4bzNmZWkyOG9mdTNmNmkyZWFxNHJuai8xNTk4MTY1MjUwMDAwLzEyMzU4MDY2MjY0NzY5NDQ3Njc5LzEwMDA1MTk0NTkyNzE2MTkzMDQ1LzFzS3d5OGM0b2ppbExBV25XSEl5OFBnZnNTVkw3Rm1iUz9lPWRvd25sb2FkJmF1dGh1c2VyPTEmbm9uY2U9M2NjbmI1b21wdWd2YyZ1c2VyPTEwMDA1MTk0NTkyNzE2MTkzMDQ1Jmhhc2g9amFsNGcxOGJpMjA0a2ptZXJpcnJpcDA5aTRlZWpxZ28" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#table_id').DataTable();
        });
        </script>
</head>
<body>

    <h1>Customer Order Details</h1>
    <div id="body">
        <div class="topnav">
            <!-- Centered link -->
            <div class="topnav-centered">
                <a href="Invoice.aspx" target="_blank">Check Invoice</a>
                <a href="#shipping_info">Ship Order</a>
                <a data-toggle="modal" data-target="#completeOrderModal">Complete Order</a>
                <a data-toggle="modal" data-target="#deleteOrderModal">Delete Order</a>
            </div>

            <!-- Left-aligned links (default) -->
            <a href="#">Search: New</a>

            <!-- Right-aligned links -->
            <div class="topnav-right">
                <a href="Order.aspx">Close</a>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="completeOrderModal" tabindex="-1" role="dialog" aria-labelledby="completeOrderModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="completeOrderModalLabel">Complete Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you wish to complete the order by setting the order status as "Complete"?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="completeOrder()" data-toggle="modal" data-target="#updateStatusModal">Yes</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteOrderModal" tabindex="-1" role="dialog" aria-labelledby="deleteOrderModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteOrderModalLabel">Delete Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you wish to delete the order by setting the order status as "Cancel"?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteOrder()" data-toggle="modal" data-target="#updateStatusModal">Yes</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="updateStatusModal" tabindex="-1" role="dialog" aria-labelledby="updateStatusModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateStatusModalLabel">Update Status</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        The order status has been successfully updated.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal"">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="filter" class="filter">
            <form>
                <div class="form-part filter-left" id="filter-left">
                    <div class="form-group">
                        <label>Customer</label><br>
                        <input id="customer" type="text" class="form-control" runat="server" name="customer" readonly>
                    </div>
                    <div class="form-group">
                        <label>Contact No</label>
                        <input id="contact" type="text" class="form-control" runat="server" name="contact" readonly>
                    </div>
                    <div class="form-group">
                        <label>E-mail Address</label>
                        <input id="email" type="text" class="form-control" runat="server" name="email" readonly>
                    </div>
                    <div class="form-group">
                        <label>Order Status</label>
                        <input id="status" type="text" class="form-control editable" runat="server" name="email" readonly>
                    </div>
                </div>
                <div class="form-part filter-right" id="filter-right">
                    <div class="form-group">
                        <label>Salesperson</label><br>
                        <input id="salesperson" type="text" class="form-control" runat="server" name="salesperson" readonly>
                    </div>
                    <div class="form-group">
                        <label>Order Date</label>
                        <input id="date" type="datetime" class="form-control" runat="server" name="editable" readonly>
                    </div>
                    <div class="form-group">
                        <label>Order Time</label>
                        <input id="time" type="time" class="form-control" runat="server" name="editable" readonly>
                    </div>
                </div>
            </form>
        </div>

        <script type="text/javascript">
            function canEdit() {
                var editable = document.getElementsByClassName("editable");
                for (var i = 0; i < editable.length; i++) {
                    editable[i].readOnly = false;
                }
                document.getElementById("btnEdit").style.display = "none";
                document.getElementById("btnCancel").style.display = "inline";
                document.getElementById("btnSave").style.display = "inline";
            }
            function cannotEdit() {
                var editable = document.getElementsByClassName("editable");
                for (var i = 0; i < editable.length; i++) {
                    editable[i].readOnly = true;
                }
                document.getElementById("btnEdit").style.display = "inline";
                document.getElementById("btnCancel").style.display = "none";
                document.getElementById("btnSave").style.display = "none";
            }
            function completeOrder() {
                document.getElementById("status").value = "Complete";
            }
            function deleteOrder() {
                document.getElementById("status").value = "Cancel";
            }
            function goShow() {
                var showing = document.getElementsByClassName("btn-showing");
                for (var i = 0; i < showing.length; i++) {
                    showing[i].style.display = "none";
                }
                var hiding = document.getElementsByClassName("btn-hiding");
                for (var i = 0; i < showing.length; i++) {
                    hiding[i].style.display = "inline";
                }
                document.getElementById("orderTimestamp").style.display = "inline";
                document.getElementById("shipmentTimestamp").style.display = "inline";
            }
            function notShow() {
                var showing = document.getElementsByClassName("btn-showing");
                for (var i = 0; i < showing.length; i++) {
                    showing[i].style.display = "inline";
                }
                var hiding = document.getElementsByClassName("btn-hiding");
                for (var i = 0; i < showing.length; i++) {
                    hiding[i].style.display = "none";
                }
                document.getElementById("orderTimestamp").style.display = "none";
                document.getElementById("shipmentTimestamp").style.display = "none";
            }
        </script>

        <style>
            .clickable-data:hover {
                cursor: pointer;
                background-color: antiquewhite;
            }
        </style>

        <script>
            jQuery(document).ready(function ($) {
                $(".clickable-data").click(function () {
                    window.location = $(this).data("href");
                });
            });
        </script>

        <button type="button" id="btnEdit" class="btn btn-primary" onclick="canEdit()">
            Edit
        </button>
        <button type="button" id="btnCancel" class="btn btn-danger" style="display: none" onclick="cannotEdit()">
            Cancel
        </button>
        <button type="button" id="btnSave" class="btn btn-success" style="display: none" onclick="cannotEdit()">
            Save
        </button>

        <div id="details">
            <nav>
                <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#order_info" role="tab" aria-controls="order_info" aria-selected="true">Order Details</a>
                    <a class="nav-item nav-link" id="nav-shipping-tab" data-toggle="tab" href="#shipping_info" role="tab" aria-controls="shipping_info" aria-selected="false">Shipping Information</a>
                    <a class="nav-item nav-link" id="nav-payment-tab" data-toggle="tab" href="#payment_info" role="tab" aria-controls="payment_info" aria-selected="false">Payment Information</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="order_info" role="tabpanel" aria-labelledby="order-details-tab" runat="server">
                    <div class="topnav">
                        <!-- Centered link -->
                        <div class="topnav-centered">
                            <a href="#">Order Info</a>
                        </div>
                    </div>

                    <div id="order_details" runat="server"> </div>

                    <div style=" padding-left: 50px; padding-right: 50px;">                        
                        <button type="button" id="btnShowOrder" class="btn btn-info btn-showing" onclick="goShow()" style="float: right;">
                            Show Order Changes Log
                        </button>
                        <button type="button" id="btnCloseOrder" class="btn btn-info btn-hiding" onclick="notShow()" style="float: right; display: none;">
                            Hide
                        </button>
                        <div id="orderTimestamp" style="display: none;" class="btn-hiding">
                            <h5>Order Changes Log</h5>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Changes Timestamp</th>
                                        <th>Order Status</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020-09-01 13:15:48.352</td>
                                        <td>Cancel</td>
                                        <td>Update Status</td>
                                    </tr>
                                    <tr>
                                        <td>2020-08-30 18:26:01.452</td>
                                        <td>Pending</td>
                                        <td>Update Delivery Address</td>
                                    </tr>
                                    <tr>
                                        <td>2020-08-27 17:05:01.439</td>
                                        <td>Pending</td>
                                        <td>Created Order</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="shipping_info" role="tabpanel" aria-labelledby="shipping-info-tab" runat="server">
                    <div class="topnav">
                        <!-- Centered link -->
                        <div class="topnav-centered">
                            <a href="#">Delivery Order and Shipment Info</a>
                        </div>
                    </div>

                    <div class="filter">
                        <div class="form-part filter-left">
                            <div class="form-group">
                                <label>Customer</label><br>
                                <input id="sp_cust" type="text" class="form-control" runat="server" name="customer" readonly>
                            </div>
                            <div class="form-group">
                                <label>Contact No</label>
                                <input id="sp_contNo" type="text" class="form-control" runat="server" name="contact" readonly>
                            </div>
                            <div class="form-group">
                                <label>From</label>
                                <input id="sp_from" type="text" class="form-control editable" runat="server" name="email" readonly>
                            </div>
                            <div class="form-group">
                                <label>To</label>
                                <input id="sp_to" type="text" class="form-control editable" runat="server" name="email" readonly>
                            </div>
                        </div>
                        <div class="form-part filter-right">
                            <div class="form-group">
                                <label>Delivery Order No</label><br>
                                <input id="sp_DONo" type="text" class="form-control" runat="server" name="salesperson" readonly>
                            </div>
                            <div class="form-group">
                                <label>Delivery Date</label>
                                <input id="sp_date" type="datetime" class="form-control editable" runat="server" name="editable" readonly>
                            </div>
                            <div class="form-group">
                                <label>Delivery Time</label>
                                <input id="sp_time" type="time" class="form-control editable" runat="server" name="editable" readonly>
                            </div>
                            <div class="form-group">
                                <label>Shipment No</label>
                                <input id="sp_shipNo" type="text" class="form-control" runat="server" name="editable" readonly>
                            </div>
                        </div>
                    </div>

                    <div id="shipping_details" runat="server"></div>

                    <div style=" padding-left: 50px; padding-right: 50px;">                        
                        <button type="button" id="btnShowShipment" class="btn btn-info btn-showing" onclick="goShow()" style="float: right;">
                            Show Order Changes Log
                        </button>
                        <button type="button" id="btnCloseShipment" class="btn btn-info btn-hiding" onclick="notShow()" style="float: right; display: none;">
                            Hide
                        </button>
                        <div id="shipmentTimestamp" style="display: none;" class="btn-hiding">
                            <h5>Order Changes Log</h5>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Changes Timestamp</th>
                                        <th>Shipment Location</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2020-09-01 13:15:48.352</td>
                                        <td>Johor, Malaysia</td>
                                        <td>Dispatch to the Johor Warehouse</td>
                                    </tr>
                                    <tr>
                                        <td>2020-08-30 18:26:01.452</td>
                                        <td>South China Sea</td>
                                        <td>On the Ocean Heading to Malaysia Titanic Cruise Ship</td>
                                    </tr>
                                    <tr>
                                        <td>2020-08-27 17:05:01.439</td>
                                        <td>Yiwu, China</td>
                                        <td>Item Collection on Yiwu Warehouse</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="tab-pane fade" id="payment_info" role="tabpanel" aria-labelledby="payment-info-tab">
                    <div class="topnav">
                        <!-- Centered link -->
                        <div class="topnav-centered">
                            <a href="#">Customer Payment Details</a>
                        </div>
                    </div>

                    <div class="filter">
                        <div class="form-part filter-left">
                            <div class="form-group">
                                <label>Payment ID</label><br>
                                <input id="pm_payID" type="text" class="form-control" runat="server" name="customer" readonly>
                            </div>
                            <div class="form-group">
                                <label>Payment Type</label>
                                <input id="pm_type" type="text" class="form-control editable" runat="server" name="contact" readonly>
                            </div>
                            <div class="form-group">
                                <label>Payment Amount</label>
                                <input id="pm_amount" type="text" class="form-control" runat="server" name="email" readonly>
                            </div>
                        </div>
                        <div class="form-part filter-right">
                            <div class="form-group">
                                <label>Payment Status</label><br>
                                <input id="pm_stat" type="text" class="form-control" runat="server" name="salesperson" readonly>
                            </div>
                            <div class="form-group">
                                <label>Payment Date</label>
                                <input id="pm_date" type="datetime" class="form-control editable" runat="server" name="editable" readonly>
                            </div>
                            <div class="form-group">
                                <label>Payment Time</label>
                                <input id="pm_time" type="time" class="form-control editable" runat="server" name="editable" readonly>
                            </div>
                        </div>
                    </div>

                    <div id="payment_details" runat="server"></div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
