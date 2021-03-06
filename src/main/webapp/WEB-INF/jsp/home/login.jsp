﻿<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>大順 - 登录</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"/>
	<meta http-equiv="expires" content="0"/>
	<link rel="icon" href="<c:url value='/res/home/images/favicon.ico'/>" type="image/x-icon"/>
	<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
	<link rel="stylesheet" href="<c:url value='/res/home/css/reset.css?ver=${VIEW_VERSION}'/>"/>
	<link rel="stylesheet" href="<c:url value='/res/home/css/wk-login.css?ver=${VIEW_VERSION}'/>"/>
	<script type="text/javascript"
			src="<c:url value='/res/home/js/jquery-1.11.0.min.js?ver=${VIEW_VERSION}'/>"></script>
	<script type="text/javascript" src="<c:url value='/res/home/js/jquery.timer.js?ver=${VIEW_VERSION}'/>"></script>
	<script type="text/javascript" src="<c:url value='/res/home/js/layer/layer.js?ver=${VIEW_VERSION}'/>"></script>
	<script type="text/javascript" src="<c:url value='/res/home/js/spinner.js?ver=${VIEW_VERSION}'/>"></script>
	<script type="text/javascript" src="<c:url value='/res/home/js/jquery.md5.js?ver=${VIEW_VERSION}'/>"></script>
	<%--     <script type="text/javascript" src="<c:url value='/res/home/js/cryptojs3.1.2/rollups/tripledes.js?ver=${VIEW_VERSION}'/>"></script> --%>
	<%--     <script type="text/javascript" src="<c:url value='/res/home/js/cryptojs3.1.2/components/mode-ecb.js?ver=${VIEW_VERSION}'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/res/home/js/base.js?ver=${VIEW_VERSION}'/>"></script>
	<%--     <script type="text/javascript" src="<c:url value='/res/home/js/base64.js?ver=${VIEW_VERSION}'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/res/home/js/login/login.js?ver=${VIEW_VERSION}'/>"></script>
