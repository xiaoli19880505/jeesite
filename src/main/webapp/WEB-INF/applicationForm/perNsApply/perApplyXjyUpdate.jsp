<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>新就业公租房申请</title>
    <link rel="stylesheet" href="<%=basePath %>thiemesApply/gray/easyui.css"/>
    <link rel="stylesheet" href="<%=basePath %>srcApply/css/webuploader.css"/>
    <link rel="stylesheet" href="<%=basePath %>srcApply/css/common.css"/>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/webuploader.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath %>srcApply/js/common.js"></script>
</head>

<body class="easyui-layout">
<div class="over" style="display: none;">
    <div id="loading"></div>
</div>
<div data-options="region:'center'" id="center">
    <span class="top-title">公共租赁住房（新就业人员）年审申请</span>
    <div id="top">
        <form method="post" id="form" class="easyui-form" enctype="multipart/form-data">
            <div style="display: none">
                <input class="easyui-textbox" name="alsid" id="alsid">
            </div>
            <div style="display: none">
                <input class="easyui-textbox" name="apSqlb" id="apSqlb">
            </div>
            <ul class="input-group">
                <li>
                    <input class="easyui-textbox" name="affDwmc" style="width: 92%" data-options="label:'单位名称:',required:true">
                </li>
                <li>
                    <input class="easyui-combobox" name="apSsq" style="width: 92%" data-options="label:'单位所在区（县）:',required:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/selectSsqExceptCenter',editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                </li>
                <li>
                    <input class="easyui-combobox" name="apJdbsc" style="width: 92%" data-options="label:'单位所在街道:',required:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=06',editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                </li>
            </ul>
            <!--进度条-->
            <div id="procsss">
                <div class="left">
                    <img src="<%=basePath %>srcApply/img/applicationForm/left.png"/>
                </div>
                <div class="right">
                    <img src="<%=basePath %>srcApply/img/applicationForm/right.png"/>
                </div>
                <ul class="step">
                    <li>
                        <div class="step-img-green">
                            <span>1</span>
                        </div>
                        <p>基本信息</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>2</span>
                        </div>
                        <p class="blue">工作与家庭情况</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>3</span>
                        </div>
                        <p class="blue">同住家庭成员情况</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>4</span>
                        </div>
                        <p class="blue">附件信息</p>
                    </li>
                </ul>
                <div class="process">
                    <div class="imgparent">
                        <img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" />
                        <img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none"/>
                        <img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none"/>
                        <img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none"/>
                    </div>
                </div>
            </div>
            <!--填写内容区-->
            <div id="inner">

                <div>
                    <ul class="input-group windowInner">
                        <legend>申请人信息</legend>
                        <li style="display: none">
                            <input class="easyui-textbox" name="apSqrid" style="width: 92%" data-options="label:'afgSqrid'">
                        </li>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmId" id="applyFamilyMembers0afmId" style="width: 92%" data-options="label:'afmId'">
                        </li>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmSqid" id="applyFamilyMembers0afmSqid" style="width: 92%" data-options="label:'afmSqid'">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmXm" id="applyFamilyMembers0afmXm" style="width: 92%" data-options="label:'姓名:',required:true,readonly:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li class="readonly">
                            <select class="easyui-combobox" name="applyFamilyMembers[0].afmXb" id="applyFamilyMembers0afmXb" style="width: 92%" data-options="label:'性别:',required:true,readonly:true,editable:false,panelHeight:'auto'">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmLxdh" id="applyFamilyMembers0afmLxdh" style="width: 92%" data-options="label:'联系电话:',required:true,validType:'phone',readonly:true">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmSfzh" id="applyFamilyMembers0afmSfzh" style="width: 92%" data-options="label:'身份证号码:',required:true,validType:'sfz',readonly:true">
                        </li>
                        <li>
                            <input class="easyui-datebox" name="afgBysj" style="width: 92%" data-options="label:'毕业时间:',required:true,editable:false">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="afgByyx" style="width: 92%" data-options="label:'毕业学校:',required:true">
                        </li>
                        <li>
                            <input class="easyui-combobox" name="afgXl" style="width: 92%" data-options="label:'学历:',required:true,editable:false,valueField:'piItemname',textField:'piItemname',
                            url:'<%=basePath %>ParmItem/getOptions?parmSetcode=08',panelHeight:'auto',panelMaxHeight:'280'">
                        </li>
                        <li >
                            <select class="easyui-combobox" name="applyFamilyMembers[0].afmHyzk" id="applyFamilyMembers0afmHyzk" style="width: 92%" data-options="label:'婚姻状况:',required:true,valueField:'piItemcode',textField:'piItemname',
                            url:'<%=basePath %>ParmItem/getOptions?parmSetcode=07',editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                            </select>
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>市区户籍信息</legend>
                        <li>
                            <input class="easyui-textbox" name="afgHjdz" style="width: 92%" data-options="label:'户籍地址:',required:true,validType:['checkHj','empty']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="apSqhjnx" style="width: 92%" data-options="label:'户籍年限(年):',required:true,validType:['numberZ','empty']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apJtrk" id="apJtrk" style="width: 92%" data-options="label:'家庭人口:',readonly:true,validType:['numberZ','empty']">
                        </li>
                        <li >
                            <input class="easyui-textbox" name="affGrnsr" id="applyFamilyMembers0afmNsr" style="width: 92%" data-options="label:'个人年收入(元):',required:true,validType:'number',events:{keyup:changeSr}">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apJtnsr" id="apJtnsr" style="width: 92%" data-options="label:'家庭年收入(元):',readonly:true,validType:['number','empty']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apRjysr" id="apRjysr" style="width: 92%" data-options="label:'人均月收入(元):',readonly:true,validType:['number','empty']">
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>工作单位信息</legend>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyUnit.aplid" id="applyUnitaplid" style="width: 92%" data-options="label:'afhId:'">
                        </li>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyUnit.unitid" id="applyUnitunitid" style="width: 92%" data-options="label:'afhSqid:'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.legelrep" id="applyUnitlegelrep" style="width:92%" data-options="label:'法定代表人:',required:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.bsls" id="applyUnitbsls" style="width: 92%" data-options="label:'统一社会信用代码:',required:true,validType:['empty','xyCode']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.entag" id="applyUnitentag" style="width:92%" data-options="label:'委托代理人:',required:true,required:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.tel" id="applyUnittel" style="width:92%" data-options="label:'手机号码:',required:true,validType:'phone'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.address" id="applyUnitaddress" style="width:92%" data-options="label:'联系住址:',required:true,validType:['empty']">
                        </li>
                    </ul>
                    <p class="sbumit right">
                        <span><a href="#">下一步</a></span>
                    </p>
                </div>
                <div style="display: none;">
                    <ul class="input-group windowInner">
                        <legend>工作社保情况</legend>
                        <li>
                            <input class="easyui-datebox" name="affLdhtkssj" style="width: 92%" data-options="label:'劳动合同签订年限:',required:true,editable:false,validType:['minDate']">
                        </li>
                        <li>
                            <input class="easyui-datebox" name="affLdhtjssj" style="width: 92%" data-options="label:'至',required:true,editable:false">
                        </li>
                        <li>
                            <input class="easyui-datebox" name="affSbjnsj" style="width: 83%" data-options="label:'社会保险缴纳情况',required:true,editable:false,validType:['minDate']">
                            &nbsp;至今
                        </li>
                        <li>
                            <input class="easyui-datebox" name="affGjjjnsj" style="width: 83%" data-options="label:'住房公积金缴纳情况',editable:false,validType:['minDate']">
                            &nbsp;至今
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>家庭现住房情况</legend>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhId" id="applyFamilyHouses0afhId" style="width: 92%" data-options="label:'afhId:'">
                        </li>
                        <li style="display: none">
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhSqid" id="applyFamilyHouses0afhSqid" style="width: 92%" data-options="label:'afhSqid:'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhZl" id="applyFamilyHouses0afhZl" style="width: 92%" data-options="label:'房屋地址:',required:true">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhCqr" id="applyFamilyHouses0afhCqr" style="width: 92%" data-options="label:'产权人:',required:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li>
                             <input class="easyui-textbox" name="applyFamilyHouses[0].afhMj" id="applyFamilyHouses0afhMj" style="width: 92%" data-options="label:'房屋面积:',required:true,validType:'number',events:{keyup:changeMj}">
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhRjmj" id="applyFamilyHouses0afhRjmj" style="width: 92%" data-options="label:'人均建筑面积:',required:true,validType:'number',readonly:true">
                        </li>
                        <li>
                            <input class="easyui-combobox" name="applyFamilyHouses[0].afhZfxz" id="applyFamilyHouses0afhZfxz" style="width: 92%" data-options="label:'现住房性质:',required:true,valueField:'piItemcode',textField:'piItemname',
                            url:'<%=basePath %>ParmItem/getOptions?parmSetcode=01',editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                        </li>
                    </ul>
                    <p class="sbumit right">
                        <span><a href="#">下一步</a></span>
                    </p>
                </div>
                <div style="display: none;">
                    <input type="button" value="删除同住家庭成员" class="delPerson" onclick="delPerson()"/>
                    <input type="button" value="添加同住家庭成员" class="addPerson" onclick="addPerson()"/>
                    <p id="addPerson"></p>
                    <p class="sbumit right">
                        <span><a href="#">下一步</a></span>
                    </p>
                </div>
                <div style="display: none;">
                    <table id="table" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
                        <tr style="background: #66a0d3">
                            <th style="width: 80px;">序号</th>
                            <th style="width: 500px;">附件名称</th>
                            <th style="width: 600px;">选择附件</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td class="tdname"><span class="name">申请人和共同承租家庭成员身份证</span><span class="red">*(必填)</span><span class="aspan" onclick="view(4)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark0 filePicker" onclick="add(0)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList0" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td class="tdname"><span class="name">户口簿(含首页)</span><span class="red">*(必填)</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark1 filePicker" onclick="add(1)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList1" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td class="tdname"><span class="name">劳动合同或者聘用合同(加盖公章)</span><span class="red">*(必填)</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark2 filePicker" onclick="add(2)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList2" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td class="tdname"><span class="name">收入情况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(0)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark3 filePicker" onclick="add(3)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList3" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td class="tdname"><span class="name">住房状况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(6)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark4 filePicker" onclick="add(4)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList4" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td class="tdname"><span class="name">单位出具的公租房申请公示证明</span><span class="red">*(必填)</span><span class="aspan" onclick="view(7)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark5  filePicker " onclick="add(5)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList5" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td class="tdname"><span class="name">住房公积金缴存证明或者社会保险经办机构出具的社会保险缴存证明</span><span class="red">*(必填)</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark6 filePicker" onclick="add(6)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList6" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td class="tdname"><span class="name">婚姻情况证明</span><span class="red">*(必填)</span><span class="aspan" onclick="view(2)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark7  filePicker" onclick="add(7)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList7" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td class="tdname"><span class="name">大中专院校毕业证书</span><span class="red">*(必填)</span><span class="aspan" onclick="view(8)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark8 filePicker" onclick="add(8)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList8" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td class="tdname"><span class="name">营业执照</span><span class="red">*(必填)</span><span class="aspan" onclick="view(9)">查看详情</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark9 filePicker" onclick="add(9)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList9" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td class="tdname"><span class="name">其他相关材料</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark10 filePicker" onclick="add(10)">添加附件</div>
                                    <!--用来存放item-->
                                    <div id="fileList10" class="uploader-list"></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="sbumit" onclick="save()">
                        <span><a href="#">提交</a></span>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="imgOperate">
        <div style="width: 100%" class="optColumn">
            <span  class="leftRotate"></span>
            <span  class="rightRotate"></span>
            <span  class="expand"></span>
            <span  class="shrink"></span>
            <span  class="close"></span>
        </div>
        <div class="optImg">
            <img src="" alt="" >
        </div>
    </div>
