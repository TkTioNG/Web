<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStaff.aspx.cs" Inherits="Web.AddStaff" %>

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
    <form runat="server">
        <h1>New Staff Details</h1>
        <div id="body" style="margin-bottom: 50px;">
            <div class="topnav">
                <!-- Centered link -->
                <div class="topnav-centered">
                    <a>Add New Staff</a>
                </div>

                <!-- Left-aligned links (default) -->
                <a href="AddStaff.aspx">Add: New</a>

                <!-- Right-aligned links -->
                <div class="topnav-right">
                    <a href="StaffManagement.aspx">Close</a>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="goodOrderModal" tabindex="-1" role="dialog" aria-labelledby="goodOrderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="goodOrderModalLabel">Good Attitude</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to set the staff status to "Working" as good attritude?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="goodOrder()" data-toggle="modal" data-target="#updateStatusModal">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="completeOrderModal" tabindex="-1" role="dialog" aria-labelledby="completeOrderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="completeOrderModalLabel">Warn Staff</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to set the staff status to "Warn" as warning the staff?
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
                            <h5 class="modal-title" id="deleteOrderModalLabel">Cancel Add New Staff</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to not add this new staff?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='StaffManagement.aspx';">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="saveOrderModal" tabindex="-1" role="dialog" aria-labelledby="saveOrderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="saveOrderModalLabel">Save Changes</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to save the changes you made?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#updateStatusModal">Yes</button>
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
                            The staff has been successfully updated.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='StaffDetails.aspx?staffid=SS0020';">OK</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="filter" class="filter">
                <nav>
                    <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#order_info" role="tab" aria-controls="order_info" aria-selected="true"><strong>Staff Details</strong></a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="order_info" role="tabpanel" aria-labelledby="order-details-tab" runat="server">
                        <div id="staff_details" runat="server"></div>

                        <h5>Personnel</h5>
                        <div class="form-part filter-left" id="filter-left">
                            <div class="form-group">
                                <label>Staff ID</label><br>
                                <input id="txtstaffid" type="text" class="form-control" runat="server" name="customer" value="SS0021" readonly>
                            </div>
                            <div class="form-group">
                                <label>Staff Name</label><br>
                                <input id="staffname" type="text" class="form-control editable" runat="server" value="Staff 21" name="customer">
                            </div>
                            <div class="form-group">
                                <label>Contact No</label>
                                <input id="contact" type="text" class="form-control editable" runat="server" value="018-0000021" name="contact">
                            </div>
                            <div class="form-group">
                                <label>E-mail Address</label>
                                <input id="email" type="text" class="form-control editable" runat="server" value="staff21@mail.com" name="email">
                            </div>
                        </div>

                        <div class="form-part filter-right" id="filter-right">
                            <div class="form-group">
                                <label>Position</label><br>
                                <select id="position" class="form-control" runat="server">
                                    <option value="Accountant">Accountant</option>
                                    <option value="Business Admin">Business Admin</option>
                                    <option value="Logistics Clerk">Logistics Clerk</option>
                                    <option value="Warehouse Operator" selected="selected">Warehouse Operator</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Department</label>
                                <select id="department" class="form-control" runat="server">
                                    <option value="Accounting Department">Accounting Department</option>
                                    <option value="Operation Department">Operation Department</option>
                                    <option value="Logistics Department">Logistics Department</option>
                                    <option value="Inventory Department" selected="selected">Inventory Department</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Salary</label>
                                <input id="salary" type="text" class="form-control editable" runat="server" value="3400.00" name="email">
                            </div>
                            <div class="form-group">
                                <label>Staff Status</label>
                                <select id="status" class="form-control" runat="server">
                                    <option value="Working" selected="selected">Working</option>
                                    <option value="Warn">Warn</option>
                                    <option value="Quit">Quit</option>
                                </select>
                            </div>
                        </div>

                        <div style="clear: both;">
                            <br />
                            <h5>Working Details</h5>
                            <div class="form-part filter-left" id="filter-left">
                                <div class="form-group">
                                    <label>Working Day</label><br>
                                    <select id="workday" class="form-control" runat="server">
                                        <option value="Mon - Fri">Mon - Fri</option>
                                        <option value="Mon - Sat" selected="selected">Mon - Sat</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Weekday Working Hour</label><br>
                                    <select id="weekday" class="form-control" runat="server">
                                        <option value="9:00 AM - 6:00 PM" selected="selected">9:00 AM - 6:00 PM</option>
                                        <option value="8:30 AM - 5:30 PM">8:30 AM - 5:30 PM</option>
                                        <option value="10:00 AM - 6:30 PM">10:00 AM - 6:30 PM</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-part filter-right" id="filter-right">
                                <div class="form-group">
                                    <label>Weekend Working Hour</label>
                                    <select id="weekend" class="form-control" runat="server">
                                        <option value="9:00 AM - 1:00 PM" selected="selected">9:00 AM - 1:00 PM</option>
                                        <option value="9:00 AM - 5:00 PM">9:00 AM - 5:00 PM</option>
                                        <option value="N/A">N/A</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script type="text/javascript">                
                function completeOrder() {
                    document.getElementById("status").value = "Warn";
                }
                function deleteOrder() {
                    document.getElementById("status").value = "Quit";
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
            <div style="margin: 20px auto; text-align: center;">
                <button type="button" id="btnCancel" class="btn btn-danger" data-toggle="modal" data-target="#deleteOrderModal">
                    Cancel
                </button>
                <button type="button" id="btnSave" class="btn btn-success" data-toggle="modal" data-target="#saveOrderModal">
                    Save
                </button>
            </div>
        </div>
    </form>
</body>
</html>
