<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <title>徐州市住房保障管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/icon/iconfont.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/common.css">
    <script type="text/javascript" src="<%=basePath %>src/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/common.js"></script>
    <link href="<%=basePath %>src/img/public/favicon.ico" rel="shortcut icon" type="image/x-icon">
</head>
<body class="easyui-layout" id="registPanel">
    <div class="regNorth">徐州市住房保障管理系统</div>
    <span style="position: absolute;right: 30px;top: 20px;cursor: pointer">
        <a href="<%=basePath %>/pageColumn/external/h_index" style="color: #005BAC;font-size: 16px">返回</a>
    </span>
    <div class="regContanier">
        <div class="regLeft">
            <img src="<%=basePath %>src/img/login/building.jpg" alt="" style="width: 100%;height:530px">
        </div>
        <div class="regRight">
            <div class="regTitle"> 欢迎注册</div>
            <form class="changeForm" id="ff" method="post" >
                <div class="formItem">
                    <input class="easyui-textbox"  name="sfzh"   style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>身份证号:',required:true,validType:['empty','sfz']">
                </div>
                <div class="formItem">
                    <input class="easyui-textbox" id="userpwd"  name="userpwd" type="password"  style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>密码:',required:true,validType:['empty']">
                </div>
                <div class="formItem">
                    <input class="easyui-textbox"  type="password"  style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>确认密码:',required:true,validType:['equalTo[\'#userpwd\']','empty']">
                </div>
                <div class="formItem">
                    <input class="easyui-textbox"  name="username"  style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>用户姓名:',required:true,validType:['empty','chinese','specialCharacter']">
                </div>
                <div class="formItem">
                    <select class="easyui-combobox"  name="sex"  style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>性别:',required:true,editable:false,panelHeight:'auto'">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="formItem">
                    <input class="easyui-combobox" name="ssq" style="width: 82%" data-options="label:'所属区（县）:',required:true,valueField:'piItemcode',textField:'piItemname',
                    url:'<%=basePath %>ParmItem/selectSsqExceptCenter',onSelect:selectSSQ,editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                </div>
                <div class="formItem">
                    <input class="easyui-combobox" name="ssj" id="ssj" style="width: 82%" data-options="label:'街道办事处:',required:true,valueField:'piItemcode',textField:'piItemname',
                    editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                </div>
                <div class="formItem">
                    <input class="easyui-textbox" name="linktel"  id="linktel"  style="width: 82%" data-options="label:'<i style=\'color:red\'>* </i>手机号:',required:true,validType:['empty','phone']">
                </div>
                <div class="formItem">
                    <input class="easyui-textbox" name="checkcode" id="checkcode" style="width: 53%" data-options="label:'<i style=\'color:red\'>* </i>短信验证码:',required:true,validType:['empty']">
                    <a  class="code" style="display:inline-block;width: 116px;cursor: pointer;color: #ff6767;" onclick="sendCode()">获取验证码</a>
                </div>

                <div class="formItem">
                    <a class="state" style="width: 80px;color: red"></a>
                    <a class="query-btn submit" onclick="save()">保存</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
<style>
    .changeForm{
        width: 420px;
        padding-top:0;
    }
    .textbox-label{
        width: 100px;
    }
</style>
<script>
    var flag=true;
    function save(){
        bank.ajaxForm('#ff','<%=basePath %>applyUserinfo/insertUserInfo', {}, function(data){
            bank.ajaxMessage(data);
            if(data=="注册成功"){

                }else{
                flag=true;
                    $("#checkcode").textbox('setValue','');
                }
               $("#state").text(data);
               clearSession();//清空缓存
            });
    }
    var timer=null;
    //设置倒计时
    function setCode(){
            clearInterval(timer);
            var time=60;
            timer=setInterval(function(){
                if(time==0){
                    $(".code").html('获取验证码');
                    flag=true;
                    clearInterval(timer);//这句话至关重要
                    return false;
                }else {
                    flag=false;
                    time--;
                    $(".code").html(time+'秒后可重新获取');
                }
            },1000);
    }
    //发送验证码
    function sendCode(){
        if(flag){
            flag=false;
            var linktel=$.trim($("#linktel").textbox('getValue'));
            if(linktel.length==0){
                flag=true;
                bank.alertMessage("请输入手机号")
            }else{
                setCode();
                $.ajax({
                    url:'<%=basePath %>applyUserinfo/SendCode',
                    type:'post',
                    data:{
                        linktel:$.trim($("#linktel").textbox('getValue'))
                    },
                    success:function(data){
                       /* console.log(data);*/
                    },error:function(){
                        bank.alertMessage("数据库连接失败，请稍后再试")
                    }
                })
            }
        }
    }
    //清空后台session
    function clearSession(){
        $.ajax({
            url:'<%=basePath %>applyUserinfo/newSend',
            type:'post',
            data:null,
            success:function (data) {
                if(data=="刷新"){
                    clearInterval(timer);
                    $(".code").html('获取验证码');
                }
            },
            error:function () {
                bank.alertMessage("数据库连接失败，稍后再试");
            }
        })
    }
    //街区联动
    function selectSSQ(record){
        $("#ssj").combobox({
            url:'<%=basePath%>ParmItem/findAllJd',
            onBeforeLoad:function(param){
                param.qid=record.piItemcode;
            }
        });
    }
</script>
