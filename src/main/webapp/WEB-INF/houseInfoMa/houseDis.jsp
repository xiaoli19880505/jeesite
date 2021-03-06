<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" id="house">
<div data-options="region:'north',border:false" style="overflow: hidden" id="publicNorth">
				<ul class="search-group">
					<li><input class="easyui-combobox" id="project" data-options="label:'项目',panelHeight:'auto',panelMaxHeight:'400',editable:false" style="width: 92%"></li>
					<li><input class="easyui-combobox" id="ssq" data-options="label:'所属区',valueField:'piItemcode',textField:'piItemname',editable:false,
					panelHeight:'auto',panelMaxHeight:'400',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=05',onSelect:selectSsq,onLoadSuccess:sucessSSq" style="width: 92%"></li>
					<li style="width: 600px">
						<label style="width:80px;display: inline-block">房源类型:</label>
						<input type="radio" name="houseType" value="1" checked><label class="lispan">经适房</label><span class="lispace"></span>
						<input type="radio" name="houseType" value="2" ><label class="lispan">公租房(低保特困)</label><span class="lispace"></span>
						<input type="radio" name="houseType" value="3" ><label class="lispan">公租房(外来务工、新就业)</label><span class="lispace"></span>
					</li>
					<li class="query-btn" >
						<a class="icon iconfont icon-sousuo" onclick="query()"><i>查询</i></a>
					</li>
				</ul>
	            <ul class="search-group">
					<li style="width: 450px">
						<input class="easyui-combogrid" id="sfzh" data-options="label:'申请人',panelHeight:'auto',panelMaxHeight:'300',idField:'apluserid',textField:'username',pagination:true,
                      pageSize:10,events:{keyup:queryUser},onSelect:selectUser,
                      columns: [[{field:'username',title:'姓名',width:50,align:'center'},{field:'sfzh',title:'身份证号',width:120,align:'center'}]],
                      fitColumns: true" style="width: 92%" >
					</li>
					<li class="query-btn" >
						<a class="icon iconfont icon-shoucang distribute" onclick="distribute()"><i>分配</i></a>
					</li>
				</ul>
</div>
<div data-options="region:'west',split:false,border:false" style="width:270px; height: auto;overflow-y: auto;" id="#diswest">
	<div class="easyui-panel p5" style="width:100%;height: 98%;border: solid 1px #cdcdcd">
		<ul class="build"></ul>
	</div>
</div>
<div data-options="region:'center',border:false" id="#discenter">
	<div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
      <ul class="houseContainer"></ul>
	</div>
</div>

