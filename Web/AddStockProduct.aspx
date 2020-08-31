<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStockProduct.aspx.cs" Inherits="Web.AddStockProduct" %>

<!DOCTYPE html>
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
        <h1>Add New Product Details</h1>
        <div id="body">
            <div class="topnav">
                <!-- Centered link -->
                <div class="topnav-centered">
                    <a href="#">New Stock Product</a>
                </div>

                <!-- Left-aligned links (default) -->
                <a href="#">Search: New</a>

                <!-- Right-aligned links -->
                <div class="topnav-right">
                    <a href="Store.aspx">Close</a>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="completeOrderModal" tabindex="-1" role="dialog" aria-labelledby="completeOrderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="completeOrderModalLabel">Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to add this new stock product?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" data-toggle="modal" data-target="#updateStatusModal">Yes</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="deleteOrderModal" tabindex="-1" role="dialog" aria-labelledby="deleteOrderModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteOrderModalLabel">Cancel Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you wish to cancel the product?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='Store.aspx';">Yes</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateStatusModal" tabindex="-1" role="dialog" aria-labelledby="updateStatusModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateStatusModalLabel">Success to Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            The product has been successfully added.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='StockProduct.aspx?stockproductid=<%= prodID.SelectedValue + warehouseID.SelectedValue %>';">OK</button>
                            <!--<asp:Button ID="btnYes" runat="server" Text="OK" CssClass="btn btn-primary" data-dismiss="modal" OnClick="btnYes_Click" />-->
                        </div>
                    </div>
                </div>
            </div>

            <div id="filter" class="filter">
                <div class="form-part filter-left" id="filter-left">
                    <div class="form-group">
                        <label>Product Name</label><br>
                        <asp:DropDownList ID="prodID" runat="server" CssClass="form-control">
                            <asp:ListItem Value="P00001" Selected="True">Oppa Gangnam Style 01</asp:ListItem>
                            <asp:ListItem Value="P00002">Chopin Ballade No.1</asp:ListItem>
                            <asp:ListItem Value="P00003">Rachmaninoff Piano Concerto No.2</asp:ListItem>
                            <asp:ListItem Value="P00004">Chopin Waltz Op.64 No.2</asp:ListItem>
                            <asp:ListItem Value="P00005">Chopin Nocturne Op.17 No.1</asp:ListItem>
                            <asp:ListItem Value="P00006">Fantasie Impromptu - Chopin</asp:ListItem>
                            <asp:ListItem Value="P00007">Beethoven Symphony No.5</asp:ListItem>
                            <asp:ListItem Value="P00008">Mahler Symphony No.5</asp:ListItem>
                            <asp:ListItem Value="P00009">Chopin Ballade No.4</asp:ListItem>
                            <asp:ListItem Value="P00010">Chopin Etude Op.10 No.10</asp:ListItem>
                            <asp:ListItem Value="P00011">Dior X AJ Crossover</asp:ListItem>
                            <asp:ListItem Value="P00012">Yezzy 100</asp:ListItem>
                            <asp:ListItem Value="P00013">Puma Runner</asp:ListItem>
                            <asp:ListItem Value="P00014">Good Asadi Sandals</asp:ListItem>
                            <asp:ListItem Value="P00015">Highlight Under Armour</asp:ListItem>
                            <asp:ListItem Value="P00016">Off White AW Hoodies</asp:ListItem>
                            <asp:ListItem Value="P00017">Stones Flower Shirt</asp:ListItem>
                            <asp:ListItem Value="P00018">FO Spring Teens Shorts</asp:ListItem>
                            <asp:ListItem Value="P00019">H&M Khaki Longs</asp:ListItem>
                            <asp:ListItem Value="P00020">UNIQLO Loose Hoodies</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Reorder Level</label><br>
                        <input id="custName" type="text" class="form-control" runat="server" name="customer" value="20000">
                    </div>
                    <div class="form-group">
                        <label>Target Stock Level</label>
                        <input id="contact" type="text" class="form-control" runat="server" name="contact" value="30000">
                    </div>
                    <div class="form-group">
                        <label>Current Stock</label>
                        <input id="email" type="text" class="form-control" runat="server" name="email" value="25966">
                    </div>
                </div>
                <div class="form-part filter-right" id="filter-right">
                    <div class="form-group">
                        <label>Warehouse Location</label><br>
                        <asp:DropDownList ID="warehouseID" runat="server" CssClass="form-control">
                            <asp:ListItem Value="W00001" Selected="True">Penang, Malaysia</asp:ListItem>
                            <asp:ListItem Value="W00002">Johor, Malaysia</asp:ListItem>
                            <asp:ListItem Value="W00003">Yiwu, China</asp:ListItem>
                            <asp:ListItem Value="W00004">Guang Zhou, China</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Stock Product Status</label><br>
                        <input id="salespersonName" type="text" class="form-control" runat="server" name="salesperson" value="Salesperson 1">
                    </div>
                    <div class="form-group">
                        <label>Add Date</label>
                        <input id="date" type="datetime" class="form-control" runat="server" value="01/09/2020" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label>Current Unit</label>
                        <select class="form-control">
                            <option value="Unit">Unit</option>
                            <option value="KG">KG</option>
                            <option value="Liter">Liter</option>
                            <option value="Meter">Meter</option>
                        </select>
                    </div>
                </div>
            </div>

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

            <div style="text-align: center; width: 50%; margin: auto; clear: both">
                <br />
                <button type="button" id="btnCancel" class="btn btn-danger" data-toggle="modal" data-target="#deleteOrderModal">
                    Cancel Product
                </button>
                <button type="button" id="btnSave" class="btn btn-success" style="margin-right: 30px;" data-toggle="modal" data-target="#completeOrderModal">
                    Create Product
                </button>
            </div>
        </div>
    </form>
</body>
</html>
