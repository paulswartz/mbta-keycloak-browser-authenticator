<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
	<link href="${url.resourcesPath}/css/stylesheet.css" rel="stylesheet" />
</head>

<body>
      <div class="page-content">
		<img id="logo" src="${url.resourcesPath}/img/MBTA_logo_text.svg" alt="MBTA logo">
		<div class="container">
            
	          <#-- App-initiated actions should not see warning messages about the need to complete the action -->
	          <#-- during login.                                                                               -->
	          <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
	              <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
	                  <div class="pf-c-alert__icon">
	                      <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
	                      <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
	                      <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
	                      <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
	                  </div>
	                      <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
	              </div>
	          </#if>
	
			<#nested "form">
	
			<#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
				<form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
					<div class="form-group submit-group">
						<input type="hidden" name="tryAnotherWay" value="on"/>
						<a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;" class="back-link">${msg("doTryAnotherWay")}</a>
					</div>
				</form>
			</#if>
	
			<#if displayInfo>
				<#nested "info">
			</#if>
		</div>
      </div>

</body>
</html>
</#macro>
