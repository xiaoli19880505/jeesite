<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" id="house">
<div data-options="region:'north',border:false" style="overflow: hidden" id="publicNorth">
    <form id="queryForm">
        <ul class="search-group">
            <li><input class="easyui-combobox" id="project" data-options="label:'项目',panelHeight:'auto',panelMaxHeight:'400',editable:false,
            valueField:'itemcodeinfoId',textField:'icItname'," style="width: 92%"></li>
            <li style="width:280px">
                <label style="width:80px;display: inline-block">选房操作:</label>
                <input type="checkbox" id="checkALL" ><label class="lispan">全选</label>
                <span class="lispace"></span>
                <input  type="checkbox" id="uncheckAll" ><label class="lispan">反选</label>
            </li>
            <li style="width: 320px">
                <select class="easyui-combobox" id="type" data-options="label:'查询类型',panelHeight:'auto',panelMaxHeight:'400',editable:false,
                valueField:'id',textField:'text',onChange:selectType" style="width: 92%">
                    <option value="">未分配查询</option>
                    <option value="1">经适房</option>
                    <option value="2">公租房(低保特困)</option>
                    <option value="3">公租房(外来务工、新就业)</option>
                </select>
            </li>
        </ul>
        <ul class="search-group">
            <li style="width: 600px">
                <label style="width:80px;display: inline-block">房源类型:</label>
                <input type="radio" name="area" value="1"><label class="lispan">经适房</label><span class="lispace"></span>
                <input type="radio" name="area" value="2" ><label class="lispan">公租房(低保特困)</label><span class="lispace"></span>
                <input type="radio" name="area" value="3"><label class="lispan">公租房(外来务工、新就业)</label><span class="lispace"></span>
            </li>
            <li class="query-btn" onclick="ration()">
                <a class="icon iconfont icon-shoucang " ><i>分配</i></a>
            </li>
        </ul>
    </form>
</div>
<div data-options="region:'west',split:false,border:false" style="width:270px; height: auto;overflow-y: auto;">
    <div class="easyui-panel p5" style="width:100%;height: 98%;border: solid 1px #cdcdcd">
        <ul class="build"></ul>
    </div>
</div>
<div data-options="region:'center',border:false">
    <div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
        <ul class="houseContainer"></ul>
    </div>
