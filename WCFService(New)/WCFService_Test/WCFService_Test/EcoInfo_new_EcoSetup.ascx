﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EcoInfo_new_EcoSetup.ascx.cs" Inherits="WCFService_Test.EcoInfo_new_EcoSetup" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="css/html_reset.css" rel="stylesheet" />
    <link href="css/EcoInfo_new/EcoSetup.css" rel="stylesheet" />
    
</head>

<body>
    <div class="ECO5tabs" style="width: 370px;">
        <div class="content">
            <div class="ECO5tabcontent">
                <div class="ECO5title">
                    <div class="ECO5Setup">ECO-5設定</div>
                    <div class="ECO5SetupNum"><span>02</span></div>
                </div>
                <div class="ECO5Table">
                    <table>
                        <tr>
                            <td style="letter-spacing: 20px;">群組:
                            </td>
                            <td>
                                <select name="" id="ECO5Group">
                                    <option value="ECO5Group">電力監控群組</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td style="letter-spacing: 20px;">編號:</td>
                            <td>
                                <select name="" id="ECO5Num">
                                    <option value="ECO5Num">選擇</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 20px;" id="ECO5Account">帳號:</td>
                            <td class="ECO5TableBLine">123</td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 20px;">密碼:
                            </td>
                            <td class="ECO5TableBLine" id="ECO5Password">123</td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 28px;">IP:</td>
                            <td class="ECO5TableBLine" id="ECO5IP">123</td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 20px;">型號:</td>
                            <td>
                                <select name="" id="ECO5Type">
                                    <option value="ECO5Type">ECO-5 Lite</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>安裝位置:</td>
                            <td class="ECO5TableBLine" id="ECO5Position">123</td>
                        </tr>
                        <tr>
                            <td>圖面編號:</td>
                            <td class="ECO5TableBLine" id="ECO5DiagramNum">123</td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 20px;">時區:</td>
                            <td>
                                <select name="" id="ECO5TimeBlock">
                                    <option value="08">+08</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="letter-spacing: 4px;">啟用狀態:</td>
                            <td style="text-align: left; line-height: 20px;">
                                <div>
                                    <span class="ECO5Status_ON" id="ECO5Status">ON</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ECO5Table_Btn" id="ECO5Table_Btn_Enter">
                                <button type="button">確定</button></td>
                            <td class="ECO5Table_Btn" id="ECO5Table_Btn_Cancel">
                                <button type="button">取消</button></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
    $(document).ready(function () {

        $("#ECO5Status").click(function () {
            if ($(this).hasClass("ECO5Status_ON")) {
                $(this).removeClass("ECO5Status_ON");
                $(this).addClass("ECO5Status_OFF");
                $(this).text("OFF");
            } else {
                $(this).removeClass("ECO5Status_OFF");
                $(this).addClass("ECO5Status_ON");
                $(this).text("ON");
            }

        });


    });
</script>

</html>