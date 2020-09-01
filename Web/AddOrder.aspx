<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="Web.AddOrder" %>

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

    <h1>Customer Order Details</h1>
    <div id="body">
        <div class="topnav">
            <!-- Centered link -->
            <div class="topnav-centered">
                <a href="#">Order No: 1000000026</a>
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
                        <h5 class="modal-title" id="completeOrderModalLabel">Create Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you wish to create this new order?
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
                        <h5 class="modal-title" id="deleteOrderModalLabel">Cancel Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you wish to cancel the creating of this order and go back to order page?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='Order.aspx';">Yes</button>
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
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='CustomerOrder.aspx';">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <div id="filter" class="filter">
            <form>
                <div class="form-part filter-left" id="filter-left">
                    <div class="form-group">
                        <label>Customer ID</label><br>
                        <input id="custID" type="text" class="form-control" runat="server" name="customer" value="C00001">
                    </div>
                    <div class="form-group">
                        <label>Customer Name</label><br>
                        <input id="custName" type="text" class="form-control" runat="server" name="customer" value="Customer 1">
                    </div>
                    <div class="form-group">
                        <label>From</label>
                        <input id="contact" type="text" class="form-control" runat="server" name="contact" value="Your House">
                    </div>
                    <div class="form-group">
                        <label>Ship To</label>
                        <input id="email" type="text" class="form-control" runat="server" name="email" value="His House">
                    </div>
                </div>
                <div class="form-part filter-right" id="filter-right">
                    <div class="form-group">
                        <label>Salesperson ID</label><br>
                        <input id="salespersonID" type="text" class="form-control" runat="server" name="salesperson" value="S00001">
                    </div>
                    <div class="form-group">
                        <label>Salesperson Name</label><br>
                        <input id="salespersonName" type="text" class="form-control" runat="server" name="salesperson" value="Salesperson 1">
                    </div>
                    <div class="form-group">
                        <label>Order Date</label>
                        <input id="date" type="datetime" class="form-control" runat="server" name="editable" value="01/09/2020">
                    </div>
                    <div class="form-group">
                        <label>Order Time</label>
                        <input id="time" type="time" class="form-control" runat="server" name="editable" value="18:40:00">
                    </div>
                </div>
            </form>
        </div>

        <script type="text/javascript">

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

        <div id="details">
            <nav>
                <div class="nav nav-tabs mb-3" id="nav-tab" role="tablist">
                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#order_info" role="tab" aria-controls="order_info" aria-selected="true">Order Details</a>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="order_info" role="tabpanel" aria-labelledby="order-details-tab" runat="server">
                    <div class="topnav">
                        <!-- Centered link -->
                        <div class="topnav-centered">
                            <a href="#" style="font-size: xx-large;">Order Info</a>
                        </div>
                    </div>

                    <div id="order_details" runat="server">
                        <table id="myTable" class="table">
                            <th>Product</th>
                            <th>Warehouse Location</th>
                            <th>Quantity</th>
                            <th>Discount</th>
                            <tr>
                                <td>
                                    <select id="txtProduct0" runat="server">
                                        <option value="P00001" selected="selected">Oppa Gangnam Style 01</option>
                                        <option value="P00002">Chopin Ballade No.1</option>
                                        <option value="P00003">Rachmaninoff Piano Concerto No.2</option>
                                        <option value="P00004">Chopin Waltz Op.64 No.2</option>
                                        <option value="P00005">Chopin Nocturne Op.17 No.1</option>
                                        <option value="P00006">Fantasie Impromptu - Chopin</option>
                                        <option value="P00007">Beethoven Symphony No.5</option>
                                        <option value="P00008">Mahler Symphony No.5</option>
                                        <option value="P00009">Chopin Ballade No.4</option>
                                        <option value="P00010">Chopin Etude Op.10 No.10</option>

                                        <option value="P00011">Dior X AJ Crossover</option>
                                        <option value="P00012">Yezzy 100</option>
                                        <option value="P00013">Puma Runner</option>
                                        <option value="P00014">Good Asadi Sandals</option>
                                        <option value="P00015">Highlight Under Armour</option>

                                        <option value="P00016">Off White AW Hoodies</option>
                                        <option value="P00017">Stones Flower Shirt</option>
                                        <option value="P00018">FO Spring Teens Shorts</option>
                                        <option value="P00019">H&M Khaki Longs</option>
                                        <option value="P00020">UNIQLO Loose Hoodies</option>
                                    </select></td>
                                <td>
                                    <select id="txtWarehouselocation0">
                                        <option value="W00001" selected="selected">Penang, Malaysia</option>
                                        <option value="W00002">Johor, Malaysia</option>
                                        <option value="W00003">Yiwu, China</option>
                                        <option value="W00004">Guang Zhou, China</option>
                                    </select></td>
                                <td>
                                    <input type="text" id="txtQuantity0" value="1" /></td>
                                <td>
                                    <select id="txtDiscount0">
                                        <option selected="selected" value="0.00">0 %</option>
                                        <option value="10.00">10 %</option>
                                        <option value="25.00">25 %</option>
                                        <option value="50.00">50 %</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <button type="button" id="btnEdit" class="btn btn-primary" style="float: right;" onclick="insertRow()">
                        Add Row
                    </button>

                    <script>
                        function productList(indexes) {
                            var prod = document.createElement("select");
                            prod.id = "txtProduct" + indexes;
                            var opt = document.createElement("option");
                            opt.value = 'P00001';
                            opt.text = 'Oppa Gangnam Style 01';
                            prod.add(opt, prod.options[0]);

                            opt = document.createElement("option");
                            opt.value = 'P00002';
                            opt.text = 'Chopin Ballade No.1';
                            prod.add(opt, prod.options[1]);

                            opt = document.createElement("option");
                            opt.value = 'P00003';
                            opt.text = 'Rachmaninoff Piano Concerto No.2';
                            prod.add(opt, prod.options[2]);

                            opt = document.createElement("option");
                            opt.value = 'P00004';
                            opt.text = 'Chopin Waltz Op.64 No.2';
                            prod.add(opt, prod.options[3]);

                            opt = document.createElement("option");
                            opt.value = 'P00005';
                            opt.text = 'Chopin Nocturne Op.17 No.1';
                            prod.add(opt, prod.options[4]);

                            opt = document.createElement("option");
                            opt.value = 'P00006';
                            opt.text = 'Fantasie Impromptu - Chopin';
                            prod.add(opt, prod.options[5]);

                            opt = document.createElement("option");
                            opt.value = 'P00007';
                            opt.text = 'Beethoven Symphony No.5';
                            prod.add(opt, prod.options[6]);

                            opt = document.createElement("option");
                            opt.value = 'P00008';
                            opt.text = 'Mahler Symphony No.5';
                            prod.add(opt, prod.options[7]);

                            opt = document.createElement("option");
                            opt.value = 'P00009';
                            opt.text = 'Chopin Ballade No.4';
                            prod.add(opt, prod.options[8]);

                            opt = document.createElement("option");
                            opt.value = 'P00010';
                            opt.text = 'Chopin Etude Op.10 No.10';
                            prod.add(opt, prod.options[9]);


                            opt = document.createElement("option");
                            opt.value = 'P00011';
                            opt.text = 'Dior X AJ Crossover';
                            prod.add(opt, prod.options[10]);

                            opt = document.createElement("option");
                            opt.value = 'P00012';
                            opt.text = 'Yezzy 100';
                            prod.add(opt, prod.options[11]);

                            opt = document.createElement("option");
                            opt.value = 'P00013';
                            opt.text = 'Puma Runner';
                            prod.add(opt, prod.options[12]);

                            opt = document.createElement("option");
                            opt.value = 'P00014';
                            opt.text = 'Good Asadi Sandals';
                            prod.add(opt, prod.options[13]);

                            opt = document.createElement("option");
                            opt.value = 'P00015';
                            opt.text = 'Highlight Under Armour';
                            prod.add(opt, prod.options[14]);



                            opt = document.createElement("option");
                            opt.value = 'P00016';
                            opt.text = 'Off White AW Hoodies';
                            prod.add(opt, prod.options[15]);

                            opt = document.createElement("option");
                            opt.value = 'P00017';
                            opt.text = 'Stones Flower Shirt';
                            prod.add(opt, prod.options[16]);

                            opt = document.createElement("option");
                            opt.value = 'P00018';
                            opt.text = 'FO Spring Teens Shorts';
                            prod.add(opt, prod.options[17]);

                            opt = document.createElement("option");
                            opt.value = 'P00019';
                            opt.text = 'H&M Khaki Longs';
                            prod.add(opt, prod.options[18]);

                            opt = document.createElement("option");
                            opt.value = 'P00020';
                            opt.text = 'UNIQLO Loose Hoodies';
                            prod.add(opt, prod.options[19]);



                            opt = document.createElement("optgroup");
                            opt.setAttribute("label", "Music & Entertainment");
                            opt.appendChild(prod.options[0]);
                            opt.appendChild(prod.options[1]);
                            opt.appendChild(prod.options[2]);
                            opt.appendChild(prod.options[3]);
                            opt.appendChild(prod.options[4]);
                            opt.appendChild(prod.options[5]);
                            opt.appendChild(prod.options[6]);
                            opt.appendChild(prod.options[7]);
                            opt.appendChild(prod.options[8]);
                            opt.appendChild(prod.options[9]);
                            prod.insertBefore(opt, prod.options[0]);


                            opt = document.createElement("optgroup");
                            opt.setAttribute("label", "Shoes & Socks");
                            opt.appendChild(prod.options[10]);
                            opt.appendChild(prod.options[11]);
                            opt.appendChild(prod.options[12]);
                            opt.appendChild(prod.options[13]);
                            opt.appendChild(prod.options[14]);
                            prod.insertBefore(opt, prod.options[10]);


                            opt = document.createElement("optgroup");
                            opt.setAttribute("label", "Clothes & Fabrics");
                            opt.appendChild(prod.options[15]);
                            opt.appendChild(prod.options[16]);
                            opt.appendChild(prod.options[17]);/*
                            opt.appendChild(prod.options[18]);
                            opt.appendChild(prod.options[19]);*/
                            prod.insertBefore(opt, prod.options[15]);

                            return prod;

                        }
                        var index = 1;
                        function insertRow() {
                            var table = document.getElementById("myTable");
                            var row = table.insertRow(table.rows.length);
                            var cell1 = row.insertCell(0);
                            var t1 = document.createElement("input");
                            t1.id = "txtProduct" + index;
                            var test = productList(index);
                            test.id = "txtProduct" + index;
                            cell1.appendChild(test);
                            var cell2 = row.insertCell(1);
                            var t2 = document.createElement("select");
                            t2.id = "txtWarehouseLocation" + index;
                            var penang = document.createElement("option");
                            penang.text = "Penang, Malaysia";
                            penang.value = "W00001";
                            penang.selected = true;
                            t2.add(penang);
                            var johor = document.createElement("option");
                            johor.text = "Johor, Malaysia";
                            johor.value = "W00002";
                            t2.add(johor);
                            var yiwu = document.createElement("option");
                            yiwu.text = "Yiwu, China";
                            yiwu.value = "W00003";
                            t2.add(yiwu);
                            var gz = document.createElement("option");
                            gz.text = "Guang Zhou, China";
                            gz.value = "W00004";
                            t2.add(gz);
                            cell2.appendChild(t2);
                            var cell3 = row.insertCell(2);
                            var t3 = document.createElement("input");
                            t3.id = "txtQuantity" + index;
                            t3.value = 1;
                            cell3.appendChild(t3);
                            var cell4 = row.insertCell(3);
                            var t4 = document.createElement("select");
                            t4.id = "txtDiscount" + index;
                            var zero = document.createElement("option");
                            zero.text = "0 %";
                            zero.value = "0.00";
                            zero.selected = true;
                            t4.add(zero);
                            var ten = document.createElement("option");
                            ten.text = "10 %";
                            ten.value = "10.00";
                            t4.add(ten);
                            var twofive = document.createElement("option");
                            twofive.text = "25 %";
                            twofive.value = "25.00";
                            t4.add(twofive);
                            var fiveo = document.createElement("option");
                            fiveo.text = "50 %";
                            fiveo.value = "50.00";
                            t4.add(fiveo);
                            cell4.appendChild(t4);
                            index++;

                        }
                    </script>
                </div>
            </div>
        </div>


        <div style="text-align: center; width: 50%; margin: auto; clear: both">
            <br />
            <button type="button" id="btnCancel" class="btn btn-danger" data-toggle="modal" data-target="#deleteOrderModal">
                Cancel Order
            </button>
            <button type="button" id="btnSave" class="btn btn-success" style="margin-right: 30px;" data-toggle="modal" data-target="#completeOrderModal">
                Create Order
            </button>
        </div>
    </div>

</body>
</html>
