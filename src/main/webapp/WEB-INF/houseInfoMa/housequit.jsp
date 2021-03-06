<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <li style="width: 320px">
                    <select class="easyui-combobox" id="apSqlb" data-options="label:'申请类型',panelHeight:'auto',panelMaxHeight:'400',editable:false,
                valueField:'id',textField:'text'" style="width: 92%">
                        <option value="">全部</option>
                        <option value="2">公共租赁住房租赁补贴</option>
                        <option value="4">公共租赁住房（外来务工人员）</option>
                        <option value="5">公共租赁住房（新就业人员）</option>
                    </select>
                </li>
                <li><input class="easyui-textbox" name="username" id="username" style="width: 92%" data-options="label:'申请人:'"></li>
                <li><input class="easyui-textbox" name="sfzh" id="sfzh" style="width: 92%" data-options="label:'身份证号:'"></li>
                <li><input class="easyui-textbox" name="sqbh" id="sqbh" style="width: 92%" data-options="label:'申请编号:'"></li>
                <li class="query-btn">
                    <a class="icon iconfont icon-sousuo" onclick="query()"><i>查&nbsp;询</i></a>
                </li>
            </ul>
        </form>
        <div class="abtn-group btnInner">
            <a class="icon iconfont icon-icon-refresh green" onclick="bank.tbReload('dataTable')"><i>刷新</i></a>
            <a class="icon iconfont icon-guanbi red" onclick="bank.closeCurrent()"><i>关闭</i></a>
        </div>
    </div>
</div>
<div data-options="region:'center',border:false">
    <div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
        <table id="dataTable" class="easyui-datagrid resTable" style="height: 100%;min-height: 300px"
               data-options="url:'<%=basePath %>appove/houseQuitList',singleSelect:true,rownumbers:true,pagination:true,border:true,striped:true,
                       pagePosition:'bottom',nowrap:true">
            <thead>
            <tr>
                <th data-options="field:'atype',width:200,align:'center',halign:'center',formatter:convenrtApplyType">申请类型</th>
                <th data-options="field:'aplbh',width:200,align:'center'">申请编号</th>
                <th data-options="field:'username',width:200,align:'center'">申请人</th>
                <th data-options="field:'sfzh',width:200,align:'center'">身份证号</th>
                <th data-options="field:'ssq',width:100,align:'center'">所属县区</th>
                <th data-options="field:'ssj',width:100,align:'center'">所属街道</th>
                <th data-options="field:'operate',width:100,align:'center',formatter:operate">操作</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<%--放弃备注--%>
<div style="display: none">
    <div  id="bankWindow" class="easyui-dialog " title="备注" style="width:500px;height:400px;" data-options="resizable:true,modal:true,closed:true">
        <div class="easyui-panel windowPanel">
            <div class="abtn-group btnInner">
                <a class="icon iconfont icon-icon- green" onclick="save()"><i>提交</i></a>
            </div>
            <form method="post" id="form" class="easyui-form">
                <ul class="search-group-add windowInner">
                    <legend>备注</legend>
                    <li style="width: 380px">
                        <input class="easyui-textbox" name="acremark" style="width: 92%;height: 100px" data-options="label:'备注:',multiline:true">
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>



</body>
</html>
<script>
    var saveRow;
    function operate(value,row,index) {
        console.log(row)
       var apptype = row.aptype;
       var atype=row.atype;
       var aplid = row.aplid;
       var apsqlb=row.aplbh;
           saveRow=row;
        return '<a class="ablue" onclick="backHouse(\''+atype+'\',\''+aplid +'\',\''+apsqlb+'\')">放弃</a>';
    }

    /*转换业务类别*/
    function convenrtApplyType(value,row,index){
        var apptype = value;
        switch (apptype){
            case "1":
                return "经济适应住房";
            case "2":
                return "公共租赁住房租赁补贴";
            case "3":
                return "公共租赁住房（低保、特困家庭）";
            case "4":
                return "公共租赁住房（外来务工人员）";
            case "5":
                return "公共租赁住房（新就业人员）";
        }
    }
    <%--function auditOpinion(apptype,aplid){--%>
        <%--&lt;%&ndash;var a = $('<a href="<%=basePath %>appove/toTFSpPage?applyid='+aplid+'#true" target="_blank"></a>')[0];&ndash;%&gt;--%>
        <%--&lt;%&ndash;var e = document.createEvent('MouseEvents');&ndash;%&gt;--%>
        <%--&lt;%&ndash;e.initEvent('click', true, true);&ndash;%&gt;--%>
        <%--&lt;%&ndash;a.dispatchEvent(e);&ndash;%&gt;--%>
    <%--}--%>
   function backHouse(atype,aplid,apsqlb){




       $.messager.confirm('操作提示', '您确定退房吗？', function (r) {
           if (r) {

               $("#bankWindow").dialog('open');




               <%--$.ajax({--%>
                   <%--url:'<%=basePath %>sourceHouse/updateReturnHouse',--%>
                   <%--type:'post',--%>
                   <%--data:{--%>
                       <%--atype:atype,--%>
                       <%--applyid:aplid,--%>
                       <%--acSqbh:apsqlb--%>
                   <%--},--%>
                   <%--success:function(data){--%>
                       <%--bank.ajaxMessage(data);--%>
                       <%--$("#dataTable").datagrid('reload')--%>
                   <%--}--%>
               <%--})--%>
           }
       });
   }

    //根据条件查询
    function query(){
        $("#dataTable").datagrid('load',{
            atype:$.trim($("#apSqlb").combobox('getValue')),
            username:$.trim($("#username").val()),
            sfzh:$.trim($("#sfzh").val()),
            sqbh:$.trim($("#sqbh").val()),


        });
    }

    function save(){
        $('#form').form('submit', {
            url:'<%=basePath %>appove/houseQuitOperate',
            onSubmit: function(param){
                var atype=saveRow.atype;
                var applyid=saveRow.aplid;
                var sqbh=saveRow.aplbh
                param.atype=atype;
                param.applyid=applyid;
                param.sqbh=sqbh;
                var isValid = $(this).form('validate');
                if (!isValid){
                }
                return isValid;
            },
            success:function(data){
                $("#bankWindow").dialog('close');
                bank.ajaxMessage(data.result);
                query();
                saveRow={};
            }
        },'json');
    }

</script>
