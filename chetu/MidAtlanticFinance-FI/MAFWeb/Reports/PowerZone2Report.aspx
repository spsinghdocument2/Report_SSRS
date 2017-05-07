<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PowerZone2Report.aspx.cs" Inherits="MAFWeb.Reports.PowerZone2Report" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <title>Power Zone Report</title>
    <style>
        body {
        background-color:black;
        }
        #MyReportViewer_ctl05 {
        width:100%;
        }
        #MyReportViewer_ctl09 {
            height:auto;
        }
        table {
        width:100%;
        }
        .chrome div[id*="_oReportDiv"], .chrome div[id*="_oReportDiv"] div{
            width: 99.99% !important;
        }
        .chrome div[id*="_oReportDiv"] table {
        width:100%;
		table-layout:fixed;
        }
        .chrome table[class*="_r18"] tbody tr td:last-child {
        width:20px;
        }
        body {
            margin:0;
        }
        #viewer-div {
        /*min-height:399px;*/
        height:100%;
        }
          @media only screen and (min-width: 1900px) and (max-width: 3000px) {
            table td div {
                font-size: 30px !important;
                line-height: 30px !important;
            }
        }
    </style>
    <script src="../Scripts/css_browser_selector.js"></script>
    <script type="text/javascript">
        function changeDivHeight()
        {           
            document.getElementById("viewer-div").setAttribute("style", "height:" + window.innerHeight + "px");
            if (screen.availHeight > 1050) {
                document.getElementById("viewer-div").setAttribute("style", "height:" + window.innerHeight + "px");
            }
            else if (screen.availHeight > 1000 && screen.availHeight <= 1050) {
                document.getElementById("viewer-div").setAttribute("style", "height:" + window.innerHeight + "px");
            }
        }
    </script>
</head>
<body  onload="changeDivHeight()">
    <form id="form1" runat="server">
        <div style="" id="viewer-div">
             <asp:ScriptManager ID="ScriptManager1" runat="server"  AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <rsweb:ReportViewer ID="MyReportViewer" runat="server" AsyncRendering="false" SizetoReportContent="true" 
                 Font-Names="Verdana" Font-Size="8pt" ProcessingMode="Remote" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" 
                Height="100%" Width="100%" ShowParameterPrompts="False" ShowPromptAreaButton="False" PageCountMode="Actual">                
            </rsweb:ReportViewer>
        </div>
    </form>
</body>
</html>
