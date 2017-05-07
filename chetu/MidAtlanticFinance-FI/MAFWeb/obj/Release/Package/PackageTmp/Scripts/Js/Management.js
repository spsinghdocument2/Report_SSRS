var UserReportid = "";
// Ready function
$(document).ready(function () {
    UserInfo();
 
    $('#popup').hide();
    var userid = null;
    $(".closes").click(function () {
        $('#popup').hide();
        $('#SReportpopup').hide();
        $('#AReportpopup').hide();
        $('#Excludeuserpopup').hide();
        $('#Scheduleuserpopup').hide();
        $('#SMultiUserReportpopup').hide();
        $('#Rolepopup').hide();
        $('#BigScreenpopup').hide();
        $('#RecordingPopup').hide();
    });
    $(".CloseRole").click(function () {
        $('#Rolepopup').hide();

    });
    $(".closepowerzoneschedule").click(function () {
        $('#PowerZonepopup').hide();
    });
    $(".closess").click(function () {
        $('#Scheduleuserpopup').hide();
    });
    $('#btnsave').click(function () {
        $('#Scheduleuserpopup').hide();
       // var Reportid = $('#Reportidhidden').val();
        var Scheduleuserid = "";
        $('.chkuser:checked').map(function () { Scheduleuserid += this.value + ","; });
        $('#Usersid' + UserReportid).val(Scheduleuserid);
    });

    
});

// this function show the Power Zone Time by pop up
function PowerZoneTime(Reportid) {
    $('#PowerZonepopup').css('display', 'block');
    UserReportid = Reportid;
    AjaxPowerZoneTime();
}

// this ajax function show the role Details in Pop up.
function AjaxPowerZoneTime() {
    var Scheduleid = $('#SSID' + UserReportid).val().trim();
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialPowerZoneScheduleTime",
        data: { "scheduleId": Scheduleid },
        success: function (data) {
            $('#PowerZoneTime').html('');
            $('#PowerZoneTime').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get power zone time Details . Please refresh this page');
        }
    });
}

// this function show the Big Screen Power Zone Time by pop up
function BigScreenZoneTime() {
    $('#BigScreenpopup').css('display', 'block');
    $('#PowerZonepopup').hide();
    $('#RecordingPopup').hide();
    $('#Rolepopup').hide();
    $('#popup').hide();
    $('#SReportpopup').hide();
    $('#AReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SMultiUserReportpopup').hide();
    AjaxBigScreenZoneTime();
}

// this ajax function show the role Details in Pop up.
function AjaxBigScreenZoneTime() {
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialBigScreenZoneTime",
        success: function (data) {
            $('#BigScreenTime').html('');
            $('#BigScreenTime').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get power zone time Details . Please refresh this page');
        }
    });
}

// this function show the Recording Path pop up
function RecordingPath() {
    $('#RecordingPopup').css('display', 'block');
    $('#PowerZonepopup').hide();
    $('#BigScreenpopup').hide();
    $('#Rolepopup').hide();
    $('#popup').hide();
    $('#SReportpopup').hide();
    $('#AReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SMultiUserReportpopup').hide();
    AjaxRecordingPath();
}

// this ajax function to get recording path in database.
function AjaxRecordingPath() {
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialRecordingPath",
        success: function (data) {
            $('#RecordingPathDiv').html('');
            $('#RecordingPathDiv').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get Recording Path details . Please refresh this page');
        }
    });
}



// this function show the Assign Role in management interface by pop up
function Role(Userid, Username,Ext)
{
    $('#Rolepopup').css('display', 'block');
    $('#popup').hide();
    $('#SReportpopup').hide();
    $('#AReportpopup').hide();
    //$('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#BigScreenpopup').hide();
    $('#SMultiUserReportpopup').hide();
    $('#PowerZonepopup').hide();
    $('#RecordingPopup').hide();

    $('#usernamehidden').val(Userid);
    AjaxRole(Userid,Ext);
    if (Username != '')
        $('.header_name').html('<span style="color:black;"> User: </span>' + Username);
}


// this ajax function show the role Details in Pop up.
function AjaxRole(Userid,Ext) {
    var Userid = $('#usernamehidden').val();

    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialAssignRole",
        data: { "Userid": Userid },
        success: function (data) {
            $('#AssignRole').html('');
            $('#AssignRole').html(data);
            $('#txtloginid' + Userid).val(Ext);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get Assign Role Details . Please refresh this page');
        }

    });
}

