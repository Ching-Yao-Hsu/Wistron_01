<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EcoInfo_new.aspx.cs" Inherits="WCFService_Test.EcoInfo_new" %>

<%@ Register Src="~/EcoInfo_new_EcoSetup.ascx" TagPrefix="uc1" TagName="EcoInfo_new_EcoSetup" %>
<%@ Register Src="~/EcoInfo_new_MeterSetup.ascx" TagPrefix="uc1" TagName="EcoInfo_new_MeterSetup" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/html_reset.css" rel="stylesheet" />
    <link href="css/EcoInfo_new/EcoInfo_new.css" rel="stylesheet" />
    <link href="css/EcoInfo_new/EcoInfo_newTabs.css" rel="stylesheet" />

    <style>
        /* The Modal (background) */

        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
            -webkit-animation-name: fadeIn;
            /* Fade in the background */
            -webkit-animation-duration: 0.4s;
            animation-name: fadeIn;
            animation-duration: 0.4s;
            text-align: center;
        }
        /* Modal Content */

        .modal-content {            
            position:fixed;
            background-color: transparent;
            -webkit-animation-name: slideIn;
            -webkit-animation-duration: 0.4s;
            animation-name: slideIn;
            animation-duration: 0.4s;            
            left:50%;
            transform:translateX(-50%);
            top:100px;            
        }
        /* The Close Button */

        .close {
            color: black;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        /* Add Animation */

        @-webkit-keyframes slideIn {
            from {
                top: -300px;
                opacity: 0;
            }

            to {
                top: 100px;
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                top: -300px;
                opacity: 0;
            }

            to {
                top: 100px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <div class="EcoInfo_page">
            <div class="Eco_Nav">
                <div class="container">
                    <div class="Eco_Group">
                        <span>群組</span>
                        <select id="Eco_Group">
                            <option value="0">電力監控群組</option>
                        </select>
                    </div>

                    <table class="Eco_Info">
                        <tr>
                            <td colspan="2">
                                <img src="img/Wistron/EcoInfo_new/icon_eco5.png" />
                                <span>ECO-5資訊 - </span><span class="font_open">啟用</span><input type="button" value="修改" id="ECO5-InfoUpdate" />
                            </td>
                        </tr>
                        <tr>
                            <td>型號:<span id="Eco_Type">ECO-5 Lite</span></td>
                            <td>編號:<span id="Eco_Numbering">02</span></td>
                        </tr>
                        <tr>
                            <td>帳號:<span id="Eco_Account">eco000000000009</span></td>
                        </tr>
                        <tr>
                            <td>密碼:<span id="Eco_Password">000000</span></td>
                        </tr>
                        <tr>
                            <td>安裝位置:<span id="Eco_Position">辦公室</span></td>
                        </tr>
                        <tr>
                            <td>IP:<span id="Eco_IP">192.168.0.0</span></td>
                        </tr>
                        <tr>
                            <td>圖面:<span id="Eco_Diagram">Null</span></td>
                            <td>時差:<span id="Eco_TimeDifferent">0</span></td>
                        </tr>
                    </table>
                    <table class="Meter_Info">
                        <tr>
                            <td colspan="2">
                                <img src="img/Wistron/EcoInfo_new/icon_meter.png" />
                                <span>電表資訊 - </span><span class="font_open">啟用</span><input type="button" value="修改" id="Meter-InfoUpdate" />
                            </td>
                        </tr>
                        <tr>
                            <td>型號:<span id="Meter_Type">PA310</span></td>
                            <td>編號:<span id="Meter_Numbering">03</span></td>
                        </tr>
                        <tr>
                            <td>電流:<span id="Meter_Current">600</span></td>
                            <td>電壓:<span id="Meter_Voltage">380/200</span></td>
                        </tr>
                        <tr>
                            <td>種類:<span id="Meter_Sort">辦公室</span></td>
                            <td>位置:<span id="Meter_Position">辦公室A</span></td>
                        </tr>
                        <tr>
                            <td>圖面:<span id="Meter_Diagram">Null</span></td>
                            <td>單線圖:<span id="Meter_Route">01-01</span></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="EUI"><span>EUI</span></td>
                        </tr>
                        <tr>
                            <td>面積:<span id="Meter_EUIArea">1000</span></td>
                            <td>人員:<span id="Meter_EUIPeople">20</span></td>
                        </tr>
                        <tr>
                            <td>產量:<span id="Meter_Productivity">300</span></td>
                            <td>自定義:<span id="Meter_Definition">值</span></td>
                        </tr>
                    </table>
                    <table class="Meter_List">
                        <tr>
                            <td colspan="4">
                                <img src="img/Wistron/EcoInfo_new/icon_list.png" />
                                <span>電表列表</span>
                            </td>
                        </tr>

                        <tr>
                            <td>ECO-5編號</td>
                            <td>編號</td>
                            <td>種類</td>
                            <td>位置</td>
                        </tr>

                        <tr>
                            <td>ECO-5#2</td>
                            <td>01</td>
                            <td>辦公區</td>
                            <td>會議室</td>
                        </tr>

                        <tr>
                            <td>ECO-5#2</td>
                            <td>02</td>
                            <td>辦公區</td>
                            <td>會客室</td>
                        </tr>

                        <tr>
                            <td>ECO-5#2</td>
                            <td>03</td>
                            <td>辦公區</td>
                            <td>辦公室A</td>
                        </tr>

                        <tr>
                            <td>ECO-5#2</td>
                            <td>04</td>
                            <td>辦公區</td>
                            <td>辦公室B辦公室B</td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="MeterTreeView ">
                <div class="MeterTreeViewNav ">
                    <div class="MeterTreeViewTabs">
                        <span class="tablinks ">
                            <input type="button" class="" name="name" data-link="ECO-5#1" value="ECO-5#1" /></span>
                        <span class="tablinks ">
                            <input type="button" name="name" data-link="ECO-5#2" value="ECO-5#2" /></span>
                        <span class="tablinks ">
                            <input type="button" name="name" data-link="ECO-5#3" value="ECO-5#3" /></span>
                        <span class="tablinks ">
                            <input type="button" name="name" data-link="ECO-5#4" value="ECO-5#4" /></span>
                        <span class="tablinks ">
                            <input type="button" name="name" data-link="ECO-5#5" value="ECO-5#5" /></span>
                        <span class="tablinks ">
                            <input type="button" name="name" data-link="ECO-5#6" value="ECO-5#6" /></span>
                    </div>

                    <div class="MeterTreeViewContent">
                        <div class="MeterStatusSelect">
                            <div>
                                <img src="img/Wistron/EcoInfo_new/explain_on.png" />
                                <span>已啟用電表</span>
                            </div>
                            <div>
                                <img src="img/Wistron/EcoInfo_new/explain_off.png" />
                                <span>停用電表</span>
                            </div>
                            <div>
                                <img src="img/Wistron/EcoInfo_new/explain_select.png" />
                                <span>目前點選的電表</span>
                            </div>
                        </div>
                        <h1></h1>
                        <p>London is the capital city of England.</p>
                    </div>
                </div>
            </div>
        </div>


        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">

                <%--<span class="close">&times;</span>--%>
                <uc1:EcoInfo_new_EcoSetup runat="server" ID="EcoInfo_new_EcoSetup" />

            </div>

        </div>


        <uc1:EcoInfo_new_MeterSetup runat="server" ID="EcoInfo_new_MeterSetup" />

    </form>
    <script src="js/jquery/jquery-3.1.1.min.js"></script>
    <script>

        $(document).ready(function () {

            $(".MeterTreeView .MeterTreeViewNav .MeterTreeViewTabs input").click(function () {
                $(".MeterTreeView .MeterTreeViewNav .MeterTreeViewTabs input").each(function () {
                    $(this).css("border-bottom-color", "lightgray");
                    $(this).css("background", "linear-gradient(to right bottom, white, white, #f2f2f2)");
                    $(this).parent().removeClass("tablinks_selected");
                });
                $(this).css("border-bottom-color", "white");
                $(this).css("background", "white");
                $(this).parent().addClass("tablinks_selected");
                $(".MeterTreeViewContent h1").text($(this).data("link"));
            });

        });



        var modal = document.getElementById('myModal');
        var btn = document.getElementById("ECO5-InfoUpdate");
        //var span = document.getElementsByClassName("close")[0];

        btn.onclick = function () {
            modal.style.display = "block";
        }
        //span.onclick = function () {
        //    modal.style.display = "none";
        //}
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

    </script>

</body>
</html>
