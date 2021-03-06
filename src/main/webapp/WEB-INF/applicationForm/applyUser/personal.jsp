<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <title>系统管理-个人信息</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>thiemesApply/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApply/css/common.css">
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/common.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:'false'">
    <form class="changeForm" method="post" id="changeForm">
        <div class="formItem readonly" >
            <input class="easyui-textbox" value="${applyUserinfo.username}" name="username" style="width: 92%" data-options="label:'姓名:',readonly:true">
        </div>
        <div class="formItem readonly">
            <input class="easyui-textbox" value="${applyUserinfo.sex}" name="sex"  style="width: 92%" data-options="label:'性别:',readonly:true">
        </div>
        <div class="formItem">
            <input class="easyui-textbox" value="${applyUserinfo.linktel}" id="linktel" name="linktel"  style="width: 92%" data-options="label:'手机号:',required:true,validType:['phone','empty']">
        </div>
        <div class="formItem">
            <input class="easyui-textbox" name="checkcode" id="checkcode" style="width: 60%" data-options="label:'<i style=\'color:red\'>* </i>短信验证码:',required:true,validType:['empty']">
            <a  class="code" style="display:inline-block;width: 116px;cursor: pointer;color: #ff6767;" onclick="sendCode()">获取验证码</a>
        </div>
        <div class="formItem readonly">
            <input class="easyui-textbox" value="${applyUserinfo.sfzh}"  name="sfzh" style="width: 92%" data-options="label:'身份证号:',readonly:true">
        </div>
        <%--<div class="formItem  ssq">
            <input  class="easyui-combobox" name="ssq" id="ssq" style="width: 92%" data-options="label:'<i style=\'color:red\'>* </i>所属区县:',required:true,editable:false,panelHeight:'auto',panelMaxHeight:350,
            valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=05',onChange:change">
        </div>
        <div class="formItem ssq">
            <input   class="easyui-combobox" name="ssj" id="ssj" style="width: 92%" data-options="required:true,label:'<i style=\'color:red\'>* </i>所属街道:',editable:false,panelHeight:'auto',panelMaxHeight:350,
            valueField:'piItemcode',textField:'piItemname'">
        </div>
        <div class="formItem">
            <input class="easyui-textbox" value="${applyUserinfo.address}"  name="address"  style="width: 92%;height:60px" data-options="label:'家庭住址:',multiline:true,required:true">
        </div>--%>
        <div class="formItem">
            <a class="query-btn submit" style="margin-left: 80px" onclick="save()">保存</a>
        </div>
    </form>
</div>
</body>
<style>
    .textbox-label {
        width: 90px !important;
    }
</style>
</html>
<script>
    var flag=true;
    $(function(){
        var flag="${flag}";
        //回填 判断
        $("#ssq").combobox('setValue',${applyUserinfo.parmItemssq.piItemcode});
         if(flag=="0"){
             //设置可修改
             $("#ssj").combobox('setValue',{'piItemcode':"${applyUserinfo.parmItemssjd.piItemcode}",'piItemname':"${applyUserinfo.parmItemssjd.piItemname}"});
         }else{
             $("#ssj").combobox('setValue',{'piItemcode':"${applyUserinfo.parmItemssjd.piItemcode}",'piItemname':"${applyUserinfo.parmItemssjd.piItemname}"});
             $("#ssq").combobox('readonly',true);
             $("#ssj").combobox('readonly',true);
             $(".ssq").addClass('readonly');
         }
    });
    //联动查询
    function change(){
        var piItemcode=$("#ssq").combobox('getValue');
        $('#ssj').combobox('clear');
        $('#ssj').combobox('reload','<%=basePath %>ParmItem/findAllJd?qid='+piItemcode+'');
    }
    function save(){
        bank.ajaxForm('#changeForm','<%=basePath %>applyUserinfo/updateUserInfo',{},function(data){
          bank.ajaxMessage(data);
            clearSession();
        });
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

</script>