</body>
<script>
	var build=[];//传递的房子id
	var flag=false;//是否已经验证过该证件号人存在
	var resultData={};
	var isClick=true;
	var maxLength=3;
    //根据项目加载楼号，
    $("#project").combobox({
        url: '<%=basePath %>sourceHouse/findSourceHouses',
        valueField: 'id',
        textField: 'text',
        onLoadSuccess: function (data) { //默认选中第一条数据
            build=[];
            if (data.length > 0) {
                $('#project').combobox('setValue', data[0].id);
            }
        },
        onChange: function () {
            build=[];
            var itemId=$('#project').combobox('getValue');
            //根据楼号加载房子信息
            setBuild(itemId);
        }
    });
    //根据项目加载楼号
    function setBuild(itemId){
        $(".build").html("");
        var fylx=$.trim($('input[name="houseType"]:checked').val());
        var ssq=(fylx=="3")?("0"):((($.trim($("#ssq").combobox('getValue'))).length==0)?"0":($("#ssq").combobox('getValue')));
        $.ajax({
            url: '<%=basePath %>BuidInfo/findBuildInfoByMap',
            type: 'post',
            dataType: 'json',
            data: {
                itemId: itemId
            },
            success: function (data) {
                for(var i=0;i<data.length;i++){
                    $(".build").append('<li id="'+ data[i].buildinginfoId+'">'+ data[i].buname+'</li>');
                    if(i==0){
                        $('#'+ data[i].buildinginfoId+'').addClass('buildSelect').siblings().removeClass('buildSelect');
                        setHouse(data[i].buildinginfoId,fylx,ssq)
                    }
                }
            },
            error: function () {
                bank.alertMessage("数据库连接失败，请稍后再试！")
            }
        });
    }
	$("body").on('click','.build li',function(){
        $(this).addClass('buildSelect').siblings().removeClass('buildSelect');
        build=[];//重置数组；
        var buildid =$(this).attr('id');
        var fylx=$.trim($('input[name="houseType"]:checked').val());
        var ssq=(fylx=="3")?("0"):($("#ssq").combobox('getValue'));
        setHouse(buildid,fylx,ssq)
	});
    //根据楼号加载房子
    function setHouse(buildid,fylx,ssq){
        $('.houseContainer').html("");
        $.ajax({
            url:'<%=basePath%>FactMapping/findFactByMap',
            type:'post',
            dataType:'json',
            data:{
                buildid:buildid,
                fylx:fylx,
				ssq:ssq
            },
            success:function(data){
                if(data.length>0){
                   for(var i=0;i<data.length;i++){
                       var username=((data[i].applyUserinfo).username==undefined)?"":(data[i].applyUserinfo).username;
                        if(data[i].orderflag=="TRUE"){
                            $('.houseContainer').append(' <li class="houseItem nocheck">' +
                                '<p class="housecheck"><span>'+data[i].fylxname+'</span><span class="history" onclick="record(\''+(data[i].factmappingId)+'\');">历史记录</span></p>' +
                                '<p class="houseCode" >'+data[i].fCondonum+'</p>' +
                                '<p class="houseName"></p>'+
                                '<p class="houseAreaGroup"><input type="checkbox" name="selectRadio" value="'+data[i].factmappingId+'" >'+data[i].fHouse+'<span>'+data[i].fConacre+'m²</span></p>' +
                                '</li>')
                        }else{
                            $('.houseContainer').append(' <li class="houseItem hasCheck">' +
                                '<p class="housecheck"><span>'+data[i].fylxname+'</span><span class="history" onclick="record(\''+(data[i].factmappingId)+'\');">历史记录</span></p>' +
                                '<p class="houseCode" >'+data[i].fCondonum+'</p>' +
                                '<p class="houseName">'+data[i].afmXm+'</p>'+
                                '<p class="houseAreaGroup"><input type="checkbox" name="selectRadio" disabled>'+data[i].fHouse+'<span>'+data[i].fConacre+'m²</span></p>' +
                                '</li>')
                        }
                    }
                }
                //加载并回填已选项目

            },error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试！")
            }
        })
    }
    //选房
	$('body').on('change','input[type=checkbox][name=selectRadio]',function(){
	    var sfzh=$.trim($("#sfzh").combogrid('getValue'));
	    if(sfzh.length==0){
	        $(this).prop("checked",false);
	        bank.alertMessage("请先选择申请人!");

		}else{
            var id=$.trim($(this).val());
            if(build.length>=maxLength){
                $(this).prop("checked",false);
                bank.alertMessage("每人最多可以分配三套房源！")
			}else{
                if($(this).is(':checked')){
                    build.push(id)
				}else{
                    var index= bank.getArrayIndex(build,id);
                    build.splice(index,1);
					maxLength=maxLength+1;
				}
			}

		}
	});
    //点击类型加载人员
    $('body').on('change','input[type=radio][name=houseType]',function(){
        var radioId=$.trim($(this).val());
        var ssqId=$("#ssq").combobox('getValue');
        loadApplyer(ssqId,radioId,"");
        //查询房子
        var buildid =$.trim($('.buildSelect').attr('id'));
        var ssq=(radioId=="3")?("0"):($("#ssq").combobox('getValue'));
        setHouse(buildid,radioId,ssq);
    });
    //默认加载所属区
    function sucessSSq(){
       var data=$("#ssq").combobox('getData');
		if(data.length>0){
			$("#ssq").combobox('setValue',data[0].piItemcode);
		}
    }
    //改变所属区加载人员
    function selectSsq(record){
        var radioId=$.trim($('input[name="houseType"]:checked').val());
        loadApplyer(record.piItemcode,radioId,"");
        var buildid =$.trim($('.buildSelect').attr('id'));
        var ssq=(radioId=="3")?("0"):(record.piItemcode);
        if(buildid.length==0){
            setTimeout(function () {
                var buildid =$.trim($('.buildSelect').attr('id'));
                setHouse(buildid,radioId,ssq);
            },300);
		}else{
            setHouse(buildid,radioId,ssq);
		}
	}
    //点击查询加载人员
    function query(){
        var radioId=$.trim($('input[name="houseType"]:checked').val());
        var ssqId=$("#ssq").combobox('getValue');
        loadApplyer(ssqId,radioId,"");
        //查询房子
        var buildid =$.trim($('.buildSelect').attr('id'));
        var ssq=(radioId=="3")?("0"):($("#ssq").combobox('getValue'));
        setHouse(buildid,radioId,ssq);
    }
    //加载人员方法
	function loadApplyer(ssqId,radioId,uname) {
        $("#sfzh").combogrid('clear');
        $("#sfzh").combogrid("grid").datagrid({
            url:'<%=basePath %>appove/findBySfzh',
            queryParams:{
                ssq: ssqId,
                aptype: radioId,
                uname:uname
            }
        });
    }
	//根据身份证号加载申请单和个人信息
    function selectUser(rowIndex, rowData){
        $("#sfzh").combogrid('setValue',{apluserid:rowData.apluserid,username:rowData.username});
		maxLength=3-Number(rowData.numb);
         resultData=rowData;
         flag=true;
    }
    //分配房子
    function distribute(){
        if(isClick){
            if($.trim($("#project").combobox('getValue')).length==0){
                bank.alertMessage("请选择项目!")
            }else if(!flag){
                bank.alertMessage("请选择申请人!")
            }else if(build.length==0){
                bank.alertMessage("请选择待分配的房子!")
            }else{
                isClick=false;
                var radioId=$.trim($('input[name="houseType"]:checked').val());
                $.ajax({
                    url:'<%=basePath %>sourceHouse/updateHouseFenPei',
                    type:'post',
                    data:{
                        houseid:build.toString(),
                        aptype:resultData.aptype,
                        applyid:resultData.aplid,
                        userid:resultData.apluserid,
                        tel:resultData.linktel
                    },
					dataType:'json',
                    success:function(data){
                        bank.ajaxMessage(data.result);
                        if(data.result=="分配成功"){
                            var houseIds=build.toString();
                            isClick=true;
                            flag=false;
                            //刷新房子
                            $('#project').combobox('clear');
                            $('#project').combobox('reload','<%=basePath %>sourceHouse/findSourceHouses');
                            //刷新人员列表
                            var radioId=$.trim($('input[name="houseType"]:checked').val());
                            var ssqId=$("#ssq").combobox('getValue');
                            loadApplyer(ssqId,radioId,"");
                            var a = $('<a href="<%=basePath %>FactMapping/findFactByFwId?atype='+ radioId+'&houseIds='+houseIds+'&ssq='+resultData.ssq+'&sfzh='+resultData.sfzh+'&username='+encodeURIComponent(resultData.username)+'#true" target="_blank"></a>')[0];
                            var e = document.createEvent('MouseEvents');
                            e.initEvent('click', true, true);
                            a.dispatchEvent(e);
                            resultData={};
                            bulid=[];
                             maxLength=3;
                        }
                    },error:function(){
                        bank.alertMessage("数据库连接失败，请稍后再试！")
                    }

                })
            }
		}
    }
    //查看历史记录
	function record(id){
        bank.biography().setParams({row:id,title:"dishistory"});
        bank.showWindow('<%=basePath %>path/toHisTable', "历史记录", 700, 500, true);
	}
	//模糊查询
	function queryUser(){
        var uname=$(this).val();
        var radioId=$.trim($('input[name="houseType"]:checked').val());
        var ssqId=$("#ssq").combobox('getValue');
        $("#sfzh").combogrid("grid").datagrid({
            url:'<%=basePath %>appove/findBySfzh',
			queryParams:{
                ssq: ssqId,
                aptype: radioId,
                uname:uname
			}
		});
	}
</script>
<style>
	.textbox-label{
		width: 100px !important;
	}
</style>
</html>