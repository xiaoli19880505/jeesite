<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout">
<div data-options="region:'north',border:false" style="overflow: hidden" id="publicNorth">
	<div class="easyui-panel" style="width: 100%;overflow: hidden">
		<form id="queryForm">
			<ul class="search-group">
				<li><input class="easyui-textbox" name="applyUserinfo.username" id="username" style="width: 92%" data-options="label:'申请人:'"></li>
				<li><input class="easyui-textbox" name="applyUserinfo.sfzh" id="sfzh" style="width: 92%" data-options="label:'身份证号:'"></li>
				<li class="readonly ssq">
					<input class="easyui-combobox" name="ssq" id="ssq" style="width: 92%" data-options="label:'所属县区:',panelHeight:'auto',panelMaxHeight:400,
					editable:false,valueField:'piItemcode',textField:'piItemname',onSelect:select">
				</li>
				<li>
					<select class="easyui-combobox" name="ssjd" id="ssjd" style="width: 92%" data-options="label:'所属街道:',panelHeight:'auto',panelMaxHeight:400,
					editable:false,valueField:'piItemcode',textField:'piItemname'"></select>
				</li>
				<li class="query-btn">
					<a class="icon iconfont icon-sousuo" onclick="query()"><i>查&nbsp;询</i></a>
				</li>
				<li class="query-btn reset" >
					<a class="icon iconfont icon-zhongzhi " onclick="bank.clearForm('queryForm')"><i>重&nbsp;置</i></a>
				</li>
			</ul>
		</form>
	</div>
</div>
<div data-options="region:'center',border:false">
	<div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
		<table id="dataTable" class="easyui-datagrid resTable" style="height: 100%;min-height: 300px"
			   data-options="url:'<%=basePath%>applyForForegin/selectApplyForForegin',singleSelect:true,rownumbers:true,pagination:true,border:true,striped:true,
                       pagePosition:'bottom',pageSize:20,nowrap:true,fitColumns:true">
			<thead>
			<tr>
				<th data-options="field:'affSqbh',width:150,align:'center',halign:'center'">申请编号</th>
				<%--<th data-options="field:'approve',width:200,align:'center',halign:'center',formatter:applicationDate">申请日期</th>--%>
				<th data-options="field:'purchaser_name',width:100,align:'center',halign:'center',formatter:applicationPerson">申请人</th>
				<th data-options="field:'purchaseDate',width:150,align:'center',halign:'center', formatter:applicationSfzh">身份证号</th>
				<th data-options="field:'ssqStr',width:100,align:'center',halign:'center'">所属县区</th>
				<th data-options="field:'ssjStr',width:100,align:'center',halign:'center'">所属街道</th>
				<th data-options="field:'cZtName',width:100,align:'center',halign:'center',formatter:cZtName">备案状态</th>
				<th data-options="field:'operate',width:200,align:'center',halign:'center',formatter:operate">合同签订</th>
			</tr>
			</thead>
		</table>
	</div>
