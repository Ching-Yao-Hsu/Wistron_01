<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Charts.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/org.css" rel="stylesheet" />
    <style>
        * {
            box-sizing: border-box;
        }
        
        #OrgChart table {
            margin: 0;
            padding: 0;
            border-collapse: collapse;
        }
        
        #OrgChart table tr td {
            text-align: center;
            width: 50px;
        }
        
        #OrgChart .centerLine:after {
            content: "";
            position: absolute;
            top: 0;
            bottom: 0;
            left: 50%;
            border-left: 1px solid #ff0000;
            transform: translate(-50%);
        }
        
        #OrgChart .left_bottomLine {
            position: absolute;
            right: 0;
            left: 50%;
            bottom: -0.5px;
            border-bottom: solid 1px red;
            border-radius: 10px;
        }
        
        #OrgChart .right_bottomLine {
            position: absolute;
            right: 50%;
            left: 0;
            bottom: -0.5px;
            border-bottom: solid 1px red;
            border-radius: 10px;
        }
        
        #OrgChart table td {
            width: 50px;
            position: relative;
        }
        
        #OrgChart table td.CenterAndRightBottom:before {
            content: "";
            position: absolute;
            right: -1px;
            bottom: 0;
            height: 100%;
            width: 50%;
            border-left: 2px solid magenta;
            border-bottom: 2px solid magenta;
        }
        
        #OrgChart table td.Center:before {
            content: "";
            position: absolute;
            right: -1px;
            bottom: 0;
            height: 100%;
            width: 50%;
            border-left: 2px solid magenta;
        }
        
        #OrgChart table td.Bottom:before {
            content: "";
            position: absolute;
            right: -1px;
            bottom: 0;
            height: 100%;
            width: 100%;
            border-bottom: 2px solid magenta;
        }
        
        #OrgChart table td.leftBottom:before {
            content: "";
            position: absolute;
            left: 1px;
            bottom: 0;
            height: 100%;
            width: 50%;
            border-bottom: 2px solid magenta;
        }

    </style>


    <script type="text/JavaScript" src="/scripts/jquery-3.1.1.min.js"></script>
    <%--<script type="text/JavaScript" src="/js/org.js"></script>--%>
    <script type="text/JavaScript" src="/js/recursion.js"></script>
    <script type="text/JavaScript">
        function OrgChart_Setup() {
            $("#OrgChart").append(
                $("<table/>")
            );
        }

        function OrgChart_Area(_hierarchy) {
            for (var i = 1; i < _hierarchy; i++) {
                $("#OrgChart table").append(
                    $("<tr/>")
                    .attr("id", "hierarchy" + i + "-0")
                ).append(
                    $("<tr/>")
                    .attr("id", "hierarchy" + i + "-1")
                ).append(
                    $("<tr/>")
                    .attr("id", "hierarchy" + i + "-2")
                );
            }

            $("#OrgChart table").append(
                $("<tr/>")
                .attr("id", "hierarchy" + _hierarchy + "-0")
            )
        }

        function OrgChart_root(_array) {
            var _amount = _array.length;

            for (var i = 0; i < _amount; i++) {
                $("#OrgChart table").find('tr').each(function () {
                    $(this).append(
                        $("<td/>")
                        .attr("colspan", "2")
                        .addClass(_array[i]["id"])

                    ).append(
                        $("<td/>")
                        .attr("colspan", "1")
                    );
                });
            }

        }

        function OrgChart_Node(_array) {

            var _amount = _array.length;

            for (var i = 0; i < _amount; i++) {

                $("#OrgChart table").find('tr').each(function () {
                    $(this).find("." + _array[i]["id"]).addClass(_array[i]["child"][0]);
                });

                for (var j = _array[i]["child"].length - 1; j > 0; j--) {
                    $("#OrgChart table").find('tr').each(function () {
                        $(this).find("." + _array[i]["id"]).next()
                            .after("<td colspan='2' class=" + _array[i]['child'][j] + "></td><td colspan='1'></td>");
                    });
                }
            }
        }

        function OrgChart_Insert(_data) {

            for (var i = 1; i <= _data.length; i++) {

                for (var j = 0; j < _data[i - 1].length; j++) {

                    $("#OrgChart table")
                        .find("#hierarchy" + i + "-0")
                        .find("." + _data[i - 1][j]["id"])
                        .append(
                            $("<div/>")
                            .text("aaa")
                            .css("height", "28px")
                            .css("margin", "auto")
                            .css("border", "2px")
                            .css("border-style", "solid")
                            .css("border-color", "green")
                        );

                    $("#OrgChart table")
                        .find("#hierarchy" + (i - 1) + "-2")
                        .find("." + _data[i - 1][j]["id"])
                        .css("width", "15px")
                        .css("height", "28px")
                        .addClass("Center");

                    if (_data[i - 1][j]["child"].length !== 0 && _data[i - 1][j]["child"].length != 1) {
                        $("#OrgChart table")
                            .find("#hierarchy" + i + "-1")
                            .find("." + _data[i - 1][j]["id"])
                            .css("width", "15px")
                            .css("height", "28px")
                            .addClass("CenterAndRightBottom");
                        $("#OrgChart table")
                            .find("#hierarchy" + i + "-1")
                            .find("." + _data[i - 1][j]["id"])
                            .nextUntil("." + _data[i - 1][j]["child"][(_data[i - 1][j]["child"].length - 1)]).addClass("Bottom");
                        //                        
                        $("#OrgChart table")
                            .find("#hierarchy" + i + "-1")
                            .find("." + _data[i - 1][j]["child"][(_data[i - 1][j]["child"].length - 1)])
                            .addClass("leftBottom");
                    } else if (_data[i - 1][j]["child"].length == 1) {
                        $("#OrgChart table")
                            .find("#hierarchy" + i + "-1")
                            .find("." + _data[i - 1][j]["id"])
                            .css("width", "15px")
                            .css("height", "28px")
                            .addClass("Center");
                    }
                }
            }
        }


        $(document).ready(function () {            
            $.ajax({
                url: "OrgCharts_responseAjax.aspx",
                dataType: "json",
                type: "POST",
                success: function (e) {
                    
                    var rec = new Ezrecursion();                    
                    var table = rec.init_recursion(e);
                    rec.recursion(e)(table);

                    function SortByName(a, b) {
                        var aName = a.id.toLowerCase();
                        var bName = b.id.toLowerCase();
                        return ((aName < bName) ? -1 : ((aName > bName) ? 1 : 0));
                    }

                    e.sort(SortByName);
                    
                    console.log(e);

                    //var array_2D = [];

                    //var maxLength = 0;

                    //for (var i = 0; i < e.length; i++) {
                    //    if (e[i]["id"].split("-").length > maxLength) {
                    //        maxLength = e[i]["id"].split("-").length;
                    //    }
                    //}

                    //for (var i = 0; i < maxLength; i++) {
                    //    array_2D[i] = [];
                    //    data = {};
                    //}

                    //for (var i = 0; i < e.length; i++) {
                    //    array_2D[e[i]["id"].split("-").length - 1].push(e[i]);
                    //}

                    //for (var i = 0; i < maxLength; i++) {
                    //    data[i] = array_2D[i];
                    //}

                    
                    //var array_2D = [];
                    //var maxLength = 0;
                    //var storage = "";

                    //for (var i = 0; i < e.length; i++) {
                    //    if (e[i]["id"].split("-").length > maxLength) {
                    //        maxLength = e[i]["id"].split("-").length;
                    //    }

                    //    storage = e[i]["id"].split("-");
                    //    storage.pop();
                    //    storage.join("-");

                    //    for (var j = 0; j < e.length; j++) {
                    //        if (e[j]["id"] == storage) {
                    //            e[j]["child"].push(e[i]["id"]);
                    //        }
                    //    }
                    //}

                    //for (var i = 0; i < maxLength; i++) {
                    //    array_2D[i] = [];
                    //    data = {};
                    //}

                    //for (var i = 0; i < e.length; i++) {
                    //    array_2D[e[i]["id"].split("-").length - 1].push(e[i]);
                    //}

                    //for (var i = 0; i < maxLength; i++) {
                    //    data[i] = array_2D[i];
                    //}

                    //console.log(data);

                    //var data2 = [data["0"], data["1"], data["2"], data["3"]]
                    //OrgChart_Setup();
                    //OrgChart_Area(data2.length);
                    //OrgChart_root(data2[0]);


                    //OrgChart_Node(data["0"]);
                    //OrgChart_Node(data["1"]);
                    //OrgChart_Node(data["2"]);
                    //OrgChart_Node(data["3"]);

                    //OrgChart_Insert(data2);



                    //$('#tree').EzOrgChart(e);
                    
                },
                error: function () {
                    alert("error");
                }
            })
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div id="tree"></div>--%>
        <div id="OrgChart"></div>
    </form>
</body>
</html>