</div>
</body>
<script>
    var bulidArray=[];
    var isClick=true;
    //根据项目加载楼号
        $("#project").combobox({
            url:'<%=basePath %>ItemCodeInfo/select',
            onLoadSuccess:function(data){ //默认选中第一条数据
                bulidArray=[];
                if (data.length > 0) {
                    $('#project').combobox('setValue', data[0].itemcodeinfoId);
                }
            },
            onChange:function () {
                bulidArray=[];
                var itemId = $('#project').combobox('getValue');
                setBuild(itemId);
            }
        });
        function setBuild(itemId){
            $(".build").html("");
            $.ajax({
                url:'<%=basePath %>BuidInfo/findBuildInfoByIid',
                type:'post',
                dataType:'json',
                data:{
                    itemId:itemId
                },
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        $(".build").append('<li id="'+ data[i].buildinginfoId+'">'+ data[i].buname+'</li>');
                        if(i==0){
                            $('#'+ data[i].buildinginfoId+'').addClass('buildSelect').siblings().removeClass('buildSelect');
                            houseInfo(data[i].buildinginfoId)
                        }
                    }
                },
                error:function(){
                    bank.alertMessage("数据库连接失败，请稍后再试！")
                }
            })
        }
    //点击左侧，根据楼号查询
    $("body").on('click','.build li',function(){
        $(this).addClass('buildSelect').siblings().removeClass('buildSelect');
        var id = $(this).attr('id');
        houseInfo(id);
    });
        //根据楼号加载房源信息
    function houseInfo(id) {
        $(".houseContainer").html("");
        $.ajax({
            url:'<%=basePath %>FactMapping/findFactByItemid',
            type:'post',
            dataType:'json',
            data:{
                buildid:id,
                fylx:$("#type").combobox('getValue')//选择类型
            },
            success:function(data){
                for (var i = 0;i<data.length;i++) {
                    if(data[i].inputflag == 1 || ((data[i].inputflag == 1 )&& (data[i].rationflag == 1))){
                        $('.houseContainer').append(' <li class="houseItem nocheck">' +
                            '<p class="housecheck"><input type="checkbox" ><span>'+data[i].fylxname+'</span></p>' +
                            '<p class="houseCode" data-houseId="'+data[i].factmappingId+'">'+data[i].fCondonum+'</p>' +
                            '<p class="houseArea">'+data[i].fConacre+'m²</p>' +
                            '</li>')

                    }else if(data[i].inputflag == 0) {
                        $('.houseContainer').append(' <li class="houseItem hasCheck">' +
                            '<p class="housecheck"><input type="checkbox" disabled><span>'+data[i].fylxname+'</span></p>' +
                            '<p class="houseCode" data-houseId="'+data[i].factmappingId+'">'+data[i].fCondonum+'</p>' +
                            '<p class="houseArea">'+data[i].fConacre+'m²</p>' +
                            '</li>');
                    }
                }
            },
            error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试！")
            }
        })
    }
    //全选
    $("#checkALL").change(function(){
        if($(this).is(':checked')){ //选中
            $('.houseContainer .housecheck input[type="checkbox"]').each(function(){
                if($(this).prop('disabled')){
                    $(this).prop("checked",false);
                }else{
                    $(this).prop("checked",true);
                    var houseid=$(this).parent().siblings('.houseCode').attr('data-houseId');
                    if($.inArray(houseid,bulidArray)==-1){
                        bulidArray.push(houseid)
                    }
                }
            })
        }else{
            $('.houseContainer .housecheck input[type="checkbox"]').each(function(){
                $(this).prop("checked",false);
                var houseid=$(this).parent().siblings('.houseCode').attr('data-houseId');
                if($.inArray(houseid,bulidArray)!=-1){
                    var index=bank.getArrayIndex(bulidArray,houseid);  //获取index
                    bulidArray.splice(index,1);
                }
            })
        }
    });
    //反选
    $("#uncheckAll").change(function(){
        if($(this).is(':checked')){ //选中
            $('.houseContainer .housecheck input[type="checkbox"]').each(function(){
                if($(this).prop('disabled')){
                    $(this).prop("checked",false);
                }else{
                    $(this).prop("checked",false);
                    var houseid=$(this).parent().siblings('.houseCode').attr('data-houseId');
                    if($.inArray(houseid,bulidArray)!=-1){
                        var index=bank.getArrayIndex(bulidArray,houseid);  //获取index
                        bulidArray.splice(index,1);
                    }
                }
            })
        }else{//反选
            $('.houseContainer .housecheck input[type="checkbox"]').each(function(){
                if($(this).prop('disabled')){
                    $(this).prop("checked",false);
                }else{
                    $(this).prop("checked",true);
                    var houseid=$(this).parent().siblings('.houseCode').attr('data-houseId');
                    if($.inArray(houseid,bulidArray)==-1){
                        bulidArray.push(houseid)
                    }
                }
            })
        }
    });

    $("body").on('click','.houseContainer .housecheck input[type="checkbox"]',function(){
        var houseid=$(this).parent().siblings('.houseCode').attr('data-houseId');
        if($(this).is(':checked')){ //选中
            //在数组中，不加入，不在数组中加入
            if($.inArray(houseid,bulidArray)==-1){
                bulidArray.push(houseid)
            }
        }else{
            //从数组中移除
            if($.inArray(houseid,bulidArray)!=-1){
                var index=bank.getArrayIndex(bulidArray,houseid);  //获取index
                bulidArray.splice(index,1);
            }
        }

    });
    //分配房子
    function ration(){
        if(isClick){
            if($.trim($("#project").combobox('getValue')).length==0){
                bank.alertMessage("请选择项目!")
            } else if(bulidArray.length==0){
                bank.alertMessage("请选择房子!")
            }else if($('input:radio[name="area"]:checked').val() == null){
                bank.alertMessage("请选择房源类型!")
            }else{
                //提交
                isClick=false;
                $.ajax({
                    url:'<%=basePath %>sourceHouse/saveSourceHouse',
                    type:'post',
                    data:{
                        xmid:$("#project").combobox('getValue'),//项目
                        lpid:$('.buildSelect').attr('id'),
                        fwidlist:bulidArray.toString(),
                        fylx:$('input[name="area"]:checked').val()
                    },
                    success:function(data){
                        bank.ajaxMessage(data);
                        if(data=="分配成功"){
                            isClick=true
                            bulidArray=[];
                            $('#project').combobox('clear');
                            $('#project').combobox('reload','<%=basePath %>ItemCodeInfo/select');
                        }
                    },error:function(){
                        bank.alertMessage("数据库连接失败，请稍后再试！")
                    }

                })
            }
        }

    }
    //根据类型选房子
    function selectType(){
            var id=$('.buildSelect').attr("id");
            houseInfo(id);
    }
</script>
</html>