// this ajax function Update the role details in database.
function AjaxUpdateRole(Userid) {    
    var Loginid = $('#txtloginid'+Userid).val().trim();
    var Password = $('#txtpassword' + Userid).val().trim();
    var queue = $('#ddlqueue').val();
    
    var Role = "";
    $('.chkrole:checked').map(function () { Role = this.value; });
    if (Role == "Manager") { queue = queue.join(',');}
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/UpdateAssignRole",
        data: { "Userid": Userid, "Loginid": Loginid, "Password": Password, "Role": Role, "queue": queue },
        success: function (data) {
            UserInfo();
            if (data == "Exist") { $('#msg').html('<span style="color:red;">Allready exist</span>'); }
            else { $('#msg').html('<span style="color:green;">Successfully. </span>'); }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to Update Assign Role Details . Please refresh this page');
        }

    });
}
// this function show the queue list in management interface by pop up
function Queuelist(userid,Username,extnum) { 
    $('#popup').css('display', 'block');
    $('#SReportpopup').hide();
    $('#AReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SMultiUserReportpopup').hide();
    $('#BigScreenpopup').hide();
    $('#Rolepopup').hide();
    $('#PowerZonepopup').hide();
    $('#RecordingPopup').hide();
    $('#useridhidden').val(userid);
    $('#exthidden').val(extnum);
    $('#usernamehidden').val(Username);
    $('#txtqueue').val('');   
    AjaxQueueList(userid, ""); 
    if(Username!='')
        $('.header_name').html('<span style="color:black;"> User: </span>' + Username);
}
// this ajax function show the queue list in Pop up.
function AjaxQueueList(userid,Queuename)
{
    var userid = $('#useridhidden').val().trim();
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialQueuelist",
        data: { "userid": userid, "Queuename": Queuename.trim() },
        success: function (data) {   
            $('#Queuedata').html('');
            $('#Queuedata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get queue list . Please refresh this page');
        }

    });
}


// this function show the Schedule report list in management interface by pop up
function ScheduleReport(userid,Username) {
    $('#SReportpopup').css('display', 'block');
    $('#popup').hide();
    $('#AReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#useridhidden').val(userid);
    $('#Scheduleuserpopup').hide();
    $('#BigScreenpopup').hide();
    $('#RecordingPopup').hide();
    $('#Rolepopup').hide();
    $('#PowerZonepopup').hide();
    $('#SMultiUserReportpopup').hide();
    AjaxSheduleReport("", userid);
    $('#usernamehidden').val(Username);
    $('#txtschedulereport').val('');
    if (Username != '')
        $('.header_name').html('<span style="color:black;"> User: </span>' + Username); 
}

// this function show the Schedule report  list in Pop up.
function AjaxSheduleReport(Reportname, userid)
{
    var userid = $('#useridhidden').val();
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialScheduleReport",
        data: { "Reportname": Reportname.trim(), "userid": userid },
        success: function (data) {
            $('#Schedulereportdata').html('');
            $('#Schedulereportdata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get schedule report list . Please refresh this page');
        }

    });
}

// this function show the Schedule MultiUser report list in management interface by pop up
function ScheduleMultiUserReport() {
    $('#SMultiUserReportpopup').css('display', 'block');
    $('#popup').hide();
    $('#AReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SReportpopup').hide();
    $('#Rolepopup').hide();
    $('#PowerZonepopup').hide();
    $('#BigScreenpopup').hide();
    $('#RecordingPopup').hide();
    $('#txtmultischedulereport').val('');
    AjaxSheduleMultiUserReport(""); 

}

// this function show the Schedule report  list in Pop up.
function AjaxSheduleMultiUserReport(Reportname) {
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialMulitUserScheduleReport",
        data: { "Reportname": Reportname.trim()},
        success: function (data) {
            $('#ScheduleMultiUserreportdata').html('');
            $('#ScheduleMultiUserreportdata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get schedule multiuser report list . Please refresh this page');
        }

    });
}


// this function show the Schedule user list in Schedule Report by pop up
function ScheduleUserList(Reportid, Abbreviation) {
    $('#Scheduleuserpopup').css('display', 'block');
    $('#Reportidhidden').val(Reportid);
    $('#txtscheduleuser').val('');
    UserReportid = Reportid;    
    AjaxScheduleUserList("", Abbreviation);
}

//Ajax function show the Schedule user list in Schedule Report in pop up
function AjaxScheduleUserList(Username, Abbreviation) {
    var queuenum="";
    var Scheduleid = $('#SSID' + UserReportid).val().trim();
    if (Abbreviation == "QueueLog") { queuenum = $('#ddlQueue').val(); }
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialScheduleUser",
        data: { "Username": Username, "Scheduleid": Scheduleid, "queuenum": queuenum, "ReportID": UserReportid, "Abbreviation": Abbreviation },
        success: function (data) {
            $('#ScheduleUserdata').html('');
            $('#ScheduleUserdata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get schedule report list . Please refresh this page');
        }

    });
}


