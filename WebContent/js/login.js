function keyLogin(event) {

    var browser = navigator.appName;
    var userAgent = navigator.userAgent;
    var code;
    if(browser.indexOf('Internet')>-1) //IE
    code = window.event.keyCode;
    else if(userAgent.indexOf("Firefox")>-1)  //火狐
    code = event.which;
    else  //其它浏览器
    code = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;

    if ( code == 13)  //按Enter键的键值为13
        document.getElementById("btn_login").click();  //调用登录按钮的登录事件
}//网上找的，兼容回车事件https://www.cnblogs.com/taofx/p/4139391.html


window.onload = function () {
    var btn_login = document.getElementById('btn_login');
  
    btn_login.onclick = function login() {

        var username = document.getElementById("username");
        var pass = document.getElementById("password");

        if (username.value == "") {

            alert("请输入用户名");

        } else if (pass.value == "") {

            alert("请输入密码");

           
        } else {

        	window.location.href = "LoginServlet";

        }
    }

   
}


