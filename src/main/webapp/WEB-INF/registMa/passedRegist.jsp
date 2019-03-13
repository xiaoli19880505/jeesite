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
				<li><input class="easyui-textbox" id="username" style="width: 92%" data-options="label:'申请人:'"></li>
				<li><input class="easyui-textbox" id="sfzh" style="width: 92%" data-options="label:'身份证号:'"></li>
				<%--<li>
					<select class="easyui-combobox" id="ssq" style="width: 92%" data-options="label:'所属县区:',panelHeight:'auto',panelMaxHeight:400,
					editable:false,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath%>ParmItem/getOptions?parmSetcode=05'"></select>
				</li>
				<li>
					<select class="easyui-combobox" id="ssj" style="width: 92%" data-options="label:'所属街道:',panelHeight:'auto',panelMaxHeight:400,
					editable:false,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath%>ParmItem/getOptions?parmSetcode=06'"></select>
				</li>--%>
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
			   data-options="url:'<%=basePath%>applyUserinfo/findAllApplyUserInfo',singleSelect:true,rownumbers:true,pagination:true,border:true,striped:true,
                       pagePosition:'bottom',pageSize:20,nowrap:true,fitColumns:true">
			<thead>
			<tr>
				<th data-options="field:'username',width:100,align:'center'">姓名</th>
				<th data-options="field:'sex',width:50,align:'center'">性别</th>
				<th data-options="field:'linktel',width:150,align:'center'">手机号</th>
				<%--<th data-options="field:'userpwd',width:150,align:'center',halign:'center'">登录密码</th>--%>
				<th data-options="field:'sfzh',width:150,align:'center'">身份证号</th>
				<%--<th data-options="field:'address',width:100,align:'left',halign:'center'">家庭地址</th>
				<th data-options="field:'parmItemssq',width:100,align:'center',formatter:name">所属县区</th>
				<th data-options="field:'parmItemssjd',width:100,align:'center',formatter:name">所属街道</th>--%>
			</tr>
			</thead>
		</table>
	</div>
</div>
</body>
<script>
	/*function name(value,row,index){
	  return value.piItemname
	}*/
	function query(){
     $("#dataTable").datagrid('load',{
         username:$.trim($("#username").textbox('getValue')),
		 sfzh:$.trim($("#sfzh").textbox('getValue'))
	 })
	}
</script>
</html>