// this function show the Exclude User report list in management interface by pop up
function ExcludeUserReport() {
    $('#Excludeuserpopup').css('display', 'block');
    $('#popup').hide();
    $('#SReportpopup').hide();
    $('#AReportpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SMultiUserReportpopup').hide();
    $('#Rolepopup').hide();
    $('#PowerZonepopup').hide();
    $('#BigScreenpopup').hide();
    $('#RecordingPopup').hide();
    $('#txtexcludeuser').val('');
    AjaxExcludeUserReport("");
   
}

// this function show the Schedule report  list in Pop up.
function AjaxExcludeUserReport(searchuser) {
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialExcludeUserDetails",
        data: { "searchuser": searchuser.trim() },
        success: function (data) {
            $('#ExcludeUserdata').html('');
            $('#ExcludeUserdata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get exclude user list . Please refresh this page');
        }

    });
}
// this function show the Add report to user list in management interface by pop up
function AddReport(userid,Username) {
    $('#AReportpopup').css('display', 'block');
    $('#popup').hide();
    $('#SReportpopup').hide();
    $('#Excludeuserpopup').hide();
    $('#Scheduleuserpopup').hide();
    $('#SMultiUserReportpopup').hide();
    $('#useridhidden').val(userid);
    $('#Rolepopup').hide();
    $('#PowerZonepopup').hide();
    $('#BigScreenpopup').hide();
    $('#RecordingPopup').hide();
    $('#usernamehidden').val(Username);
    $('#txtaddreport').val('');
    AjaxAddReport("", userid);
    if (Username != '')
        $('.header_name').html('<span style="color:black;"> User: </span>' + Username);
}

// this function show the Add report to user list in pop up
function AjaxAddReport(Reportname,userid)
{
    var userid = $('#useridhidden').val();
    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialAddReport",
        data: { "Reportname": Reportname.trim(), "userid": userid },
        success: function (data) {
            $('#Addreportdata').html('');
            $('#Addreportdata').html(data);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get schedule report list . Please refresh this page');
        }

    });
}


// this function show the user list in management interface page.
function UserInfo() {
    var searchuser = $('#txtsearch').val().trim();
    var searchqueue = $('#txtsearchqueue').val().trim();
    var Info = $('#Info');
     $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/PartialUserDetails",
        data: { "searchuser": searchuser, "SearchQueue": searchqueue },
        success: function (data) {
            Info.html('');
            Info.html(data);           
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to get user list . Please refresh this page');
        }

    });
}

// this function update enable user in management interface page.
function UpdateEnableUser(userid, name, active) {

        $.ajax({
            cache: false,
            type: "GET",
            url: "/Management/UpdateEnableUser",
            data: { "userid": userid, "active": active },
            success: function (data) {
                //alert(data);
                UserInfo();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                ShowErrorPoup('Failed to update enable user . Please refresh this page');
            }

        });
 
}


// this function update Exclude Management user in Pop up.
function UpdateExcludeManagementUser(userid,Active) {

    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/UpdateExcludeManagementUser",
        data: { "userid": userid, "Active": Active },
        success: function (data) {
            //alert(data);
            ExcludeUserReport();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to update exclude user . Please refresh this page');
        }

    });

}


// this function update user reports in add report pop up.
function UpdateUserReports(reportid) {
    var userid = $('#useridhidden').val();
        $.ajax({
            cache: false,
            type: "GET",
            url: "/Management/UpdateUserReports",
            data: { "userid": userid, "reportid": reportid },
            success: function (data) {    
            },
            error: function (xhr, ajaxOptions, thrownError) {
                ShowErrorPoup('Failed to update user in report . Please refresh this page');
            }

        });
}

// this function update user in queue in pop up.
function UpdateUserInQueue(queueid,active) {    
    var extnum = $('#exthidden').val().trim();
    var userid = $('#useridhidden').val().trim();
        $.ajax({
            cache: false,
            type: "GET",
            url: "/Management/UpdateUserInQueue",
            data: { "extnum": extnum, "queueid": queueid,"active":active },
            success: function (data) {
            },
            error: function (xhr, ajaxOptions, thrownError) {                
                ShowErrorPoup('Failed to update user in Queue . Please refresh this page');
            }

        });

}

