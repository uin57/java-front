$(function () {//	$("input[data-group]").click(function(){//		var group = $(this).attr("data-group");//		var checked = $(this).is(":checked");//		$("input[name$='"+ group +"']").prop("checked",checked);//	});//	$(".dialogBoxContent").appendTo("#dialogBox");//	$('body').everyTime('1das','UserReferer',autoReferer);	//10秒    $("#refererUser").click(function () {        ajaxExt({            url: '/user/amount',            dataType: 'json',            loading: '',            noError: true,            callback: function (rel) {                var amount = rel.amount.toFixed(4);                $(".userBalance").text(amount);                $("#userBalance").attr({"title": amount, 'data-value': amount});            }        });    });    //隐藏金额//	$("#accountHide").click(function () {//		var userBalanceValue = $('#userBalance').attr('data-value');//		if ( $(this).attr('data-value') == "false" ) {//			$('#userBalance').html('******').attr('title', '******');//			$('#appNumUserBalance,#acctInfoUserBalance').html('******');//			$(this).attr('data-value','true').html('显示');//		} else {//			$('#userBalance').html(userBalanceValue).attr('title', userBalanceValue);//			$('#appNumUserBalance,#acctInfoUserBalance').html(userBalanceValue);//			$(this).attr('data-value','false').html('隐藏');//		}//	});    //购彩大厅高度宽度调整//	var lottWidth = 0,//		lottTotalWidth = 0;//	$('#lotteryList .lottDetail').each(function(){//		lottTotalWidth += this.clientWidth;//	})//	$('#lotteryList').css('width', lottTotalWidth + $('#lotteryList .lottDetail').length);//	//购彩大厅高度调整//	var lottHeight = $('#lotteryList').height();//	$('#lotteryList .lottDetail').css('height', lottHeight);//	//	//中奖弹窗关闭//	$('body').on('click', '.closeAwardsMsg', function(){//		$('#' + $(this).attr('data-id') ).css('opacity','0');//		$(this).oneTime('5ds',function(){//			$('#' + $(this).attr('data-id') ).remove();//		});//		console.log('关闭当前窗口');//	});});//创建中奖弹窗DIV//function creatAwardsMsgDialog(id, msg, time){//	var html = "";//	html += "<div class='awardsMsgBox' id='awardsMsgBox" + id + "' style='opacity: 0; pointer-events: none;'>";//	//html += "<embed src='/dd.mp3' autoplay='true' loop='1' style='display: none;'></embed>";//	html += "<p class='awardsMsgTitle'><span>中奖信息</span>";//	html += "<a href='javascript:;' class='closeAwardsMsg' data-id='awardsMsgBox" + id + "'></a>";//	html += "</p><div class='awardsMsgContent'>";//	html += "<span class='awardsMsg'>" + msg + "</span>";//	html += "<span class='awardsMsgTime'>" + time + "</span>";//	html += "</div></div>";//	//	$('#awardsMsgGroup').append(html);//}//刷新金额//function autoReferer(){//	$("#refererUser").click();//}function serializeObject(id) {    var result = {};    var data = $(id).serializeArray();    $.each(data, function (i, d) {        result[d.name] = d.value;    });    return result;}function ajaxExt(options) {    var noError = options.noError;    var settings = {        loading: $("body").get(0),        cache: false,        complete: function () {        },        success: function (rel) {            spinner.spin();            try {                rel = eval('(' + rel + ')');            } catch (e) {            }            if (typeof (rel) == 'string') {                //普通XML                this.callback(rel);            } else {                //JSON                if (rel.status == 302) {                    location.href = "/logout";                } else if (rel.status != 200) {                    if (!noError) {                        $.alert(rel.content);                    }                } else {                    this.callback(rel.content);                }            }            this.complete();        },        error: function () {            spinner.spin();            if (!noError) {                $.alert("您的网络连接异常，请重试");            }            this.complete();        }    };    settings = jQuery.extend(settings, options);    spinner.spin(settings.loading);    $.ajax(settings);}function ajaxObject(url, method, callback) {    var opts = {noError: true, type: method, url: url, cache: false, dataType: 'json', callback: callback};    ajaxExt(opts);}function ajaxLoad(id, url, param, callback) {    spinner.spin($("body").get(0));    param = param || "";    $.post(url, param, function (data) {        $("#" + id).html(data);        if (callback) {            callback(data);        }        spinner.spin();    });}function Service(url, method, d, h, callback, isAsync) {    var header;    var flag = true;    if (typeof isAsync == "boolean") {        flag = isAsync;    }    if (h == 1) {        header = "application/x-www-form-urlencoded";    } else if (h == 2) {        header = "application/json";    }//	spinner.spin($("body").get(0));    ajaxExt({        type: method,        data: d,        url: url,//		cache : false,        dataType: 'json',        async: flag,        callback: callback,//		success : function(rel) {//			spinner.spin();//			if (rel.status == 302) {//				location.href = "/logout";//			} else if (rel.status != 200) {//				$.alert(rel.content);//			} else {//				callback(rel.content);//			}//		},//		error : function() {//			spinner.spin();//			$.alert("您的网络连接异常，请重试");//		},        headers: {            "Content-Type": header        }    });}