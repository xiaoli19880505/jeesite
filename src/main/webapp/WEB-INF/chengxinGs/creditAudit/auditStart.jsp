<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<link rel="stylesheet" href="<%=basePath %>srcApply/css/webuploader.css"/>
<script type="text/javascript" src="<%=basePath %>srcApply/js/webuploader.js"></script>
<body class="easyui-layout">
<div data-options="region:'center',border:false">
    <div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
        <div class="reportTitle"><h3>诚信上报信息列表</h3></div>
        <div class="reportContainer">
            <form method="post" id="form" class="easyui-form">
                <ul class="reportUl">
                    <li >
                        <label class="reportLabel">主申请人信息:</label>
                    </li>
                    <li class="reportLi readonly">
                        <input class="easyui-textbox" name="applyUserinfo.afmXm" id="applyUserinfoafmXm" style="width: 93%" data-options="label:'姓名:',readonly:true">
                    </li>
                    <li class="reportLi readonly">
                        <select class="easyui-combobox" name="applyUserinfo.afmXb" id="applyUserinfoafmXb" style="width: 92%" data-options="label:'性别:',readonly:true">
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </li>
                    <li class="reportLi readonly">
                        <input class="easyui-textbox" name="applyUserinfo.afmSfzh" id="applyUserinfoafmSfzh" style="width: 92%" data-options="label:'身份证号码:',readonly:true">
                    </li>
                    <li class="reportLi readonly">
                        <input class="easyui-textbox" name="applyUserinfo.afmLxdh" id="applyUserinfoafmLxdh" style="width: 92%" data-options="label:'联系电话:',readonly:true">
                    </li>
                </ul>
                <ul class="reportUl job" style="display: none">
                    <li >
                        <label class="reportLabel">关联企事业单位信息:</label>
                    </li>
                    <li class="reportLi">
                        <input class="easyui-textbox" name="applyUnit.legelrep" id="applyUnitlegelrep" style="width:92%" data-options="label:'法定代表人'">
                    </li>
                    <li class="reportLi">
                        <input class="easyui-textbox" name="applyUnit.bsls" id="applyUnitbsls" style="width: 92%" data-options="label:'营业执照号:'">
                    </li>
                    <li class="reportLi">
                        <input class="easyui-textbox" name="applyUnit.entag" id="applyUnitentag" style="width:92%" data-options="label:'委托代理人'">
                    </li>
                    <li class="reportLi">
                        <input class="easyui-textbox" name="applyUnit.tel" id="applyUnittel" style="width:92%" data-options="label:'手机号码'">
                    </li>
                    <li class="reportLi">
                        <input class="easyui-textbox" name="applyUnit.address" id="applyUnitaddress" style="width:92%" data-options="label:'联系住址'">
                    </li>
                </ul>
                <ul class="reportUl">
                    <li class="reportLi readonly">
                        <input class="easyui-textbox" name="bliveGongS.blgTypeName" id="bliveGongSblgTypeName" style="width: 92%" data-options="label:'业务类型:',readonly:true">
                    </li>
                    <li class="reportLi readonly">
                        <input class="easyui-textbox" name="bliveGongS.blgSqbh" id="bliveGongSblgSqbh" style="width: 92%" data-options="label:'申请编号:',readonly:true">
                    </li>
                    <li class="reportLi readonly" style="margin-bottom: 0">
                        <select class="easyui-combobox" name="bliveGongsDetails[0].blgdSqtype" id="bliveGongsDetails0blgdSqtype"  style="width: 92%" data-options="label:'失信严重程度:',readonly:true,editable:false,panelHeight:'auto',
						panelMaxHeight:400,valueField:'id',textField:'text'">
                            <option value="1">一般</option>
                            <option value="2">严重</option>
                        </select>
                    </li>
                    <li class="reportLi readonly" style="margin-bottom: 0;height:44px">
                        <label>失信行为类型</label>
                        <input type="radio" style="margin-left: 15px" name="bliveGongsDetails[0].lostLetterType" value="1" disabled>个人<input type="radio" style="margin-left: 15px" name="bliveGongsDetails[0].lostLetterType" value="2" disabled>企业
                    </li>
                </ul>
                <ul class="reportUl">
                    <li class="readonly">
                        <label class="reportLabel">失信行为描述:</label>
                        <input class="easyui-textbox"  name="bliveGongsDetails[0].blgdDesc" id="bliveGongsDetails0blgdDesc" style="width: 96%;height: 100px" data-options="label:'',readonly:true,multiline:true">
                    </li>
                </ul>
                <ul class="reportUl" id="addType"></ul>
                <ul class="reportUl" id="addDesc"></ul>
                <div class="addPlace"></div>
                <ul class="reportUl">
                    <li >
                        <label class="reportLabel">附件:</label>
                        <a onclick="attachment()" style="color: #00978A;cursor: pointer">点击查看附件信息</a>
                    </li>
                </ul>
                <ul class="reportUl">
                    <li >
                        <label class="reportLabel">审核意见:</label>
                        <input class="easyui-textbox" name="blgOpinion" id="blgOpinion" style="width: 96%;height: 100px" data-options="multiline:true,required:true">
                    </li>
                </ul>
                <ul class="reportUl">
                    <li >
                        <label class="reportLabel">上传附件:</label>
                        <div>
                            <div class="filePicker">添加附件</div>
                            <div id="fileList" class="uploader-list"></div>
                        </div>
                    </li>
                </ul>
                <ul class="reportUl search-group">
                    <li >
                        <label class="reportLabel">审核结果:</label>
                        <input type="radio" name="blgCXType" value="0" ><label class="lispan">失信</label>
                        <span class="lispace"></span>
                        <input type="radio" name="blgCXType" value="1"><label class="lispan">非失信</label>
                    </li>
                </ul>
                <ul class="reportUl">
                    <li class="query-btn reportLi" style="margin-left: 180px">
                        <a class="icon iconfont icon-icon-" onclick="report()"><i>上&nbsp;报</i></a>
                    </li>
                    <li class="query-btn reset reportLi" >
                        <a class="icon iconfont icon-f " onclick="back()"><i>返&nbsp;回</i></a>
                    </li>
                </ul>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    var resultData={};
    var chenxinId='';
    var fileArray={};//删除和上传文件使用；
    $(function () {
        var datas=bank.biography().getParams("auditStart");
        chenxinId=datas.row.blgId;
        $.ajax({
            url:'<%=basePath %>blivegs/selectCXInfo',
            type:'post',
            dataType:'json',
            data:{
                blgId:datas.row.blgId
            },
            success:function(data){
                if(data.applyUnitFlag){
                    $(".job").show();
                }
                resultData=data.bliveGongS;
                add(data);//添加失信类型，描述
                setFile(data);//添加附件；
                setValue($('#form'),data);
            },error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试")
            }
        })
    });
    function add(data){
        if(data.bliveGongsDetails.length>1){
            $("#addType").append(' <li class="reportLi readonly" style="margin-bottom: 0">' +
                                 '<select class="easyui-combobox" name="bliveGongsDetails[1].blgdSqtype" id="bliveGongsDetails1blgdSqtype" style="width:92%" data-options="label:\'失信严重程度:\',readonly:true,editable:false,panelHeight:\'auto\',' +
                                 'panelMaxHeight:400,valueField:\'id\',textField:\'text\'">' +
                                 '<option value="1">一般</option>' +
                                 '<option value="2">严重</option>' +
                                 '</select>' +
                                 '</li>' +
                                 '<li class="reportLi readonly" style="margin-bottom: 0">' +
                                 '<label>失信行为类型</label>\n' +
                                 '<input type="radio" style="margin-left:15px" name="bliveGongsDetails[1].lostLetterType" value="1" disabled>个人<input type="radio" style="margin-left: 15px" name="bliveGongsDetails[1].lostLetterType" value="2" disabled>企业' +
                                 '</li>');
            $("#addDesc").append('<li class="readonly">' +
                                  '<label class="reportLabel">失信行为描述:</label>' +
                                  '<input class="easyui-textbox" id="bliveGongsDetails1blgdDesc" name="bliveGongsDetails[1].blgdDesc" style="width: 96%;height: 100px" data-options="label:\'\',readonly:true,multiline:true">' +
                                  '</li>');
        }
        $.parser.parse($("#addType"));
        $.parser.parse($("#addDesc"));
    }
    function setFile(data){
        if(data.annexFiles.length>0){
            for(var i=0;i<data.annexFiles.length;i++){
                fileArray[(data.annexFiles)[i].fileName]=(data.annexFiles)[i].id;
                $("#fileList").append('<div id="WU_FILE_0" class="item thumbnail">' +
                                        '<div class="info" data-id="'+(data.annexFiles)[i].id+'" ><span>'+(data.annexFiles)[i].fileName+'</span> <span onclick="del($(this))" style="cursor: pointer;margin-left: 5px;color: #00a2d4">删除</span>' +
                                        '</div>' +
                                        '</div>')
            }
        }
    }
    function setValue(form,data){
        for(var x in data){
            if(typeof(data[x])=="object"){
                $.each(form.serializeArray(), function (index) {
                    if(this['name'].indexOf(x)!=-1){//是否含有此字段
                        var nameSplit=this['name'].split('.');
                        if(nameSplit[0].indexOf("[")==-1){
                            //普通对象
                            var idArray=[];
                            idArray.push(nameSplit[0],nameSplit[1]);
                            //根据不同类型赋值
                            var typeClass=$('#'+idArray[0]+idArray[1]+'').attr('class');
                            if(typeClass!=undefined){
                                if(typeClass.indexOf('easyui-combobox')!=-1){
                                    $('#'+idArray[0]+idArray[1]+'').combobox('setValue',(data[x])[idArray[1]])
                                }else if(typeClass.indexOf('easyui-datebox')!=-1){
                                    $('#'+idArray[0]+idArray[1]+'').datebox('setValue',(data[x])[idArray[1]])
                                }else{
                                    $('#'+idArray[0]+idArray[1]+'').textbox('setValue',(data[x])[idArray[1]])
                                }
                            }
                        }else{
                            //数组对象
                            var idArray=[];
                            var index=nameSplit[0].indexOf("[");
                            var field=nameSplit[0].substring(0,index);
                            var indexCode=nameSplit[0].substring(index+1,(nameSplit[0].length-1));
                            idArray.push(field,indexCode,nameSplit[1]);
                            //根据不同类型赋值
                            var typeClass=$('#'+idArray[0]+idArray[1]+idArray[2]+'').attr('class');
                            if(typeClass!=undefined){
                                if(typeClass.indexOf('easyui-combobox')!=-1){
                                    $('#'+idArray[0]+idArray[1]+idArray[2]+'').combobox('setValue',(data[x])[indexCode][idArray[2]])
                                }else if(typeClass.indexOf('easyui-datebox')!=-1){
                                    $('#'+idArray[0]+idArray[1]+idArray[2]+'').datebox('setValue',(data[x])[indexCode][idArray[2]])
                                }else{
                                    $('#'+idArray[0]+idArray[1]+idArray[2]+'').textbox('setValue',(data[x])[indexCode][idArray[2]])
                                }
                            }
                        }

                    }
                });
            }else{
                $("#form").form('load',data);//直接赋值
            }
        }
        if($.trim(data.bliveGongsDetails).length>0){
            for(var i=0;i<data.bliveGongsDetails.length;i++){
                $("input[name='bliveGongsDetails["+i+"].lostLetterType'][value='"+data.bliveGongsDetails[i].lostLetterType+"']").attr("checked",true);
            }
        }
    }
    function report(){
        var datas=bank.biography().getParams('auditStart');
        var flag=false;
        var blgCXType=$.trim($('input[type="radio"]:checked').val());
        $('#form').form('submit', {
            url:'<%=basePath %>blivegs/addCXReviewSH',
            onSubmit: function(param){
                param.blgId=datas.row.blgId;
                var isValid = $(this).form('validate');
                   if(blgCXType.length>0&&isValid){
                       flag=true;
                   }else{
                       bank.alertMessage("请填写审核意见和审核结果")
                   }
                   return flag;
            },
            success:function(data){
                bank.alertMessage(data);
                if(data=="审核成功!"){
                    setTimeout(function () {
                        window.close();
                        opener.location.reload();
                    },1000)
                }
            },
            error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试！");
            }
        },'json');
    }
    function back() {
        window.close();
        opener.location.reload();
    }
    //查看附件信息
    function attachment(){
        if(resultData.blgType.indexOf("ns")!=-1){
            //年审
            var a = $('<a href="<%=basePath %>appove/toNsAudit?applyType='+resultData.blgType +'&applyId='+resultData.blgApid+'&processInstanceId='+resultData.blgShProcessid +'&chengxin=chengxin" target="_blank"></a>')[0];
            var e = document.createEvent('MouseEvents');
            e.initEvent('click', true, true);
            a.dispatchEvent(e);
        }else{
            //普通申请
            var a = $('<a href=<%=basePath %>task/toApprove?applyType='+resultData.blgType +'&applyId='+resultData.blgApid +'&processInstanceId='+resultData.blgShProcessid +'&chengxin=chengxin target="_blank"></a>')[0];
            var e = document.createEvent('MouseEvents');
            e.initEvent('click', true, true);
            a.dispatchEvent(e);
        }
    }
    //点击添加附件
    uploader = WebUploader.create({
        // 选完文件后，自动上传。
        auto: true,
        // swf文件路径
        swf: '/js/Uploader.swf',
        duplicate: true, //同一文件是否可重复选择
        server: '<%=basePath %>blivegs/fileUpload',
        pick: '.filePicker',
        //参数名称
        fileVal: "volname",
        fileNumLimit: 100,
        disableGlobalDnd: true, //禁用浏览器的拖拽功能，否则图片会被浏览器打开
        fileSizeLimit: 1000 * 1024 * 1024, // 总共的最大限制100M
        fileSingleSizeLimit: 4 * 1024 * 1024, // 单文件的最大限制4M
        // 只允许选择图片文件。
        accept: {
            title: 'all',
            extensions: '*'
        }
    });
    uploader.on("error", function (type) {
         if (type == "Q_EXCEED_SIZE_LIMIT") {
            bank.alertMessage("单文件大小不超过4M，请调整");
        }
    });
    uploader.on('fileQueued', function (file) {
        var flag=true;
        for(var x in fileArray){
            if([x]==file.name){
                flag=false;
                bank.alertMessage("该文件已存在");
            }
        }
        if(flag){
            // 判断当前上传文件的格式
            if (uploader.getFiles()[uploader.getFiles().length - 1].ext.toLowerCase() != "swf" &&
                uploader.getFiles()[uploader.getFiles().length - 1].ext.toLowerCase() != "jpeg" &&
                uploader.getFiles()[uploader.getFiles().length - 1].ext.toLowerCase() != "jpg" &&
                uploader.getFiles()[uploader.getFiles().length - 1].ext.toLowerCase() != "png"){
                //普通文件
                var $li=$( '<div id="' + file.id + '" class="item thumbnail">' +
                    '<div class="info"><span>' + file.name + '</span><span onclick="del($(this))" style="cursor: pointer;margin-left: 5px;color: #00a2d4">删除</span></div>' +
                    '</div>' );
                $("#fileList").append($li);

            }else{
                //图片
                var $li = $(
                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                    '<div class="info" ><img><span>' + file.name + '</span><span onclick="del($(this))" style="cursor: pointer;margin-left: 5px;color: #00a2d4">删除</span></div>' +
                    '</div>'
                    ),
                    $img = $li.find('img');
                $("#fileList").append($li);
                uploader.makeThumb(file, function (error, src) {
                    if (error) {
                        bank.alertMessage('此图不能预览');
                    }
                    $img.attr('src', src);
                }, 15, 15);
            }
        }

    });
    function del(obj) {
        var fileName=$.trim(obj.siblings('span').text());
        var fileId=fileArray[fileName];
        if(fileId==undefined){
            obj.parents(".thumbnail").remove();
              uploader.reset();
        }else{
            $.ajax({
                url:'<%=basePath %>articleInfo/deleteFile',
                type:'post',
                data:{
                    fileId:fileId
                },
                success:function(data){
                    bank.ajaxMessage(data);
                    delete fileArray[fileName];
                    obj.parents(".thumbnail").remove();
                     uploader.reset();
                },error:function(){
                    bank.alertMessage("数据库连接失败，请稍后再试")
                }
            });
        }
    }
        //上传后才执行
    uploader.on('uploadBeforeSend', function (obj, data, headers){
        data.volname="volname";
        data.blgId = chenxinId;
    });
        uploader.upload();
        //上传后才执行
        uploader.on( 'uploadError', function( file,response ) {
            bank.ajaxMessage('上传失败');
            $("span:contains("+file.name+")").parents(".thumbnail").remove();
            uploader.reset();
        });
        //上传后才执行
        uploader.on( 'uploadSuccess', function( file,response ) {
            fileArray[file.name]=response._raw;//取回返回信息，写入文件中
            console.log(fileArray)
        });
</script>
<style>
    .textbox-label{
        width: 100px;
    }
</style>
</html>