</head>
<body>
<div class="main">
	<!--登录区域-->
	<div class="loginArea">
		<div class="loginLeft"></div>
		<div class="loginRight">
			<!-- 登录方式 -->
			<div class="loginMethod">
				<a href="javascript:;" class="loginBtn active">正常登录</a>
				<a href="javascript:;" class="safeLoginBtn">安全登录</a>
			</div>
			<!-- 正常登录 -->
			<form class="loginForm" action="<c:url value='/login' />" id="loginForm" method="post"
				  data-token="${token}">
				<div class="loginDetail">
					<input type="text" class="inputCont" placeholder="用户名" id="userName"/>
					<input type="hidden" name="account" id="account"/>
					<input type="hidden" name="password" id="password"/>
					<i class="userNameIcon"></i>
				</div>
				<div class="loginDetail">
					<input type="password" class="inputCont" id="userPassword" placeholder="密码" maxlength="16"/>
					<i class="userPasswordIcon"></i>
				</div>
				<c:if test="${code!=null}">
					<div class="loginDetail">
						<input type="text" class="inputCont" id="userCode" name="code" placeholder="验证码" maxlength="4"/>
						<i class="userCodeIcon"></i>
						<img src="<c:url value='/code.jpg'/>" id="verfiy" alt="验证码" class="userCodeImg"/>
					</div>
				</c:if>
				<div class="loginTips">
					<a href="javascript:void(0);" class="forgetPassword" onclick="forgetPassword()">忘记密码?</a>
					<a target="_blank" href="${sysService.link }" class="onlineServices"><i></i>联系客服</a>
				</div>
				<p class="errorTips">${msg }</p>
				<div class="loginBtnArea">
					<input type="submit" class="btn submitBtn" value="登录"/>
				</div>
				<input type="hidden" name="sid" value="${sid}"/>
				<input type="hidden" id="status" name="status" value="${status}"/>
			</form>
			<!-- 安全登录 -->
			<form class="safeLoginForm" id="safeLoginForm" style="display: none;">
				<input type="hidden" id="passwordToken" value="${token}"/>
				<div class="loginDetail">
					<input type="text" class="inputCont" name="account" id="safeUserName" placeholder="用户名"/>
					<i class="userNameIcon"></i>
				</div>
				<div class="loginDetail">
					<input type="text" class="inputCont" id="safeUserCode" name="code" placeholder="验证码" maxlength="4"/>
					<i class="userCodeIcon"></i>
					<img src="<c:url value='/code.jpg'/>" id="verfiy3" alt="验证码" class="userCodeImg"/>
				</div>
				<div class="loginDetail" id="cardName" style="display:none">
					<input type="text" class="inputCont" id="cardUserName" name="cardName" placeholder="银行卡用户名"
						   maxlength="50"/>
					<i class="userNameIcon"></i>
				</div>
				<p class="errorTips"></p>
				<div class="loginBtnArea">
					<input type="button" class="btn submitBtn" id="nextStep" value="下一步"/>
				</div>
			</form>
			<!-- 预留信息 -->
			<div class="safeLoginInfoForm" id="safeLoginInfoForm" style="display: none;">
				<div class="safeInfoDetail">
					<i></i>
					<p>
						<span>您的预留信息为：</span>
						<span class="safeInfo" id="safeInfo"></span>
					</p>
					<p><span>若“预留信息”与您设置不一致,请勿输入密码!</span></p>
				</div>
				<div class="loginDetail">
					<input type="password" class="inputCont" id="safeUserPwd" placeholder="密码" maxlength="16"/>
					<i class="userPasswordIcon"></i>
				</div>
				<div class="loginDetail">
					<input type="text" class="inputCont" id="safeUserCode4" name="code" placeholder="验证码"
						   maxlength="4"/>
					<i class="userCodeIcon"></i>
					<img src="<c:url value='/code.jpg'/>" id="verfiy4" alt="验证码" class="userCodeImg"/>
				</div>
				<div class="loginBtnArea">
					<input type="button" class="btn submitBtn" id="safeLogin" value="登录"/>
				</div>
			</div>
		</div>
	</div>
	<div class="findPwdMain" style="display:none;">
		<div class="findPwdHeader">
			<a class="logo" href="<c:url value='/login'/>">
				<img src="<c:url value='/res/home/images/download/logo.png'/>" alt="logo"/>
			</a>
			<a target="_blank" href="${sysService.link }" class="customerService"><i></i>在线客服</a>
		</div>
		<div class="findPwdArea">
			<div class="findPwdBox">
				<div class="findPwdHeader">
					<p class="findPwdTitle">找回登录密码</p>
					<a href="/login" class="findPwdReturn">返回</a>
				</div>
				<div class="findPwdContent">
					<div class="findPwdDetail">
						<span class="detailTitle">登录账号</span>
						<div class="loginDetail">
							<input type="text" class="findInput" id="findPwdName" placeholder="6-12位数字、字母"/>
							<i class="userNameIcon"></i>
						</div>
						<span class="errorWarn"></span>
					</div>
					<div class="findPwdDetail">
						<span class="detailTitle">安全密码</span>
						<div class="loginDetail">
							<input type="password" class="findInput" id="fundPwd" maxlength="6" placeholder="6位"/>
							<i class="userPasswordIcon"></i>
						</div>
						<span class="errorWarn"></span>
					</div>
				</div>
				<div class="findPwdContent">
					<div class="findPwdDetail">
						<span class="detailTitle">新的登录密码</span>
						<div class="loginDetail">
							<input type="password" class="findInput" id="newLoginPwd" maxlength="16"
								   placeholder="8-16位"/>
							<i class="userPasswordIcon"></i>
							<a href="javascript:;" class="showPwd"></a>
						</div>
						<span class="errorWarn"></span>
					</div>
					<div class="findPwdDetail">
						<span class="detailTitle">确认登录密码</span>
						<div class="loginDetail">
							<input type="password" class="findInput" id="againLoginPwd" maxlength="16"
								   placeholder="8-16位"/>
							<i class="userPasswordIcon"></i>
						</div>
						<span class="errorWarn"></span>
					</div>
				</div>
				<div class="findPwdContent">
					<div class="findPwdDetail">
						<span class="detailTitle">验证码</span>
						<div class="loginDetail">
							<input type="text" class="userCode findInput" id="findPwdCode" maxlength="4"/>
							<i class="userCodeIcon"></i>
							<img src="<c:url value='/code.jpg'/>" id="verfiy2" alt="验证码" class="userCodeImg"/>
						</div>
						<span class="errorWarn"></span>
					</div>
					<div class="findPwdDetail">
						<span class="detailTitle"></span>
						<div class="loginDetail">
							<input type="button" class="btn submitBtn" id="findMyPass" value="找回登录密码"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--底部-->
<%--<div class="footer">--%>
	<%--<div class="w920">--%>
		<%--<i class="logo"></i>--%>
		<%--<ul class="download">--%>
			<%--<li class="pc"><a href="javascript:;"><i></i>pc端下载</a></li>--%>
			<%--<li class="ios"><a href="javascript:;"><i></i>ios端下载</a></li>--%>
			<%--<li class="android"><a href="javascript:;"><i></i>安卓客户端下载</a></li>--%>
			<%--<li class="auto"><a href="javascript:;"><i></i>自动投注软件</a></li>--%>
		<%--</ul>--%>
		<%--<p>@大順 版权所有 2010-2030 copyright JF Techno Co.&nbsp;&nbsp;|&nbsp;&nbsp;<a class="dnsLink" href="/repairDNS"--%>
																				 <%--target="_blank">防劫持教程</a></p>--%>
	<%--</div>--%>
<%--</div>--%>
</body>
</html>