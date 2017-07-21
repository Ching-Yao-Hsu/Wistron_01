<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WCFService_Test.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/html_reset.css" rel="stylesheet" />
    <link href="css/WCF_index.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous" />--%>
    <link href="boostrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/org.css" rel="stylesheet" />
    <style> 
        

        
    </style>

   

</head>
<body>
    <form id="form1" runat="server">
        <div class="WCF_index" style="position: relative;">
            <div class="header">
                <div class="title" style="position: relative;">
                    <div style="line-height: 120px; position: relative;">
                        <div style="float: left; padding-left: 40px; line-height: 120px;">
                            <img src="img/header/logo.png" />
                        </div>

                        <div style="line-height: 120px;">
                            <div style="float: left; padding-left: 3%; text-align: center; font-size: 40px; color: white;">
                                <span id="PowerName"></span>
                            </div>
                        </div>

                        <%--SlideValue1--%>
                        <div style="line-height: 120px;" id="SlideValue1">
                            <div style="float: left; padding-left: 1%; padding-right: 3%;">
                                <img style="height: 80px;" src="img/header/word_charges.png" />
                            </div>
                            <div style="float: left; padding-right: 5%; color: white;">
                                <div style="font-size: 100px; float: right;">
                                    <div style="display: inline-block;" id="PowerValue1"></div>
                                    <div style="display: inline-block; font-size: 30px; line-height: 50px;">NTD</div>
                                </div>
                            </div>
                        </div>

                        <%--SlideValue2--%>
                        <div style="line-height: 120px;" id="SlideValue2">
                            <div style="float: left; padding-left: 1%; padding-right: 3%;">
                                <img style="height: 80px;" src="img/header/word_consumption.png" />
                            </div>
                            <div style="float: left; padding-right: 5%; color: white;">
                                <div style="font-size: 100px; float: right;">
                                    <div style="display: inline-block;" id="PowerValue2"></div>
                                    <div style="display: inline-block; font-size: 30px; line-height: 50px;">KWh</div>
                                </div>
                            </div>
                        </div>

                        <%--SlideValue3--%>
                        <div style="line-height: 120px;" id="SlideValue3">
                            <div style="float: left; padding-left: 1%; padding-right: 3%; height: 100px;">
                                <img style="height: 80px;" src="img/header/word_power.png" />
                            </div>
                            <div style="float: left; padding-right: 5%; color: white;">
                                <div style="font-size: 100px; float: right;">
                                    <div style="display: inline-block;" id="PowerValue3"></div>
                                    <div style="display: inline-block; font-size: 30px; line-height: 50px;">W</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <nav class="menu" style="clear: both;" id="Menu_nav">
                    <table style="clear: both;">
                        <tr>
                            <td></td>
                            <td class="option"><strong>及時電力數值</strong></td>
                            <td></td>
                            <td class="option"><strong>電力數值分析</strong></td>
                            <td></td>
                            <td class="option"><strong>電力比對分析</strong></td>
                            <td></td>
                            <td class="option"><strong>個人資料設定</strong></td>
                            <td></td>
                            <td class="option"><strong>管理者專區</strong></td>
                            <td></td>
                        </tr>
                    </table>
                </nav>
            </div>

            <div class="content">
                <div class="top" id="Menu_ShowName">
                    <div style="float: left; width: 100%;">
                        <div style="float: left; text-align: center; margin-left: 6%; color: white; line-height: 50px;">
                            <span style="font-size: 30px;"><strong>電力數值分析</strong></span>
                        </div>

                        <div style="float: left; padding-left: 1%; ">
                            <img style="display:inline-block; line-height: 50px; padding-bottom:10px;" src="img/content/icon_group.png" />
                            <div style="font-size: 30px; color: white; display: inline-block; line-height: 50px;">&nbsp;群組</div>
                        </div>

                        <div style="float: left; line-height: 50px; padding-left: 2%; padding-left: 2%;">
                            <select name="" id="ECO_Group">
                                <option value="">請選擇</option>
                            </select>
                        </div>

                        <div style="float: left; line-height: 50px; margin-right: 2%; margin-left: 2%;">
                            <img src="img/content/icon_search.png" style="display: inline-block;" />
                        </div>

                        <table id="Show_Title" style="float: left; width:500px;line-height: 50px;">
                            <tr>
                                <td >
                                    <input type="checkbox" />
                                    <strong>單線圖編號</strong></td>

                                <td>
                                    <input type="checkbox" />
                                    <strong>ECO-5編號</strong></td>

                                 <td>
                                    <input type="checkbox" />
                                    <strong>電表編號</strong></td>

                                <td>
                                    <input type="checkbox" />
                                    <strong>安裝位置</strong></td>
                            </tr>                           
                        </table>
                    </div>
                </div>

                <div id="treeview_block">
                    <div id="tree"></div>
                </div>
            </div>

            <div class="footer">
                <span>Copyright &copy; 2017</span>
            </div>


            <div style="position: absolute; top: 175px; left: 0; z-index: 1;" >
                <a href="javascript:;" id="Arrow_Show">
                    <img src="img/header/btn_Arrow/button_arrow_closed_01.png" /></a>                    
            </div>

            <div style="position: absolute; top: 125px; left: 0.1%; z-index: 1;" >
                <a href="javascript:;" id="Arrow_Menu">
                    <img src="img/header/btn_Arrow/button_menu_closed_01.png" /></a>
            </div>

        </div>
    </form>





    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="width: 800px;">
            <div class="modal-content" style="height: 600px;">
                <div class="modal-header" style="height: 22%;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <table>
                        <tr>
                            <td>
                                <h4 class="modal-title"><strong>電表編號 :&nbsp;</strong><span id="myModalLabel"></span></h4>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="modal-title"><strong>安裝位置 :&nbsp;</strong><span id="myModalLabe2"></span></h4>
                            </td>
                        </tr>
                    </table>


                </div>
                <div class="modal-body" style="height: 38%; text-align: center;">
                    <table style="width: 100%; height: 100%;">
                        <tr style="height: 25%;">
                            <td colspan="11"></td>
                        </tr>
                        <tr style="height: 25%;">
                            <td colspan="1"></td>
                            <td colspan="1"><span>總電量 :</span></td>
                            <td colspan="2" class="Number"><span id="PowerTotal"></span></td>
                            <td colspan="1" style="width: 5px;"></td>
                            <td colspan="1" class="Unit"><span>KWH</span></td>
                            <td colspan="1"></td>
                            <td colspan="1"><span>電壓 :</span></td>
                            <td colspan="2" class="Number"><span id="Voltage"></span></td>
                            <td colspan="1" style="width: 5px;"></td>
                            <td colspan="1" class="Unit"><span>V</span></td>
                            <td colspan="1"></td>
                        </tr>
                        <tr style="height: 25%;">
                            <td colspan="1"></td>
                            <td colspan="1"><span>功率 :</span></td>
                            <td colspan="2" class="Number"><span id="Power"></span></td>
                            <td colspan="1" style="width: 5px;"></td>
                            <td colspan="1" class="Unit"><span>KW</span></td>
                            <td colspan="1"></td>
                            <td colspan="1"><span>電流 :</span></td>
                            <td colspan="2" class="Number"><span id="Current"></span></td>
                            <td colspan="1" style="width: 5px;"></td>
                            <td colspan="1" class="Unit"><span>A</span></td>
                            <td colspan="1"></td>
                        </tr>
                        <tr style="height: 25%;">
                            <td colspan="11"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer" style="height: 40%;">

                    <table>
                        <tr>
                            <td class="modal_option"><a href="javascript:;">
                                <div class="Modal_btn_diary"></div>
                            </a></td>
                            <td></td>
                            <td class="modal_option"><a href="javascript:;">
                                <div class="Modal_btn_month"></div>
                            </a></td>
                            <td></td>
                            <td class="modal_option"><a href="javascript:;">
                                <div class="Modal_btn_chart"></div>
                            </a></td>
                            <td></td>
                            <td class="modal_option"><a href="javascript:;">
                                <div class="Modal_btn_record"></div>
                            </a></td>
                        </tr>
                        <tr>
                            <td><strong>日報表</strong></td>
                            <td><strong></strong></td>
                            <td><strong>月報表</strong></td>
                            <td><strong></strong></td>
                            <td><strong>趨勢圖</strong></td>
                            <td><strong></strong></td>
                            <td><strong>數值紀錄</strong></td>
                        </tr>
                    </table>

                    <%--<button type="button" class="btn btn-primary">月報表</button>
                    <button type="button" class="btn btn-primary">日報表</button>
                    <button type="button" class="btn btn-primary">查詢</button>
                    <button type="button" class="btn btn-primary">曲線圖</button>--%>
                </div>
            </div>
        </div>
    </div>







    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>--%>
    <script src="boostrap/js/bootstrap.js"></script>
    <script type="text/JavaScript" src="js/org.js"></script>
    <script type="text/JavaScript" src="js/org_recursion.js"></script>

    <script>

        $(document).ready(function () {
            //--------------------------------Title Static Value------------------------------
            $.ajax({
                url: "server_TimeForPowerTotal.aspx",
                dataType: "json",
                type: "POST",
                success: function (e) {
                    $("#PowerName").text(e[0]["Name"]);
                    $("#PowerValue1").text(parseInt(e[0]["powertotal"]).toLocaleString());
                    $("#PowerValue2").text(parseInt(e[0]["KWh"]).toLocaleString());
                    $("#PowerValue3").text(parseInt(e[0]["W"]).toLocaleString());
                    $("#SlideValue1").show();
                    //--------------------------------Title Dymanic Name-------------------------
                    var count_Name = 1;
                    setInterval(function () {
                        $("#PowerName").hide();
                        $("#SlideValue3").hide();
                        setTimeout(function () {
                            $("#PowerName").fadeIn();
                        }, 1000);
                        $("#PowerName").text(e[count_Name]["Name"]);
                        $("#PowerValue1").text(parseInt(e[count_Name]["powertotal"]).toLocaleString());
                        $("#PowerValue2").text(parseInt(e[count_Name]["KWh"]).toLocaleString());
                        $("#PowerValue3").text(parseInt(e[count_Name]["W"]).toLocaleString());

                        if (count_Name === (e.length - 1)) {
                            count_Name = 0;
                        } else {
                            count_Name++;
                        }
                    }, 18000);

                    //----------------------------Title Dymanic Value------------------------------
                    var countValue = 0;
                    setInterval(function () {

                        switch (countValue) {
                            case 0:
                                $("#SlideValue1").fadeOut();
                                countValue++;
                                break;
                            case 1:
                                $("#SlideValue2").fadeOut();
                                countValue++;
                                break;
                            case 2:
                                $("#SlideValue3").fadeOut();
                                countValue = 0;
                                break;
                        }

                        setTimeout(function () {
                            switch (countValue) {
                                case 0:
                                    $("#SlideValue1").fadeIn();
                                    break;
                                case 1:
                                    $("#SlideValue2").fadeIn();
                                    break;
                                case 2:
                                    $("#SlideValue3").fadeIn();
                                    break;
                            }
                        }, 1000);
                    }, 6000);
                },
                error: function () {
                    alert("error");
                }
            });

            //----------------------------------dropdownlist-------------------------------------
            var node;
            var _ECO_Group_account;
            $.ajax({
                url: "server.aspx",
                dataType: "json",
                type: "POST",
                success: function (e) {
                    for (i = 0; i < e.length; i++) {
                        $("#ECO_Group").append(
                            $("<option/>")
                                .text(e[i]["ECO_Group"])
                                .attr("value", e[i]["Account"])
                        );
                    }
                },
                error: function () {
                    alert("error");
                }
            });

            $("#ECO_Group").change(function () {
                _ECO_Group_account = this.value;
                if (_ECO_Group_account != "") {
                    $.ajax({
                        url: "server.aspx",
                        dataType: "json",
                        data: {
                            ECO_Group_account: _ECO_Group_account
                        },
                        type: "POST",
                        success: function (e) {
                            //-------------------------TreeView------------------------
                            var data = e;
                            var color0 = "purple";
                            var color1 = "green";
                            $('#tree').empty();

                            var rec = new Ezrecursion();
                            var table = rec.init_recursion(data);
                            rec.recursion(data)(table);
                            function SortByName(a, b) {
                                var aName = a.id.toLowerCase();
                                var bName = b.id.toLowerCase();
                                return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
                            }
                            data.sort(SortByName);
                            $('#tree').EzOrgChart(data);

                            switch (_ECO_Group_account) {
                                case "eco":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                                case "fomolux":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                                case "jtflex":
                                    $("#tree").css("width", "1000px");
                                    $("#tree").css("margin", "auto");
                                    $("#00-02").parent().find("a").css("background-color", color0);
                                    break;
                                case "kuanstar":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                                case "shichi":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                                case "twenergy":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");

                                    $("#TreeView_Info").text("新加工站:" + color0 + "&nbsp;" + "319庫冷凍機440V:" + color1);
                                    $("#00-00-00").parent().find("a").css("background-color", color0);
                                    $("#00-01").parent().find("a").css("background-color", color1);
                                    break;
                                case "wljsh":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                                case "wlsh":
                                    $("#tree").css("width", "800px");
                                    $("#tree").css("margin", "auto");
                                    break;
                            }


                            //---------------------Modal-------------------
                            $("#tree li a").click(function () {
                                $.ajax({
                                    url: "server.aspx",
                                    dataType: "json",
                                    data: {
                                        node: $(this).data("node"),
                                        ECO_Group_account: _ECO_Group_account
                                    },
                                    type: "POST",
                                    success: function (e) {
                                        console.log(e);
                                        $("#myModalLabel").text(e[0]["ECOSMART"][0]["ECO_AccountAndMeterId"]);
                                        $("#myModalLabe2").text(e[0]["ECOSMART"][0]["InstallPosition"]);
                                        $("#PowerTotal").text(e[1]["OtherDB"][0]["KWh"]);
                                        $("#Voltage").text(e[1]["OtherDB"][0]["Vavg"]);
                                        $("#Power").text(e[1]["OtherDB"][0]["W"]);
                                        $("#Current").text(e[1]["OtherDB"][0]["Iavg"]);
                                    },
                                    error: function () {

                                        $("#myModalLabel").text("");
                                        $("#myModalLabe2").text("");
                                        $("#PowerTotal").text("");
                                        $("#Voltage").text("");
                                        $("#Power").text("");
                                        $("#Current").text("");
                                    }
                                })
                            });
                        },
                        error: function () {
                            alert("error");
                        }
                    })
                } else {
                    //-----------Reset-------------
                    $('#tree').empty();
                    $("#TreeView_Info").text("");
                }
            });

            //-------------------------------btn_Arrow_ShowMenu----------------------------------
            var Arrow_Menu = $("#Arrow_Menu");
            var Arrow_Show = $("#Arrow_Show");
            var Menu_nav = $("#Menu_nav");
            var Menu_ShowName = $("#Menu_ShowName");

            Arrow_Menu.click(function () {
                               
                //if ((Menu_nav.is(":visible") == false && Menu_ShowName.is(":visible") == true)) {
                //    Arrow_Show.parent().animate({ top: "200px" });
                //} else if (Menu_nav.is(":visible") == true && Menu_ShowName.is(":visible") == true) {
                //    Arrow_Show.parent().animate({ top: "170px" });
                //}

                Menu_nav.slideToggle(function () {                    
                    if ($(this).is(":visible")) {
                        Arrow_Menu.find("img").attr("src", "img/header/btn_Arrow/button_menu_opened_01.png");
                    }
                    else {
                        Arrow_Menu.find("img").attr("src", "img/header/btn_Arrow/button_menu_closed_01.png");
                    }
                });
            });
            
            Arrow_Show.click(function () {

                //if ((Menu_nav.is(":visible") == true && Menu_ShowName.is(":visible") == false)) {
                //    Arrow_Show.parent().animate({ top: "200px" });                    
                //} else if (Menu_nav.is(":visible") == true && Menu_ShowName.is(":visible") == true) {
                //    Arrow_Show.parent().animate({ top: "170px" });
                //}

                Menu_ShowName.slideToggle(function () {
                    if ($(this).is(":visible")) {
                        Arrow_Show.find("img").attr("src", "img/header/btn_Arrow/button_arrow_opened_01.png");
                    }
                    else {
                        Arrow_Show.find("img").attr("src", "img/header/btn_Arrow/button_arrow_closed_01.png");
                    }
                });
            });

            


        });
    </script>




</body>
</html>
