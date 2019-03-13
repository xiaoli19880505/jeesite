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
    <title>系统管理-我的申请</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>thiemesApply/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApply/css/common.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/icon/iconfont.css">
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/common.js"></script>
</head>
<body class="easyui-layout">
<div data-options="region:'center',border:false">
    <div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
        <div class="abtn-group btnInner">
            <a class="icon iconfont icon-icon-refresh green" onclick="bank.tbReload('dataTable')"><i>刷新</i></a>
            <a class="icon iconfont icon-chuangkouhua" onclick="bank.openWindow()"><i>新窗口打开</i></a>
            <a class="icon iconfont icon-guanbi red" onclick="bank.closeCurrent()"><i>关闭</i></a>
        </div>
        <table id="dataTable" class="easyui-datagrid resTable" style="height: 90%;min-height: 300px"
               data-options="url:'<%=basePath %>appove/findApplyByUserSfzh',singleSelect:true,rownumbers:true,pagination:true,border:true,striped:true,
                       pagePosition:'bottom',pageSize:20,nowrap:true">
            <thead>
            <tr>
                <th data-options="field:'aptype',width:120,align:'center',halign:'center'">申请类型</th>
                <th data-options="field:'aplbh',width:150,align:'center'">申请编号</th>
                <th data-options="field:'apldate',width:100,align:'center'">申请日期</th>
                <th data-options="field:'username',width:100,align:'center'">申请人</th>
                <th data-options="field:'sfzh',width:200,align:'center'">身份证号</th>
                <th data-options="field:'ssq',width:100,align:'center'">所属县区</th>
                <th data-options="field:'ssj',width:100,align:'center'">所属街道</th>
                <th data-options="field:'state',width:100,align:'center',formatter:convertState">审批状态</th>
                <th data-options="field:'processinstancename',width:100,align:'center'">审核节点</th>
                <th data-options="field:'essetNature',width:200,align:'center',formatter:operate">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
</body>
</html>
<script>


    
    function operate(value,row,index) {
       var state = row.state;
       var apptype = row.atype;
       var aplid = row.aplid;
       var bool = state.indexOf('打回修改');

        if(bool!=-1){
           return '<a class="agreen" onclick="auditOpinion(\''+apptype+'\',\''+aplid +'\')">修改</a>'
               +'<a class="ablue" onclick="queryDetail(\''+apptype+'\',\''+aplid +'\')">查看</a>';
       }else{
           return '<a class="ablue" onclick="queryDetail(\''+apptype+'\',\''+aplid +'\')">查看</a>';
       }
    }

    function  convertState(value,row,index) {
        if(value=='' || value==null){
            return "审核中";
        }else if(value.indexOf("审批通过")!=-1){
            return "审核中";
        }else{
            return value;
        }
    }
    function auditOpinion(apptype,aplid){
        var a = $('<a href="<%=basePath %>task/toApplyUpdate?applyType='+ apptype+'&applyId='+aplid+'#true" target="_blank"></a>')[0];
        var e = document.createEvent('MouseEvents');
        e.initEvent('click', true, true);
        a.dispatchEvent(e);
    }
    function queryDetail(apptype,aplid){
        var a = $('<a href="<%=basePath %>task/toApprove?applyType='+apptype+'&applyId='+aplid+'&chengxin=chengxin#true" target="_blank"></a>')[0];
        var e = document.createEvent('MouseEvents');
        e.initEvent('click', true, true);
        a.dispatchEvent(e);
    }
    function applyType(value,row,index) {
        return row.applyType.piItemname;
    }
    function name(value,row,index) {
        return row.applyUserinfo.username;
    }
    function sfzh(value,row,index) {
        return row.applyUserinfo.sfzh;
    }
    function ssq(value,row,index) {
        return row.applyUserinfo.parmItemssq.piItemname;
    }
   function ssjd(value,row,index) {
        return row.applyUserinfo.parmItemssjd.piItemname;
    }
    function processinstanceid(value,row,index) {
        return row.processinstanceid;
    }
    $(function () {
        $("#dataTable").datagrid("reload");
    })
</script>