// this function delete user into the managment.
function DeleteUser(userId) {

    $.ajax({
        cache: false,
        type: "GET",
        url: "/Management/DeleteUser",
        data: { "userId": userId },
        success: function (data) {
            UserInfo();
        },
        error: function (xhr, ajaxOptions, thrownError) {
            ShowErrorPoup('Failed to delete user in managment . Please refresh this page');
        }

    });

}




// this function update user shecdule reports in report pop up.
function UpdateScheduleReports(reportid) {
    var userid = $('#useridhidden').val();
    var emailid = $('#emailtxt' + reportid).val().trim();
    var scheduletime = $('#stimetxt' + reportid).val().trim();
    var scheduletype = $('#ddl' + reportid).val(); // daily:1 , Weekly : 2;
    var IsSchedule = $('#IssSchedule' + reportid).val();

        $.ajax({
            cache: false,
            type: "GET",
            url: "/Management/UpdateUserScheduleReports",
            data: { "userid": userid, "reportid": reportid, "emailid": emailid, "scheduletime": scheduletime, "scheduletype": scheduletype, "IsSchedule": IsSchedule },
            success: function (data) {
                AjaxSheduleReport('', '');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                ShowErrorPoup('Failed to update user schedule report . Please refresh this page');
            }

        });
}

function ConvertTimeformat(format, str) {
    var time = str;
    var hours = Number(time.match(/^(\d+)/)[1]);
    var minutes = Number(time.match(/:(\d+)/)[1]);
    var AMPM = time.match(/\s(.*)$/)[1];
    if (AMPM == "PM" && hours < 12) hours = hours + 12;
    if (AMPM == "AM" && hours == 12) hours = hours - 12;
    var sHours = hours.toString();
    var sMinutes = minutes.toString();
    if (hours < 10) sHours = "0" + sHours;
    if (minutes < 10) sMinutes = "0" + sMinutes;
    return sHours + ":" + sMinutes;
}

// this function update Multi user shecdule reports in report pop up.
function UpdateMultiUserScheduleReports(reportid) {
    var queuenum = "";
    var zone1FromTime;
    var zone1ToTime;
    var zone2FromTime;
    var zone2ToTime;
    var emailid = $('#emailstxt' + reportid).val().trim();
    var scheduletime = $('#stimetxt' + reportid).val().trim();
    var scheduletype = $('#ddl' + reportid).val().trim();  // daily:1 , Weekly : 2;
    var users = $('#Usersid' + reportid).val();
    var IsSchedule = $('#IsSchedule'+reportid).val();
    var scheduleid = $('#SSID' + reportid).val().trim();
    if (reportid == 1) { queuenum = $('#ddlQueue').val().trim(); }
    
    var data = {
        "reportid": reportid,
        "emailid": emailid, "scheduletime": scheduletime,
        "scheduletype": scheduletype, "users": users, "queuenum": queuenum,
        "scheduleid": scheduleid, "IsSchedule": IsSchedule,
        "zone1FromTime": zone1FromTime, "zone1ToTime": zone1ToTime,
        "zone2FromTime": zone2FromTime, "zone2ToTime": zone2ToTime
    };
    if (reportid == 4) {
        zone1FromTime = $('#Zone1FromTime' + reportid).val();
        zone1ToTime = $('#Zone1ToTime' + reportid).val();
        zone2FromTime = $('#Zone2FromTime' + reportid).val();
        zone2ToTime = $('#Zone2ToTime' + reportid).val();
        data.zone1FromTime = ConvertTimeformat("24", zone1FromTime);
        data.zone1ToTime = ConvertTimeformat("24", zone1ToTime);
        data.zone2FromTime = ConvertTimeformat("24", zone2FromTime);
        data.zone2ToTime = ConvertTimeformat("24", zone2ToTime);
    }
        $.ajax({
            cache: false,
            type: "GET",
            url: "/Management/UpdateMultiUserScheduleReports",
            data: data,
            success: function (data) {
                //AjaxSheduleReport('', '');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                ShowErrorPoup('Failed to update multi user schedule report . Please refresh this page');
            }

        });
}



//***************************** Start Error Pop up *******************************************************************************//
function ShowErrorPoup(Text) {
    var $confirm = $("#modalConfirmYesNo");
    $confirm.modal('show');
    $("#lblTitleConfirmYesNo").html('Error');
    $("#lblMsgConfirmYesNo").html(Text);
    $("#btnYesConfirmYesNo").hide();
    $("#btnNoConfirmYesNo").text("Ok");
    $("#btnNoConfirmYesNo").off('click').click(function () {
        $confirm.modal("hide");
    });
}
//***************************** End Error Pop up *******************************************************************************//




