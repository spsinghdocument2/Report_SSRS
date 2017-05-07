<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllPaymentReport.aspx.cs" Inherits="PayOnlineReportApplication.Web.Reports.AllPaymentReport" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title></title>
    <style>
        #MyReportViewer_ctl05 {
        width:100%;
        }
        #MyReportViewer_ctl09 {
            height:auto;
        }
        /*table {
        width:100%;*/
        }
        .chrome table[id*="_13iT0"],
		.chrome table[class*="_r10"],
		.chrome table[id*="_9iT0"],
		.chrome table[id*="_7iT0"],
        .chrome div[id*="_7iT0"],
		.chrome table[id*="_10iT0"],
		.chrome table[id*="_11iT0"]  {
        width:99.99% !important;
		table-layout:fixed !important;
        }
        td[class*="_r14"]
		{
		background-repeat: no-repeat!important;
		}
        body {
            margin:0;
        }
        #viewer-div {
        height:429px;
        }

    </style>
    <script src="../Scripts/css_browser_selector.js"></script>
    <script type="text/javascript">
        function changeDivHeight() {
            console.log(screen.availHeight);
            var height = document.documentElement.clientHeight;
            if (height > 1050) {
                document.getElementById("viewer-div").setAttribute("style", "height:729px");
            }
            else if (height > 1000 && height <= 1050) {
                document.getElementById("viewer-div").setAttribute("style", "height:699px");
            }
        }
    </script>
</head>
<body onload="changeDivHeight()">
    <form id="form1" runat="server">
    <div style="" id="viewer-div">
        <asp:ScriptManager ID="ScriptManager1" runat="server"  AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <rsweb:ReportViewer ID="MyReportViewer" runat="server" AsyncRendering="true" SizetoReportContent="false" 
                 Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Remote" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" 
                Height="100%" Width="100%" ShowParameterPrompts="False" ShowPromptAreaButton="False" PageCountMode="Actual">
            </rsweb:ReportViewer>
    </div>
    </form>
</body>
</html>
