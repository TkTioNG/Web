<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockProduct.aspx.cs" Inherits="Web.StockProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SEM</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="CSS/StockProduct.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css" />
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css" />

    <script type="text/javascript" src="https://gc.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=R5qUTB3ysvNMOJbbJkstod_HpfB_EziI966YJ75jPitR3BqXjx2hrlnP2E3_-jxYPB2gCY_yfkgd0-eRVs_m2_sThJXrxhfyMCEEOsr_VKs0MTKWUspZyfIsFpjRrAtAZWHiheWXf7uc2-MGYAfrNwwTCrQaTtkf1Ah0p7UiGO3WbPlVYM1IRStD47Cls7rVsNIfwvQgxB27JN4Q7Py5o-0biTMh1wsEu6f3pShAuSU9x6CsuVitSRiqqSZzgGqlonaedNPqzHpB_3Jhk3cWPeRG41QgMhCixzWeAgEWANqSTn_dMW2f2MfN56P41FhD-Is-uL_KR1XKo2X8FR0MZyT-qjKowXDZk24SuOrL31p2COeF4hLEw7XA5MjDrqHcnFa7I3tSb_vbeE3qfWqOCyb5Hl_J8hR8vGniEHxC6anl3hLx0iCgYSmk78Wh9BdXxHPXEr-NLbbV5Cw0q_4ttA" charset="UTF-8"></script>
    <link rel="stylesheet" crossorigin="anonymous" href="https://gc.kis.v2.scr.kaspersky-labs.com/E3E8934C-235A-4B0E-825A-35A08381A191/abn/main.css?attr=aHR0cHM6Ly9kb2MtMGMtNjgtZG9jcy5nb29nbGV1c2VyY29udGVudC5jb20vZG9jcy9zZWN1cmVzYy9rbDQ4NGhsbWxqOTgyNzY1amY0Y2hjY29xYmNqZGNyZi90Zms4NTJzNWs4bzNmZWkyOG9mdTNmNmkyZWFxNHJuai8xNTk4MTY1MjUwMDAwLzEyMzU4MDY2MjY0NzY5NDQ3Njc5LzEwMDA1MTk0NTkyNzE2MTkzMDQ1LzFzS3d5OGM0b2ppbExBV25XSEl5OFBnZnNTVkw3Rm1iUz9lPWRvd25sb2FkJmF1dGh1c2VyPTEmbm9uY2U9M2NjbmI1b21wdWd2YyZ1c2VyPTEwMDA1MTk0NTkyNzE2MTkzMDQ1Jmhhc2g9amFsNGcxOGJpMjA0a2ptZXJpcnJpcDA5aTRlZWpxZ28" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
    <style type="text/css">
        .auto-style11 {
            width: 195px;
            height: 40px;
        }

        .auto-style14 {
            width: 120px;
            height: 40px;
        }

        .auto-style20 {
            height: 40px;
            width: 29px;
        }

        .auto-style21 {
            height: 40px;
        }

        .auto-style23 {
            width: 446px;
            height: 40px;
        }

        .auto-style24 {
            width: 121px;
            height: 40px;
        }

        .auto-style25 {
            width: 771px;
        }

        .auto-style26 {
            width: 122px;
        }

        .auto-style27 {
            height: 40px;
            width: 64px;
        }
    </style>
</head>
<body>
    <div>
        <h1 id="title">Inventory Details</h1>
        <div id="div2">
            <h3 runat="server" id="productname">Item</h3>
            <form id="form" runat="server">
                <table id="table1" style="margin-left: 60px;">
                    <tr>
                        <td  class="auto-style21">Category:</td>
                        <td class="auto-style21">
                            <input id="txtCategory" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        </td>
                        <td class="auto-style20"></td>
                        <td class="auto-style21">Reorder Level:</td>
                        <td class="auto-style21">
                            <input id="txtReorderLevel1" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" /></td>                            
                    </tr>
                    <tr>
                        <td  class="auto-style21">Location:</td>
                        <td class="auto-style21">
                            <input id="txtLocation" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        <td class="auto-style20"></td>
                        <td class="auto-style21">Target Stock Level:</td>
                        <td class="auto-style21">
                            <input id="txtTargetStockLevel" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" /></td>
                    </tr>
                    <tr>
                        <td class="auto-style14">Manufacturer:</td>
                        <td class="auto-style11">
                            <input id="txtManufacturer" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" /></td>
                        <td class="auto-style21"></td>
                        <td class="auto-style21">Discontinued?:</td>
                        <td class="auto-style21">
                            <asp:DropDownList ID="ddlDiscontinued" runat="server">
                                <asp:ListItem Value="Available">Available</asp:ListItem>
                                <asp:ListItem Value="Discountinued">Discountinued</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td  class="auto-style21">Supplier:</td>
                        <td class="auto-style21">
                            <input id="txtSupplier" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="auto-style21">Model:</td>
                        <td class="auto-style21">
                            <input id="txtModel" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="auto-style21">ID:</td>
                        <td class="auto-style21">
                            <input id="txtID" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        </td>
                    </tr>
                </table>

                <table id="table2" class="auto-style25" style="margin-left: 60px;">
                    <tr>
                        <td class="auto-style24" >Description:&nbsp;</td>
                        <td class="auto-style23">
                            <textarea id="txtDescription" runat="server" style="width: 222px;" class="editable" type="text" readonly="readonly" rows="5" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24" >Comments:&nbsp;</td>
                        <td class="auto-style23">
                            <textarea id="txtComments" runat="server" style="width: 622px;" class="editable" type="text" readonly="readonly" rows="5" ></textarea>
                        </td>
                    </tr>
                </table>

                <table id="table3" style="margin-left: 60px;">
                    <tr>
                        <td  class="auto-style26">Stock Unit:</td>
                        <td class="auto-style21">
                            <input id="txtStockUnit" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" /></td>
                        <td class="auto-style27"></td>
                        <td >Current Stock:</td>
                        <td class="auto-style21">
                            <input id="txtCurrentStock" runat="server" style="width: 222px;" class="editable" type="text" readonly="true" />
                        </td>
                    </tr>
                </table>

                <button type="button" id="btnEdit" class="btn btn-primary" style="float: right; margin-top: 25px; margin-right: 60px;" onclick="canEdit()">
                    Edit
                </button>
                <button type="button" id="btnSave" class="btn btn-success" style="display: none; float: right; margin-top: 25px; margin-right: 60px;" onclick="cannotEdit()">
                    Save
                </button>
                <button type="button" id="btnCancel" class="btn btn-danger" style="display: none; float: right; margin-top: 25px; margin-right: 25px;" onclick="cannotEdit()">
                    Cancel
                </button>

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
                </script>
            </form>
        </div>
    </div>
</body>
</html>
