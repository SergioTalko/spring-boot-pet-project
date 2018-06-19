<#macro login path isRegisterForm>
<form action="${path}" method="post">


    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name : </label>
        <div class="col-sm-6">
            <input type="text"
                   value="<#if user??>${user.username}</#if>"
                   name="username"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="User name"/>
              <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
              </#if>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password: </label>
        <div class="col-sm-6">
            <input type="password"
                   name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password"/>
         <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
         </#if>
        </div>
    </div>

    <#if isRegisterForm>
     <div class="form-group row">
         <label class="col-sm-2 col-form-label"> Password: </label>
         <div class="col-sm-6">
             <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                    placeholder="Retype password"/>
         <#if password2Error??>
                <div class="invalid-feedback">
                    ${password2Error}
                </div>
         </#if>
         </div>
     </div>

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Email </label>
        <div class="col-sm-6 ">
            <input type="email" value="<#if user??>${user.email}</#if>" name="email"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="some@some.com"/>
         <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
         </#if>
        </div>
    </div>

    <div class="col-sm-6 ">
        <div class="g-recaptcha" data-sitekey="6LfPYV4UAAAAAM_DVLOT0_fPKih0L3nQJkwpbvuM"></div>
     <#if captchaError??>
       <div class="alert alert-danger" role="alert">
           ${captchaError}
       </div>
     </#if>
    </div>
    </#if>

    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
<#if !isRegisterForm><a href="/registration">Add User</a></#if>
    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
</form>
</#macro>


<#macro logout>

    <#if Session.SPRING_SECURITY_CONTEXT??>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button class="btn btn-primary" type="submit" value="Sign Out">Sign Out</button>
        </form>

    <#--TODO check    -->
    <#else>
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <a class="btn btn-primary" href="/login">Login</a>
    </#if>
</#macro>