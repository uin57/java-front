<%@page contentType="text/html" pageEncoding="UTF-8" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html><html lang="en"><head>	<meta charset="UTF-8">	<meta http-equiv="Cache-Control" content="no-siteapp"/>	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0 user-scalable=no">	<meta content="yes" name="apple-mobile-web-app-capable">	<meta content="black" name="apple-mobile-web-app-status-bar-style">	<meta content="telephone=no" name="format-detection">	<meta content="email=no" name="format-detection">	<title>用户注册</title>	<link rel="stylesheet" href="/res/mobile/css/hs-mobile.css"/></head><body class="bodyColorEEE"><%@include file="/WEB-INF/jsp/mobile/left.jsp" %><!-- 注册用户 --><div class="generalPlatArea registerUserArea">	<div class="registerHeaderBox">		<div class="logo">			<!--<img src="<c:url value='/res/mobile/images/logo-leaf.png'/>" />-->		</div>		<p class="loginDetail">			<span>已有帐号，</span>			<a href="/login" class="login">立即登入</a>		</p>	</div>	<div class="container">		<form class="registerUserBox">			<div class="regListDetail">				<span class="regListTitle">用户名</span>				<input type="text" name="userName" id="account" class="labelCond" placeholder="字母开头6-12位数字、字母"/>			</div>			<input type="hidden" name="extcode" id="extcode" value="${extcode}"/>			<div class="regListDetail">				<span class="regListTitle">密码</span>				<input type="text" name="password" class="labelCond" placeholder="默认登录密码：aa123456" disabled/>			</div>			<div class="regListDetail">				<span class="regListTitle">验证码</span>				<input type="text" name="code" class="labelCond" id="verifyCode" maxlength="4" placeholder="点击验证码刷新"/>				<img src="<c:url value='/code.jpg'/>" alt="验证码" class="userCodeImg" id="verify"/>			</div>			<div class="agreeProtocolInfo">				<label for="agreePro">					<input type="checkbox" name="agreePro" class="agreePro" id="agreePro" style="display:none;"						   checked/>					<i class="agreeProCheck"></i>					<span>我同意“大順交易协定”且年龄到达18周岁</span>				</label>			</div>			<div class="btnGroup">				<button type="button" class="btn btnRed" onclick="doRegist()">立即注册</button>			</div>		</form>		<p class="regTips">注册成功后，用户可登录大順所有产品，如：大順计划软件，大順收益软件等。</p>		<!--<img src="<c:url value='/res/mobile/images/regLogin-sol.png'/>" class="regSloganImg" alt="选择大順 选择发财" />-->	</div></div><!-- 弹窗 --><div id="mask" class="mask" style="display: none;"></div><div class="dialogArea" id="dialogBox"></div><script type="text/javascript" src="<c:url value='/res/home/js/spinner.js?ver=${VIEW_VERSION}'/>"></script><script type="text/javascript" src="<c:url value='/res/mobile/js/user/register.js?ver=${VIEW_VERSION}'/>"></script></body></html>