</div>
</body>

</html>
<style>
    .textbox-label {
        width: 130px;
    }
</style>
<script>
    var person=false;//是否可添加同住家庭成员
    var j=0,currentIndex=0,sucIndex=0,num = "",codeArray=[], nameArray = [],initArray=[];
    var changeImg='';
    $('.filePicker').each(function (index) {
        nameArray[index] = $(this).parent().parent().siblings().find('.name').text();
    });
    uploader = WebUploader.create({
        auto: false,
        swf: '<%=basePath %>srcApply/js/Uploader.swf',
        server: '<%=basePath %>volel/uoloadVolel',
        pick:{
            id:'.filePicker',
            label:'添加附件'
        } ,
        fileVal: "volname1",
        threads:1,//并发最大数量限制
        fileNumLimit: 100,//限制最大张数100
        disableGlobalDnd: true, //禁用浏览器的拖拽功能，否则图片会被浏览器打开
        fileSizeLimit: 1000 * 1024 * 1024, // 总共的最大限制1000M
        fileSingleSizeLimit: 4 * 1024 * 1024, // 单文件的最大限制4M
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/!*'
        },
        duplicate: true, //同一文件是否可重复选择
        compress: {
            width: 1200,
            height: 1200,
            quality: 90,// 图片质量，只有type为`image/jpeg`的时候才有效。
            allowMagnify: false,// 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
            crop: false,// 是否允许裁剪。
            preserveHeaders: true,// 是否保留头部meta信息。
            noCompressIfLarger: false,
            compressSize: 0 // 单位字节，如果图片大小小于此值，不会采用压缩。
        },
        resize: false//尺寸不改变
    });
    uploader.on("error", function (type) {
        if (type == "F_DUPLICATE") {
            bank.alertMessage("请不要重复选择文件！");
        } else if (type == "Q_EXCEED_SIZE_LIMIT") {
            bank.alertMessage("单文件大小不超过4M，请调整");
        }

    });
    uploader.on('fileQueued', function (file) {
        var pickId=file.source.ruid;
        var pickClass=$("#"+pickId+"").parent().parent().parent().find(".filePicker").attr("class");
        if(pickClass!=undefined){
            j=pickClass.substring(8,9);
            codeArray.push(j);
            codeArray.push(j);
            codeArray.push(j);
        }
        var $li = $(
            '<div id="' + file.id + '" class="file-item thumbnail">' +
            '<img>' +
            '<div class="info" onclick="del($(this))">' + "删除" + '</div>' +
            '</div>'
            ),
            $img = $li.find('img');
        $("#fileList" + j + "").append($li);
        uploader.makeThumb(file, function (error, src) {
            if (error) {
                bank.alertMessage('此图不能预览');
            }
            $img.attr('src', src);
        }, 15, 15);
    });


    function del(obj) {
        //移除一个j
        var code=Number(obj.parent().parent().attr('id').substring(8));
        var index=bank.getArrayIndex(codeArray,code);
        codeArray.splice(index,1);
        codeArray.splice((index-1),1);
        codeArray.splice((index-2),1);
        //移除
        obj.parents(".thumbnail").remove();
        uploader.reset();
    }
    function add(index){
        j=index;
        //填入codeArray;
        codeArray.push(index);//执行2次
    }
    function send(applyid){
        //上传后才执行
        var newArray=solveArray(codeArray);
        if(newArray.length==0){
            bank.ajaxMessage('上传成功');
            setTimeout(function () {
                $(".over").hide();
                if (window.opener && !window.opener.closed) {
                    window.parent.opener.location.reload();
                }else{
                    parent.location.reload();
                }
                window.close(); return false;
            },1000);
        }else{
            uploader.on('uploadBeforeSend', function (obj, data, headers){
                var code=newArray[currentIndex];
                data.volname=nameArray[code];
                data.fileVal="volname"+(Number(1+Number(code)));
                data.applyid=applyid;
                currentIndex++
            });
            uploader.upload();
            //上传后才执行
            uploader.on( 'uploadError', function( file ) {
                $(".over").hide();
                bank.ajaxMessage('上传失败');
            });
            //上传后才执行
            uploader.on( 'uploadSuccess', function( file ) {
                sucIndex++;
                if(sucIndex==newArray.length){
                    bank.ajaxMessage('上传成功');
                    setTimeout(function () {
                        $(".over").hide();
                        if (window.opener && !window.opener.closed) {
                            window.parent.opener.location.reload();
                        }else{
                            parent.location.reload();
                        }
                        window.close(); return false;
                    },1000);
                }
            });
        }

    }
    //处理数组
    function solveArray(codeArray){
        var newArray=[];
        for(var i=0;i<codeArray.length;i++){
            if(i%3==0){
                newArray.push(codeArray[i])
            }
        }
        return newArray.sort();
    }
    function judgeArray(newArray,initArray){
        var judgeFlag=true;
        var bitianArray=[0,1,2,3,4,5,6,7,8,9];
        var endArray=newArray.concat(initArray);
        var temp=bank.arraySplice(endArray);
        if(temp.length>0){
            for(var x in bitianArray){
                if(typeof(bank.getArrayIndex(temp,bitianArray[x]))=="boolean"){
                    judgeFlag=false;
                    return false;
                }
            }
        }else{
            judgeFlag=false;
        }
        return judgeFlag;
    }

    //提交
    function save() {
        var judgeFlag=judgeArray(solveArray(codeArray),initArray);
        var flag=false;
        $('#form').form('submit', {
            url: '<%=basePath %>applyns/updateNsInfo',
            onSubmit: function (param) {
                var isValid = $(this).form('validate');
                if (!isValid) {
                    flag=false;
                    bank.ajaxMessage('请检查是否有漏填或错填内容！');
                }else if(!judgeFlag){
                    flag=false;
                    bank.alertMessage("附件所有必填项不能为空！")
                }else{
                    flag=true;
                }
                return flag;
            },
            success: function (data) {
                var data = JSON.parse(data);
                if (data.result == "success") {
                    $(".over").show();
                    var applyid = data.applyid;
                    currentIndex=0;
                    send(applyid);
                } else {
                    bank.ajaxMessage(data.result)
                }
            },
            error: function (data) {
                bank.alertMessage("数据库连接失败，请稍后再试");
            }
        }, 'json');
    }

    //图片处理
    $("body").on('click','.uploader-list img',function(){
        //创建一个矩形区域,获取此图片相对偏移量
        $(".imgOperate").show();
        $(".imgOperate img")[0].src=$(this)[0].src;
        aimDiv=$(".imgOperate");
        aimImg=$(".imgOperate img");
        aimDiv.rotation=0;
        if(changeImg!=($(this)[0].src)){
            changeImg=$(this)[0].src;
            aimImg.css({
                width:$(this)[0].width,
                height:$(this)[0].height
            });
            aimImg.width=$(this)[0].width;
            aimImg.height=$(this)[0].height;
        }else{
            aimImg.width=aimImg.width();
            aimImg.height=aimImg.height();
        }

    });
    $("body").on( 'click', '.imgOperate span', function() {
        var index = $(this).index(),deg ;
        var supportTransition=bank.supportTransition;
        switch (index) {
            case 0:
                aimDiv.rotation -= 90;
                break;

            case 1:
                aimDiv.rotation += 90;
                break;

            case 2:
                aimImg.width+=10;
                aimImg.height+=10;
                //放大缩小
                aimImg.css({
                    width:aimImg.width,
                    height:aimImg.height
                });
                break;
            case 3:
                aimImg.width-=10;
                aimImg.height-=10;
                //放大缩小
                aimImg.css({
                    width:aimImg.width,
                    height:aimImg.height
                });
                break;
        }
        //旋转
        if (supportTransition) {
            deg = 'rotate(' + aimDiv.rotation+ 'deg)';
            $('.optImg').css({
                '-webkit-transform': deg,
                '-mos-transform': deg,
                '-o-transform': deg,
                'transform': deg
            });
        } else {
            $('.optImg').css( 'filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation='+ (~~((aimDiv.rotation/90)%4 + 4)%4) +')');
        }
    });
    $("body").on('click','.close',function(){
        $(".imgOperate").hide();
    });

    //tab切换
    $(".step li").on("click", function (e) {
        e.preventDefault();
        num = $(this).index();
        changeDiv(num);
        uploader.refresh();//10
    });
    $(".left").on("click",function(){
        num--;
        if(num<= 0){
            num = 0;
        }
        changeDiv(num);
        uploader.refresh();//10
    })
    $(".right").on("click",function(){
        num++;
        if(num>= 3){
            num = 3;
        }
        changeDiv(num);
        uploader.refresh();//10
    })
    function changeDiv (num) {
        $(".step li").eq(num).children("div").removeClass("step-img").addClass("step-img-green");
        $(".step li").eq(num).siblings().children("div").addClass("step-img").removeClass("step-img-green");
        $(".step li").eq(num).children("p").removeClass("blue");
        $(".step li").eq(num).siblings().children("p").addClass("blue");
        $(".process .imgparent img:lt("+(num+1)+")").show();
        $(".process .imgparent img:gt("+(num)+")").hide();
        $("#inner div").eq(num).show().siblings().hide();
    }

    //添加家庭成员
    function addPerson() {
        var i = $("#addPerson ul").length + 1;
        if(person){
            i++;
            $("#apJtrk").textbox('setValue',(i+1));
            var perString= $('<ul class="input-group windowInner">' +
                '<legend>同住家庭成员情况</legend>' +
                '<li>' +
                '<input class="easyui-combobox" name="applyFamilyMembers['+i+'].afmYsqrgx" id="applyFamilyMembers'+i+'afmYsqrgx" style="width: 92%" data-options="label:\'关系:\',valueField:\'piItemname\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/findFamylyOnlypozn\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\',onSelect:selectMemberHy">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmXm" id="applyFamilyMembers' + i + 'afmXm" style="width: 92%" data-options="label:\'姓名:\',required:true,validType:[\'empty\',\'chinese\',\'specialCharacter\'],events:{blur:checkUser}">' +
                '</li>' +
                '<li class="readonly">' +
                '<input class="easyui-datebox" name="applyFamilyMembers[' + i + '].afmCsny" id="applyFamilyMembers' + i + 'afmCsny" style="width: 92%" data-options="label:\'出生年月:\',required:true,readonly:true,editable:false">' +
                '</li>' +
                '<li class="readonly">' +
                '<input class="easyui-combobox" name="applyFamilyMembers['+ i + '].afmHyzk" id="applyFamilyMembers'+ i + 'afmHyzk" style="width: 92%" data-options="label:\'婚姻状况:\',valueField:\'piItemcode\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/getOptions?parmSetcode=07\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\',readonly:true">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmGzdw" style="width: 92%" data-options="label:\'工作单位:\',required:true,prompt:\'请输入单位全称\',validType:[\'empty\']">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmSfzh" id="applyFamilyMembers' + i + 'afmSfzh" style="width: 92%" data-options="label:\'身份证号码:\',required:true,validType:[\'sfz\',\'empty\'],events:{blur:checkUser}">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmNsr" id="applyFamilyMembers' + i + 'afmNsr" value="0" style="width: 92%" data-options="label:\'年收入(元):\',required:true,validType:[\'number\',\'empty\'],events:{keyup:changeSr}">' +
                '</li>' +
                '</ul>').appendTo("#addPerson");
            $.parser.parse(perString);
            changeMj(i);
            changeSr(i)
        }else{
            bank.alertMessage("婚姻状况未填或未婚状态，不能添加家庭成员")
        }
    }

    //删除同住人口
    function delPerson() {
        var i = $("#addPerson ul").length + 1;
        if(i>0){
            i--;
        }
        $("#apJtrk").textbox('setValue',(i+1));
        $("#addPerson").find("ul:last").remove();
        changeMj(i);
        changeSr(i)
    }
    /********************************************************************************************************************************************************************************************/
    //数据回显
    $(function () {
        $.ajax({
            url:'<%=basePath %>appove/getNsApproveDetail',
            type:'post',
            dataType:'json',
            data:{
                aptype:"${applyType}",
                aplid:"${applyId}"
            },
            success:function(data){
                setPerson(data);//加载同住家庭成员信息
                setValue($('#form'),data);//处理回填问题
                setImage(data); //回填图片
            },error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试")
            }
        })
    });
    //回填家庭成员 i = 1 ,本人为0
    function setPerson(data) {
        if(data.applyFamilyMembers.length>1){
            for(var i = 1; i< data.applyFamilyMembers.length;i++){
                $('<ul class="input-group windowInner">' +
                    '<legend>同住家庭成员情况</legend>' +
                    '<li style="display: none">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmId" id="applyFamilyMembers'+i+'afmId" style="width: 92%">' +
                    '</li>' +
                    '<li style="display: none">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmSqid" id="applyFamilyMembers'+i+'afmSqid"  style="width: 92%">' +
                    '</li>' +
                    '<li>' +
                    '<input class="easyui-combobox" name="applyFamilyMembers['+i+'].afmYsqrgx" id="applyFamilyMembers'+i+'afmYsqrgx" style="width: 92%" data-options="label:\'关系:\',valueField:\'piItemname\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/findFamylyOnlypozn\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\',onSelect:selectMemberHy">' +
                    '</li>' +
                    '<li>' +
                    '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmXm" id="applyFamilyMembers' + i + 'afmXm" style="width: 92%" data-options="label:\'姓名:\',required:true,validType:[\'empty\',\'chinese\',\'specialCharacter\'],events:{blur:checkUser}">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-datebox" name="applyFamilyMembers[' + i + '].afmCsny" id="applyFamilyMembers' + i + 'afmCsny" style="width: 92%" data-options="label:\'出生年月:\',readonly:true,editable:false">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-combobox" name="applyFamilyMembers['+ i + '].afmHyzk" id="applyFamilyMembers'+ i + 'afmHyzk" style="width: 92%" data-options="label:\'婚姻状况:\',valueField:\'piItemcode\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/getOptions?parmSetcode=07\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\',readonly:true">' +
                    '</li>' +
                    '<li>' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmGzdw" id="applyFamilyMembers'+i+'afmGzdw" style="width: 92%" data-options="label:\'工作单位:\',required:true,prompt:\'请输入单位全称\'">' +
                    '</li>' +
                    '<li>' +
                    '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmSfzh" id="applyFamilyMembers' + i + 'afmSfzh" style="width: 92%" data-options="label:\'身份证号码:\',required:true,validType:[\'sfz\',\'empty\'],events:{blur:checkUser}">' +
                    '</li>' +
                    '<li>' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmNsr" id="applyFamilyMembers'+i+'afmNsr" style="width: 92%" data-options="label:\'年收入(元):\',required:true,validType:\'number\',events:{keyup:changeSr}">' +
                    '</li>' +
                    '</ul>').appendTo("#addPerson");
                $.parser.parse($("#addPerson"))
            }
        }
    }
    //回填数据
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
                            if(typeClass.indexOf('combobox')!==-1){
                                $('#'+idArray[0]+idArray[1]+'').combobox('setValue',(data[x])[idArray[1]])
                            }else if(typeClass.indexOf('datebox')!==-1){
                                $('#'+idArray[0]+idArray[1]+'').datebox('setValue',(data[x])[idArray[1]])
                            }else{
                                $('#'+idArray[0]+idArray[1]+'').textbox('setValue',(data[x])[idArray[1]])
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
                            if(typeClass.indexOf('combobox')!==-1){
                                $('#'+idArray[0]+idArray[1]+idArray[2]+'').combobox('setValue',(data[x])[indexCode][idArray[2]])
                            }else if(typeClass.indexOf('datebox')!==-1){
                                $('#'+idArray[0]+idArray[1]+idArray[2]+'').datebox('setValue',(data[x])[indexCode][idArray[2]])
                            }else{
                                $('#'+idArray[0]+idArray[1]+idArray[2]+'').textbox('setValue',(data[x])[indexCode][idArray[2]])
                            }
                        }

                    }
                });
            }else{
                $("#form").form('load',data);//直接赋值
            }
        }
    }
    //图片回显
    function setImage(data) {
        if(data.volList.length>0){
            var volList=data.volList;
            for(var i=0;i<volList.length;i++){
                for(var k=0;k<volList[i].volelearcDtls.length;k++){
                    var imageUrl = "<%=basePath%>"+(volList[i].volelearcDtls)[k].imgname;
                    var height = (volList[i].volelearcDtls)[k].height;
                    var width = (volList[i].volelearcDtls)[k].width;
                    var index=$($("#table tr:contains('"+volList[i].elearcname+"')")).index()-1;
                    initArray.push(index);
                    $("#table tr:contains('"+volList[i].elearcname+"')").find(".uploader-list").append('<div id="' + (volList[i].volelearcDtls)[k].volelearcdtlId + '" class="file-item thumbnail id">' +
                        '<img src="'+imageUrl+'" data-width="'+width+'" data-height="'+height+'" >' +
                        '<div class="info" onclick="delList($(this))">' + "删除" + '</div>' +
                        '</div>');
                }
            }
        }
    }
    //图片删除
    function delList(obj) {
        var id = obj.parents().attr("id");
        var code=obj.parent().parent().attr("id").substring(8);
        $.ajax({
            url:'<%=basePath %>volel/deleteDetail',
            type:'post',
            dataType:'json',
            data:{
                id:id
            },
            success:function(data){
                obj.parents(".thumbnail").remove();
                var index=bank.getArrayIndex(initArray,Number(code));
                initArray.splice(index,1);
            },error:function(){
                bank.alertMessage("数据库连接失败，请稍后再试")
            }
        })
    }
    //街区联动
    function selectSSQ(record){
        $("#apJdbsc").combobox({
            url:'<%=basePath%>ParmItem/findAllJd',
            onBeforeLoad:function(param){
                param.qid=record.piItemcode;
            }
        });
    }
    //计算收入和面积
    function changeMj(obj){
        var i = $("#addPerson ul").length + 1;
        var allMj;
        if(typeof(obj)=="number"){
            allMj=$("#applyFamilyHouses0afhMj").textbox("getValue");
        }else{
            allMj=$(this).val();
        }
        var rjmj=Number(Number(allMj)/Number(i+1)).toFixed(2);
        $("#applyFamilyHouses0afhRjmj").textbox('setValue',rjmj);
    }
    function changeSr(obj){
        var i = $("#addPerson ul").length + 1;
        var sum=0,average=0,yuan=0;
        for(var j=0;j< i;j++){
            if($("#applyFamilyMembers"+j+"afmNsr").val()!=undefined){
                yuan= $("#applyFamilyMembers"+j+"afmNsr").textbox('getValue')
            }else{
                yuan=0;
            }
            sum+=Number(yuan);
        }
        if(typeof(obj)=="object"){
            var id=$(this).parent().siblings('input').attr("id");
            var oldValue=$('#'+id+'').textbox('getValue');
            sum=sum-Number(oldValue)+Number($(this).val());
        }
        average=Number(Number(sum)/(i+1)/12).toFixed(2);
        //计算年收入，平均收入
        $("#apJtnsr").textbox('setValue',sum);
        $("#apRjysr").textbox('setValue',average);
    }
    //验证身份证信息是否合法，不合法清空
    function checkUser(){
        var name=$(this).siblings().attr('name');
        var id=name.substring(name.indexOf('[')+1,name.indexOf(']'));
        if(name.indexOf('afmSfzh')>0){
            var  sfzh=$(this).val();
            var username=$("#applyFamilyMembers"+id+"afmXm").textbox('getValue');
        }else{
            var  username=$(this).val();
            var sfzh=$("#applyFamilyMembers"+id+"afmSfzh").textbox('getValue');//身份证
        }
        if(username.length==0||sfzh.length==0){
            $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue','');
            return false
        }else{
            $.ajax({
                url:'<%=basePath %>applyUserinfo/checkUser',
                type:'post',
                data:{
                    userName:username,
                    sfzh:sfzh
                },
                success:function(result){
                    if(result=="success"){
                        var birthday= bank.setBirthday(sfzh);
                        $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue',birthday);
                        judgeByAge(birthday,id)
                    }else{
                        bank.alertMessage(result);
                    }
                }
            })
        }

    }
    //先输入了姓名后选择关系
    function judgeByAge(birthday,id){
        var relation=$("#applyFamilyMembers"+id+"afmYsqrgx").combobox('getValue');
        if(relation=="子女"){
            if(new Date().getFullYear()-(birthday.substring(0,4))>18){
                $("#applyFamilyMembers"+id+"afmXm").textbox('setValue','');
                $("#applyFamilyMembers"+id+"afmSfzh").textbox('setValue');
                $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue','');//清空
                bank.alertMessage('子女年龄大于18岁不能添加')
            }
        }
    }
    //根据申请人婚姻状况判断
    function selectHY(record){
        var i = $("#addPerson ul").length + 1;
        //已婚
        if(record.piItemcode=="2"){
            person=true;
        }
        //未婚
        if(record.piItemcode=="1"){
            person=false;
            $("#addPerson").html('');
            i=0;
            $("#apJtrk").textbox('setValue',(i+1));
            changeMj(i);
            changeSr(i)
        }else{
            person=true;
        }
    }
    //根据新增家庭成员婚姻状况
    function selectMemberHy(record){
        var name=$(this).attr('comboname');
        var id=name.substring(name.indexOf('[')+1,name.indexOf(']'));
        var val=$("#applyFamilyMembers"+id+"afmNsr").textbox('getValue');
        //配偶 回填已婚
        if(record.piItemcode=="0"){
            $("#applyFamilyMembers"+id+"afmHyzk").combobox('setValue',2);
            $("#applyFamilyMembers"+id+"afmNsr").textbox('setValue',val);
        }
        //子女 判断18岁
        if(record.piItemcode=="3"){
            $("#applyFamilyMembers"+id+"afmNsr").textbox('setValue',0);
            $("#applyFamilyMembers"+id+"afmHyzk").combobox('setValue',1);
            var srn=$("#applyFamilyMembers"+id+"afmCsny").textbox('getValue');
            if(srn.length>0){
                if(new Date().getFullYear()-(srn.substring(0,4))>18){
                    $("#applyFamilyMembers"+id+"afmXm").textbox('setValue','');
                    $("#applyFamilyMembers"+id+"afmSfzh").textbox('setValue');
                    $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue','');//清空
                    bank.alertMessage('子女年龄大于18岁不能添加');
                }
            }

        }

    }
    function view(type){
        bank.viewAttach(type,"<%=basePath%>path/toAttachment","查看详情",500,300,true)
    }
</script>