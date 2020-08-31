<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Web.OrderForm" %>

<!DOCTYPE html>

<html>
<head>
    <title>SEM</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="CSS/Invoice.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
        <p id="title">Order Form</p>
        <div id="div2">
            <h1 class="head">Millos Trading
                </h1>
            <p class="head">
                123, Hill Street,<br>
                31000 Perak,<br>
                Malaysia.
               
            </p>
            <ul class="contact">
                <li><a>Tel:605-5342353</a></li>
                <li><a>Fax:605-5342353</a></li>
            </ul>
            <p id="serialNum">
                No.A23546
               
            </p>
            <div id="left">
                <table style="border: none;">
                    <tr>
                        <td class="nbc">Bill To:</td>
                        <td class="nbc bc long">
                            <div id="billTo" runat="server"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="nbc"></td>
                        <td class="nbc bc long"></td>
                    </tr>
                    <tr>
                        <td class="nbc"></td>
                        <td class="nbc bc long"></td>
                    </tr>
                </table>

                <table style="border: none;">
                    <tr>
                        <td class="nbc">Ship To:</td>
                        <td class="nbc bc long">
                            <div id="shipname" runat="server"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="nbc"></td>
                        <td class="nbc bc long">
                            <div id="shipto" runat="server"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="nbc"></td>
                        <td class="nbc bc long"></td>
                    </tr>
                </table>
            </div>

            <div id="right">
                <div id="date">
                    <table style="border: none; width: 100%;">
                        <tr>
                            <td class="nbc">Date:</td>
                            <td class="nbc bc">
                                <div id="issuedate" runat="server"></div>
                            </td>
                        </tr>
                    </table>

                </div>

                <div id="invoiceDetails">
                    <table style="border: none; width: 100%;">
                        <tr>
                            <td class="nbc">Invoice No:</td>
                            <td class="nbc bc">
                                <div id="invoiceno" runat="server"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="nbc">Status:</td>
                            <td class="nbc bc">
                                <div id="status" runat="server"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="nbc">Invoice Term:</td>
                            <td class="nbc bc">
                                <div id="terms" runat="server"></div>
                            </td>
                        </tr>
                        <tr>
                            <td class="nbc">Due Date:</td>
                            <td class="nbc bc">
                                <div id="duedate" runat="server"></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="table" runat="server">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Sub Total (RM)</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><strong>Total</strong></td>
                            <td>&nbsp;</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div id="sign">
                <table style="border: none; width: 310px;">
                    <tr>
                        <td class="nbc">Salesperson:</td>
                        <td class="nbc bc long">
                            <div id="salesperson" runat="server"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

