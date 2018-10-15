<%@page contentType="text/html" pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta http-equiv="Cache-Control" content="no-siteapp" /><meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0 user-scalable=no"><meta content="yes" name="apple-mobile-web-app-capable"><meta content="black" name="apple-mobile-web-app-status-bar-style"><meta content="telephone=no" name="format-detection"><meta content="email=no" name="format-detection"><title>绑定银行卡</title><link rel="stylesheet" href="<c:url value='/res/mobile/css/hs-mobile.css?ver=${VIEW_VERSION}'/>" /></head><body class="bodyColorEEE"><%@include file="/WEB-INF/jsp/mobile/left.jsp" %><script type="text/javascript" src="<c:url value='/res/home/js/spinner.js?ver=${VIEW_VERSION}'/>"></script><script type="text/javascript" src="<c:url value='/res/mobile/js/user/bindCard.js?ver=${VIEW_VERSION}'/>"></script>	<!-- 绑定银行卡 -->	<div class="generalPlatArea bindCardArea">		<div class="mainNav">			<a href="javascript:;" class="mainMenuBtn">                <img src="<c:url value='/res/mobile/images/mainMenuIcon.png'/>" class="mainMenuIcon" />			</a>            <span class="headerTitle">绑定银行卡</span>		</div>		<div class="container">		            <!-- 历史银行卡验证 -->            <div class="historyCardVerify" style="display: none;">                <div class="listForm">                    <form id="verifyCard">                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>选择验证银行卡：</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <div class="labelCondSelect">                                <select class="labelCond" name="id" id="selectHistoryCard"></select>                                <i class="selectIcon"></i>                            </div>                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>开户人姓名：</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <input type="text" class="labelCond" name="oldNiceName" />                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>银行账号：</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <input type="tel" class="labelCond" name="oldCard" maxLength=19 onkeyup="inputNumber(this)" />                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>安全密码：</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <input type="password" class="labelCond" id="safeWord" name="safeWord" />                        </div>                        <div class="btnGroup">                            <a href="javascript:;" class="btn btnRed" onclick="checkOldCard()" readonly>下一步</a>                            <a href="javascript:;" class="btn backPrev" onclick="$('.container>div').hide();$('.bankCardListBox').show();" readonly>返回</a>                        </div>                    </form>                </div>            </div>					<div class="bindCardListBox" style="display: none;">				<div class="listForm">                    <form id="newBindCard">                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>开户银行</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <div class="labelCondSelect">                                <select name="bankNameId" id="selectBank" class="labelCond"></select>                                <i class="selectIcon"></i>                            </div>                        </div>                        <div class="listDetail selectNum2">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i> <span>开户银行省市</span> <span                                    class="mustWhiteStar">*</span>                            </p>                            <div class="labelCondSelect">                                <select name="selectProvince" class="labelCond" id="selectProvince"></select>                                <i class="selectIcon"></i>                            </div>                            <div class="labelCondSelect">                                <select name="selectCity" class="labelCond" id="selectCity"></select>                                <i class="selectIcon"></i>                            </div>                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i> <span>支行名称</span> <span                                    class="mustWhiteStar">*</span>                            </p>                            <input type="text" class="labelCond" id="address" name="address" placeholder="由1至20个字符或汉字组成，不能使用特殊字符" />                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i>                                <span>开户人姓名</span>                                <span class="mustWhiteStar">*</span>                            </p>                            <input type="text" class="labelCond" id="niceName" name="niceName" placeholder="由1至10个字符或汉字组成，不能使用特殊字符" />                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i> <span>银行账号</span> <span                                    class="mustWhiteStar">*</span>                            </p>                            <input type="tel" class="labelCond" id="card1" maxLength=19 onkeyup="inputNumber(this)" placeholder="银行卡账号由16位、18位或19位数字组成" />                        </div>                        <div class="listDetail">                            <p class="detailTitle fontColorYellow">                                <i class="detailTitleLeft"></i> <span>确认银行账号</span> <span                                    class="mustWhiteStar">*</span>                            </p>                            <input type="tel" class="labelCond" name="card" onkeyup="inputNumber(this)" id="card" maxLength=19 onpaste="return false;" placeholder="银行账号只能手动输入，不能粘贴" />                        </div>					</form>				</div>				<div class="btnGroup">					<a href="javascript:BindCardconfirm();" class="btn btnRed">下一步</a>				</div>			</div>			<div class="bindCardAfmInfoBox" style="display: none;">				<div class="listForm">					<p class="detailTitle fontColorYellow">						<i class="detailTitleLeft"></i> <span>绑定银行卡-信息确认</span>					</p>					<div class="bindAfmInfoContent">						<table class="bindAfmInfoTable">							<tr>								<th>绑定银行：</th>								<td>中国工商银行</td>							</tr>							<tr>								<th>开户行省份：</th>								<td>云南</td>							</tr>							<tr>								<th>开户行城市：</th>								<td>丽江</td>							</tr>							<tr>								<th>支行名称：</th>								<td>丽江支行</td>							</tr>							<tr>								<th>开户人姓名：</th>								<td>杨洋</td>							</tr>							<tr>								<th>银行账户：</th>								<td>6222 5209 1210 7600 886</td>							</tr>						</table>					</div>				</div>				<div class="btnGroup">					<a href="javascript:backup();" class="btn backPrev">返回</a> <a						href="javascript:doBindCard();" class="btn btnRed">提交</a>				</div>			</div>			<div class="bankCardListBox">				<ul class="bankCardList"><!-- 					<li class="bankCardDetail"><img src="/res/mobile/images/bank/ccb.png" class="bankIcon" alt="" /> --><!-- 						<div class="bankCardInfo"> --><!-- 							<p>杨**</p> --><!-- 							<p class="fontColorGray">中国建设银行 6222************123</p> --><!-- 						</div></li> --><!-- 					<li class="bankCardDetail"><img --><!-- 						src="/res/mobile/images/bank/ccb.png" class="bankIcon" alt="" /> --><!-- 						<div class="bankCardInfo"> --><!-- 							<p>杨**</p> --><!-- 							<p class="fontColorGray">中国建设银行 6222************123</p> --><!-- 						</div></li> -->				</ul>				<div class="affirmInfoTips">					<p>						<span>您还可以绑定</span> <span class="fontColorRed" id="bindedBankCardNum"></span> <span>张银行卡</span>					</p>				</div>				<div class="btnGroup">					<a href="javascript:void(0);" id="bindNewCard" class="btn btnRed">绑定新卡</a>				</div>			</div>						<div class="verifySafePassword listForm" style="display: none;">				 <div class="listDetail">					<p class="detailTitle fontColorYellow">						<i class="detailTitleLeft"></i>						<span>安全密码</span>					</p>					<input type="password" id="safePassword" name="safePassword" class="labelCond" />				 </div>				 <div class="btnGroup">				 	<input class="btn btnRed" type="button" value="提交" onClick="verifySafePassword()"/>				 </div>			</div>		</div>	</div><c:set var="needSetSafePassword" value="${user.safePassword == null }" scope="request"></c:set><c:import url="../recharge/rechargeSafePassword.jsp"></c:import><script type="text/javascript">function showDiv(id) {	$("#" + id).show();}</script><!-- 弹窗 --><div id="mask" class="mask" style="display: none;"></div><div class="dialogArea" id="dialogBox"></div></body></html>