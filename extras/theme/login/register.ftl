<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    	<h1>${msg("registerTitle")}</h1>
        <form action="${url.registrationAction}" method="post">
            <div class="form-group">
                    <label for="firstName" class="form-input-label<#if messagesPerField.existsError('firstName')> label-error</#if>">${msg("firstName")}</label>
                    <input type="text" id="firstName" class="form-input<#if messagesPerField.existsError('firstName')> input-error</#if>" name="firstName"
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
            </div>

            <div class="form-group">
                    <label for="lastName" class="form-input-label<#if messagesPerField.existsError('lastName')> label-error</#if>">${msg("lastName")}</label>
                    <input type="text" id="lastName" class="form-input<#if messagesPerField.existsError('lastName')> input-error</#if>" name="lastName"
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />

                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastname" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
            </div>

            <div class="form-group">
                    <label for="email" class="form-input-label<#if messagesPerField.existsError('email')> label-error</#if>">${msg("email")}</label>
                    <input type="text" id="email" class="form-input<#if messagesPerField.existsError('email')> input-error</#if>" name="email"
                           value="${(register.formData.email!'')}" autocomplete="email"
                           aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />

                    <#if messagesPerField.existsError('email')>
                        <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </span>
                    </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                        <label for="username" class="form-input-label<#if messagesPerField.existsError('username')> label-error</#if>">${msg("username")}</label>
                        <input type="text" id="username" class="form-input<#if messagesPerField.existsError('username')> input-error</#if>" name="username"
                               value="${(register.formData.username!'')}" autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                        />

                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="form-group">
                        <label for="password" class="form-input-label<#if messagesPerField.existsError('password')> label-error</#if>">${msg("password")}</label>
                        <input type="password" id="password" class="form-input<#if messagesPerField.existsError('password')> input-error</#if>" name="password"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                </div>

                <div class="form-group">
                        <label for="password-confirm" class="form-input-label<#if messagesPerField.existsError('password-confirm')> label-error</#if>">${msg("passwordConfirm")}</label>
                        <input type="password" id="password-confirm" class="form-input<#if messagesPerField.existsError('password-confirm')> input-error</#if>"
                               name="password-confirm"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />

                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                </div>
            </#if>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            
            <div class="form-group submit-group">
				<a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a>
				<input type="submit" value="${msg("doRegister")}" id="submit"/>
			</div>
        </form>
    </#if>
</@layout.registrationLayout>