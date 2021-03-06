<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="KMani Zoro">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html;">
<title><spring:message code="ui.login.request.page.title" /></title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="128x128" href="res/img/note_pin.ico">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="apple-touch-icon-precomposed" href="res/img/osx_pin.icns">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage" content="res/img/128_pin.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="res/img/128_pin.png">

<link rel="stylesheet" href="res/css/material.min.css">
<link rel="stylesheet" href="res/css/material.icon.css">
<link rel="stylesheet" href="res/css/style.css">
</head>

<body ng-app="login-app">

	<c:set var="lang_value" value="ta" />
	<c:if test="${pageContext.response.locale == 'ta'}">
		<c:set var="lang_value" value="en" />
	</c:if>
	<div
		class="request-layout login-layout mdl-layout mdl-js-layout mdl-color--grey-100 mdl-shadow--16dp">
		<main class="login-layout_content mdl-layout__content">
		<c:choose>
			<c:when test="${not empty forgotPass && forgotPass == 'forgotPass'}">
				<form action="forgotpassword" method="POST" autocomplete="off">
			</c:when>
			<c:otherwise>
				<form action="requestemailverify" method="POST" autocomplete="off">
			</c:otherwise>
		</c:choose>
			<div class="mdl-card mdl-shadow--6dp">
				<div
					class="mdl-card__title mdl-color--light-blue mdl-color-text--white">
					<h4 class="mdl-card__title-text">
						<c:choose>
							<c:when test="${not empty forgotPass && forgotPass == 'forgotPass'}">
								<spring:message code="ui.login.request.label.title.password" />
							</c:when>
							<c:otherwise>
								<spring:message code="ui.login.request.label.title.emailverify" />
							</c:otherwise>
						</c:choose>
					</h4>
				</div>
				<div class="mdl-card__supporting-text">
					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
						<input type="email" class="mdl-textfield__input"
							ng-model="usremail" id="useremail" ng-change="checkform()"
							name='usremail' required> <label
							class="mdl-textfield__label" for="useremail"> <spring:message
								code="ui.login.label.useremail" />
						</label>
					</div>
					<div ng-controller="lang-controller" class="input-group input-sm">
					<c:choose>
						<c:when test="${pageContext.response.locale == 'ta'}">
							<label class="mdl-switch mdl-js-switch mdl-js-ripple-effect is-checked" for="switch-1">
								<input type="checkbox" id="switch-1" ng-click="goToLogin('${lang_value}')" class="mdl-switch__input" checked>
								<span class="mdl-switch__label"><spring:message code="ui.login.label.lang.english" /></span>
							</label>	
						</c:when>
					</c:choose>
					</div>
					
					<br>
					<div class="input-group input-sm">
					<c:choose>
						<c:when test="${not empty forgotPass && forgotPass == 'forgotPass'}">
							<a href="requestemailverify"
								class="mdl-color-text--blue-600">
								<spring:message code="ui.login.button.label.request.emailverify" />
							</a>
						</c:when>
						<c:otherwise>
							<a href="forgotpassword"
								class="mdl-color-text--blue-600 ">
								<spring:message code="ui.login.button.label.request.password" />
							</a>
						</c:otherwise>
					</c:choose>
					</div>
					<br>	
					<div class="input-group input-sm">
						<a href="login"
								class="mdl-color-text--blue-600 ">
								<spring:message code="ui.login.button.login" />
							</a>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</div>

				<div class="mdl-card__actions mdl-card--border">
					<c:choose>
						<c:when test="${not empty forgotPass && forgotPass == 'forgotPass'}">
							&nbsp;&nbsp;&nbsp;
							<button type="submit"
								class="mdl-button mdl-button--colored mdl-color--blue-600 mdl-color-text--white mdl-js-button mdl-js-ripple-effect">
								<spring:message code="ui.login.button.label.request.password" />
							</button>
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;&nbsp;
							<button type="submit"
								class="mdl-button mdl-button--colored mdl-color--blue-600 mdl-color-text--white mdl-js-button mdl-js-ripple-effect">
								<spring:message code="ui.login.button.label.request.emailverify" />
							</button>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
		</form>

		<div id="msgSnackBar" class="mdl-js-snackbar mdl-snackbar">
			<div class="mdl-snackbar__text"></div>
			<button id="msgSnackBarBtn" class="mdl-snackbar__action" type="button"></button>
		</div>
		<c:if test="${not empty MSG_ERR && MSG_ERR != ''}">
			<input type="hidden" id="MSG_ERR" value='<c:out value="${MSG_ERR}"/>'>
		</c:if>
		<c:if test="${not empty Success && Success != ''}">
			<input type="hidden" id="SuccessId" value='<c:out value="${Success}"/>'>
		</c:if>
		</main>
	</div>
	<script type="text/javascript" src="res/js/funs.js"></script>
	<script type="text/javascript" src="res/js/material.min.js"></script>
	<script type="text/javascript" src="res/js/angular.min.js"></script>
	<script type="text/javascript" src="res/js/login.js"></script>
</body>
</html>