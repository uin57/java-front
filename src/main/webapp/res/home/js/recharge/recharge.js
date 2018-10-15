$(function () {	var errorMessage = $('#errorMessage').val();	if (errorMessage) {		alert(errorMessage);		return false;	}	$("#chargeamount").keyup(function () {		var v = this.value;		var maxmoney = $("#txtMaxAmount").text();		maxmoney = parseInt(maxmoney.replace(',', '')); // 拿掉数字FORMAT 才能作比较		if (Number(v) > maxmoney) {			$(this).val(maxmoney);		}		checkMoney(this);		commissionCharge();		checkForm();		rechAmountShow(this.value);	}).on('focus', function () {		if (this.value) {			$('#rechAmountInfo').parent().show();		}	}).on('blur', function () {		$('#rechAmountInfo').parent().hide();	});	checkUnRecharge();	$(".bank").first().click();	$("#chargeamount").focus();    if($(".bank-r").height() < 100){        $(".changeBankToggleBank").css({display:'none'});    }	//收起，展开	$(".toggleBank").click(function(){		var heightBankR = $(".bank-r").height();		console.log(heightBankR)		var sclooTop = Math.ceil($(".bank").length/4*114)-129;		console.log(Math.ceil($(".bank").length/4*114));		if(heightBankR <= 114){			$(this).html("收起更多银行");			$(this).css({background:'#666',border: "1px solid #666"});			$(".bank-r").animate({maxHeight:sclooTop});		}else {			$(this).html("展开更多银行");			$(this).css({background:'rgb(175, 58, 49)',border: "1px solid rgb(175, 58, 49)"});			$(".bank-r").animate({maxHeight:"114px"});		}	});});function selectBank(id, minAmount, maxAmount, ele) {	$("#txtMinAmount").html(minAmount);	$("#txtMaxAmount").html(maxAmount);	$("#initialMoney").css("display", "inline");	$("#chargeamount").removeAttr("disabled");	$(ele).parent().addClass('bankBorder').siblings().removeClass('bankBorder');	checkUnRecharge();}var checkMoney = function (obj) {	var me = obj, v = me.value, index;	me.value = v = v.replace(/^\.$/g, '');	index = v.indexOf('.');	if (index > 0) {		me.value = v = v.replace(/(.+\..*)(\.)/g, '$1');		if (v.substring(index + 1, v.length).length > 2) {			me.value = v = v.substring(0, v.indexOf(".") + 3);		}	}	me.value = v = v.replace(/[^\d|^\.]/g, '');	me.value = v = v.replace(/^00/g, '0');};var checkForm = function () {	if (!checkUnRecharge()) {		return false;	}	var bankNameId = $("#bankNameId:checked").val();	if (!bankNameId) {		alert("未选择银行卡");		return false;	}	var amount = $('#chargeamount').val();	if (!amount || amount <= 0) {		$("#errorSpan").html("请输入充值金额！");		return false;	}    console.log($("#txtMinAmountValid").val());	var minmoney = parseFloat($("#txtMinAmountValid").val());	var maxmoney = parseFloat($("#txtMaxAmountValid").val());	console.log('minmoney: ' + minmoney);    console.log('maxmoney: ' + maxmoney);	if ($.trim(amount) != "") {		if (parseFloat(amount) > maxmoney || parseFloat(amount) < minmoney) {			$("#errorSpan").html("充值限额：最低" + minmoney + "元，最高" + maxmoney + "元！");			return false;		} else {			$("#errorSpan").html("");			return true;		}	}	return false;};var checkFormAll = function () {	if (checkForm()) {		layer.open({			type: 1,			skin: 'lottTipLayer',			shift: 5,			area: ['480px', '260px'],			title: false,			content: $("#rechargePayBox"),			cancel: function () {				layer.closeAll();				window.location.reload(true);			}		});		return true;	}	return false;};function checkUnRecharge() {	if (!checkHadUnRecharge()) {		return false;	}	if (!checkHadNotSafePassword()) {		return false;	}	return true;}//填写充值金额显示大号字体提示function rechAmountShow(num) {	if (num) {		$('#rechAmountInfo').html(num).parent().show();	} else {		$('#rechAmountInfo').parent().hide();	}}//充值手续费function commissionCharge() {	var rate = $('#comChargeRate').text() / 100;	var amount = $('#chargeamount').val();	amount = amount == '' ? 0 : amount;	var commissionCharge = (amount * rate).toFixed(4);	if ((commissionCharge < 0.1) && (commissionCharge > 0)) {		commissionCharge = 0.1;	}	$('#actualAmount').text((amount - commissionCharge).toFixed(4));	$('#commissionCharge').text(commissionCharge);}