</div>
</body>
<script>
    function operate(value,row,index) {
        var appid = row.affId;
        var affLc = row.affLc;
        var cType = "";
        if(row.contractDetail == undefined){
            cType = 1;
        }else if(row.contractDetail != undefined && row.contractDetail.cType == ""){
            cType = 1;
        }else if(row.contractDetail != undefined && row.contractDetail.cType != ""){
            cType = row.contractDetail.cType;
        }
        if(cType == 1){
            if(affLc == 4){
                return ' <a class="agreen" onclick="infoEntry(\''+appid+'\',\''+cType+'\')">合同信息录入</a>'
            }else if(affLc == 5){
                return '<a class="ablue" onclick="downLoad(\''+ appid + '\')">立即下载</a>';
            }
        }else if(cType == 2){
            return  '<a class="ablue" onclick="downLoad(\''+ appid + '\')">立即下载</a>';
        }else{
            return "";
        }
    }
    function cZtName(val,row){
        var cType = "";
        if(row.contractDetail == undefined || row.contractDetail == ""){
            cType = 1;
        }else if(row.contractDetail != undefined && row.contractDetail.cType == ""){
            cType = 1;
        }else if(row.contractDetail != undefined && row.contractDetail.cType != ""){
            cType = row.contractDetail.cType;
        }
        if(cType == 3 || cType == 4){
            return "老数据"
        } else {
            return row.cZtName
        }
    }
    function applicationPerson(val,row){
        return row.applyUserinfo.username;
    }
    function applicationSfzh(val,row){
        return row.applyUserinfo.sfzh;
    }
    //查询
    function query(){
        $("#dataTable").datagrid('load',{
            username :$.trim($("#username").val()),
            sfzh:$.trim($("#sfzh").val()),
            ssq:$.trim($("#ssq").val()),
            ssj:$('input[name="ssjd"]').val()
        })
    }
    //为街道和街区默认赋值
    $(function () {
        var ssqId = "${sessionScope.user.parmItemssq.piItemcode}";
        var ssqname = "${sessionScope.user.parmItemssq.piItemname}";
        var ssjId = "${sessionScope.user.ssj}";
        var ssjText = "${sessionScope.user.parmItemssjd.piItemname}";
        if(ssqId=="0"){//市区，去掉市区，改为下拉
            $("#ssq").combobox({
                url:'<%=basePath %>ParmItem/getOptions?parmSetcode=05',
                onLoadSuccess:function(){
                    var datas=$("#ssq").combobox('getData');
                    if(datas[0].piItemcode=="0"){
                        datas.splice(0,1);
                        $("#ssq").combobox('loadData',datas);
                        $(".ssq").removeClass('readonly');
                        $("#ssq").combobox('setValue',datas[0]);
                    }
                }
            });
        }else{//非市区，readonly
            $("#ssq").combobox("setValue",{piItemcode:ssqId,piItemname:ssqname});
            $("#ssq").combobox("readonly",true);
            if($.trim(ssjId).length==0){
                select($("#ssq").combobox("getValue"));
            }
        }
        if($.trim(ssjId).length!=0){
            $("#ssjd").combobox('setValue',{piItemcode:ssjId,piItemname:ssjText})
        }

    });
    function select(record){
        var qid = record.piItemcode;
        if(qid==undefined){
            qid=record;
        }
        $("#ssjd").combobox({
            url:'<%=basePath%>ParmItem/findAllJd',
            onBeforeLoad:function(param){
                param.qid=qid;
            }
        });
    }
    //信息录入
	function infoEntry(appid,cType) {
        $.ajax({
            type:"post",
            url:"<%=basePath %>contractTemplate/getFactMappings",
            async:false,
            data:{
                apSqlb:4,
                objId:appid,
                cType:cType
            },
            dataType:'json',
            success:function (data) {
                flag = data.flag;
                msg = data.msg;
                //信息存入
                var data={objId:data.objId,apSqlb:data.apSqlb};
                bank.biography().setParams({row:data,title:'idData'});
                if(flag == true && msg == 'success'){
                    //直接跳转
                    $.ajax({
                        type:"post",
                        url:"<%=basePath %>contractTemplate/toPath",
                        async:false,
                        data:{
                            apSqlb:4,
                            objId:appid
                        },
                        dataType:'json',
                        success:function (datas) {
                            var path=$.trim(datas.path);
                            if(datas.flag){
                                var a = $('<a href="<%=basePath %>'+path+'#true" target="_blank"></a>')[0];
                                var e = document.createEvent('MouseEvents');
                                e.initEvent('click', true, true);
                                a.dispatchEvent(e);
                            }
                        }
                    });
                }else if(flag == true && msg != 'success'){
                    bank.showWindow('<%=basePath%>path/choose', "选择房源", 760, 520, true);
                }else if(flag == false){
                    bank.ajaxMessage(msg);
				}
            }
        });
    }
    //发送通知
    function sendMessage(appid) {
        $.ajax({
            type:"get",
            url:"<%=basePath %>contract/sendMessageForBA",
            async:true,
            data:{
                apSqlb:4,
                objId:appid
            },
            success:function (data) {
               bank.ajaxMessage(data);
           }
        });
    }
    function downLoad(appid){
	    window.location.href="<%=basePath %>contract/downLoad?apSqlb=4&objId="+appid
	}
</script>
</html>