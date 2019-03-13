<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>低保特困公租房申请</title>
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
    <span class="top-title">公共租赁住房（低保、特困家庭）申请</span>
    <div id="top">
        <form method="post" id="form" class="easyui-form" enctype="multipart/form-data">
            <ul class="input-group">
                <li>
                    <input class="easyui-combobox" name="apSsq" style="width: 92%" data-options="label:'户籍所在区（县）:',required:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/selectSsqExceptCenter',onSelect:selectSSQ,editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                </li>
                <li>
                    <input class="easyui-combobox" name="apJdbsc" id="apJdbsc" style="width: 92%" data-options="label:'街道办事处:',required:true,valueField:'piItemcode',textField:'piItemname',editable:false,panelHeight:'auto',panelMaxHeight:'280'" >
                </li>
                <li>
                    <input class="easyui-textbox" name="apSqjwh" style="width: 92%" data-options="label:'户籍所在社区:',required:true,validType:['chinese','empty']">
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
                        <p class="blue">家庭住房情况</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>3</span>
                        </div>
                        <p class="blue">拆迁与低保</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>4</span>
                        </div>
                        <p class="blue">同住家庭成员情况</p>
                    </li>
                    <li>
                        <div class="step-img">
                            <span>5</span>
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
                        <img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none"/>
                    </div>
                </div>
            </div>
            <!--填写内容区-->
            <div id="inner">
                <div>
                    <ul class="input-group windowInner">
                        <legend>申请人信息</legend>
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmXm" value="${sessionScope.applyUserinfo.username}" style="width: 92%" data-options="label:'姓名:',required:true,readonly:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmSfzh" value="${sessionScope.applyUserinfo.sfzh}" style="width: 92%" data-options="label:'身份证号码:',required:true,validType:['sfz','empty'],readonly:true">
                        </li>
                        <li class="readonly">
                            <select class="easyui-combobox" name="applyFamilyMembers[0].afmXb" value="${sessionScope.applyUserinfo.sex}" style="width: 92%" data-options="label:'性别:',required:true,readonly:true,editable:false,panelHeight:'auto'">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </li>
                        <li>
                            <input class="easyui-combobox" name="applyFamilyMembers[0].afmHyzk" style="width: 92%"
                                   data-options="label:'婚姻状况:',required:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=07',
                                   editable:false,panelHeight:'auto',panelMaxHeight:'280',onSelect:selecthyzk">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmGzdw" style="width: 92%" data-options="label:'工作单位:',required:true,prompt:'请输入单位全称'">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmLxdh" value="${sessionScope.applyUserinfo.linktel}" style="width: 92%" data-options="label:'联系电话:',required:true,validType:['phone','empty'],readonly:true">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmNsr" id="applyFamilyMembers0afmNsr" style="width: 92%"
                                   data-options="label:'年收入(元):',required:true,validType:['number','empty'],events:{keyup:changeSr}">
                        </li>
                        <li>
                            <label style="width: 130px;display: inline-block;float: left;margin-left: -3px">是否特殊家庭:</label>
                            <input type="checkbox" name="apTsjts" value="1" data-options="required:true"/>烈属&nbsp;&nbsp;
                            <input type="checkbox" name="apTsjts" value="2" data-options="required:true"/>残疾人&nbsp;&nbsp;
                            <input type="checkbox" name="apTsjts" value="3" data-options="required:true"/>孤寡老人&nbsp;&nbsp;
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>配偶信息</legend>
                       <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmXm" id="applyFamilyMembers1afmXm" style="width: 92%" data-options="label:'姓名:',validType:['chinese','specialCharacter'],events:{blur:checkUser}">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmSfzh" id="applyFamilyMembers1afmSfzh" style="width: 92%" data-options="label:'身份证号码:',validType:'sfz',events:{blur:checkUser}">
                        </li>
                        <li>
                            <select class="easyui-combobox" name="applyFamilyMembers[1].afmXb" style="width: 92%" data-options="label:'性别:',editable:false,panelHeight:'auto'">
                                <option value="女">女</option>
                                <option value="男">男</option>
                            </select>
                        </li>
                         <li>
                             <input class="easyui-textbox" name="applyFamilyMembers[1].afmGzdw" style="width: 92%" data-options="label:'工作单位:',prompt:'请输入单位全称'">
                         </li>
                         <li>
                             <input class="easyui-textbox" name="applyFamilyMembers[1].afmLxdh" id="applyFamilyMembers1afmLxdh" style="width: 92%" data-options="label:'联系电话:',validType:'phone'">
                         </li>
                         <li class="readonly">
                         <select class="easyui-combobox" name="applyFamilyMembers[1].afmYsqrgx" style="width: 92%" data-options="label:'关系:',valueField:'piItemname',textField:'piItemname',panelHeight:'auto',readonly:true,editable:false">' +
                             <option value="0">配偶</option>
                             </select>
                         </li>
                         <li>
                             <input class="easyui-textbox" name="applyFamilyMembers[1].afmNsr" id="applyFamilyMembers1afmNsr" style="width: 92%"
                                    data-options="label:'年收入(元):',validType:['number','empty'],events:{keyup:changeSr}">
                         </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>户籍信息</legend>
                        <li>
                            <input class="easyui-textbox" name="apSqhjnx" style="width: 92%" data-options="label:'户籍年限(年)',required:true,validType:['numberZ','limitHJ[5]','empty']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apJtnsr" id="apJtnsr" style="width: 92%" data-options="label:'家庭年收入(元):',required:true,readonly:true,validType:['number','empty']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apJtrk" id="apJtrk"  value="1" style="width: 92%" data-options="label:'家庭人口:',required:true,readonly:true,validType:['numberZ','empty']">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="apRjysr" id="apRjysr" style="width: 92%" data-options="label:'人均月收入(元):',required:true,readonly:true,validType:['number','empty']">
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>工作单位信息</legend>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.legelrep" style="width:92%" data-options="label:'法定代表人',prompt:'非必填',validType:['chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.bsls" style="width: 92%" data-options="label:'社会统一信用代码:',prompt:'非必填',validType:'xyCode'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.entag" style="width:92%" data-options="label:'委托代理人',prompt:'非必填',validType:['chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.tel" style="width:92%" data-options="label:'手机号码',validType:'phone',prompt:'非必填'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyUnit.address" style="width:92%" data-options="label:'联系住址',prompt:'非必填'">
                        </li>
                    </ul>
                    <p class="sbumit right">
                        <span><a href="#">下一步</a></span>
                    </p>
                </div>
                <div style="display: none;">
                    <ul class="input-group windowInner">
                        <legend>家庭现住房情况</legend>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhZl" style="width: 92%"
                                   data-options="label:'房屋地址:',required:true,validType:['empty']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhCqr" style="width: 92%"
                                   data-options="label:'产权人:',required:true,validType:['empty','chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhMj" id="applyFamilyHouses0afhMj" style="width: 92%"
                                   data-options="label:'建筑面积(m²):',required:true,validType:['number','empty'],events:{keyup:changeMj}">
                        </li>
                        <li class="readonly">
                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhRjmj" id="applyFamilyHouses0afhRjmj" style="width: 92%"
                                   data-options="label:'人均建筑面积(m²):',required:true,readonly:true,validType:['number','empty']">
                        </li>
                        <li>
                            <input class="easyui-combobox" name="applyFamilyHouses[0].afhZfxz" id="applyFamilyHouses0afhZfxz" style="width: 92%" data-options="label:'现住房性质:',required:true,valueField:'piItemcode',textField:'piItemname',
                            url:'<%=basePath %>ParmItem/getOptions?parmSetcode=01',editable:false,panelHeight:'auto',panelMaxHeight:'280'">
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>住房变更情况</legend>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcYzfzl" style="width: 92%"
                                   data-options="label:'原住房地址:'">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcCqr" style="width: 92%"
                                   data-options="label:'原产权人:',validType:['chinese','specialCharacter']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcJzmj" style="width: 92%"
                                   data-options="label:'建筑面积(m²):'">
                        </li>
                        <li>
                            <input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="拆迁" onclick="change()"/>拆迁&nbsp;&nbsp;
                            <input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="转让" onclick="changeSecond()"/>转让 (时间)
                            <input class="easyui-datebox" name="applyFamilyHouseChange.afhcBgsj" style="width: 58%" data-options="editable:false">
                        </li>
                        <li style="display: none" id="cq">
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcZrbcje" style="width: 92%" data-options="label:'货币补偿金额(元):',validType:'number'">
                        </li>
                    </ul>
                    <p class="sbumit right">
                        <span><a href="#">下一步</a></span>
                    </p>
                </div>

                <div style="display: none;">
                    <ul class="input-group windowInner">
                        <legend>安置信息</legend>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcAzfzl" style="width: 92%"
                                   data-options="label:'安置房地址:',required:true,validType:['empty']">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcAzfjzmj" style="width: 92%"
                                   data-options="label:'建筑面积(m²):',required:true,validType:['number','empty']">
                        </li>
                    </ul>
                    <ul class="input-group windowInner">
                        <legend>低保信息</legend>
                        <li>
                            <input class="easyui-textbox" name="apDbzbh" style="width: 92%"
                                   data-options="label:'低保证编号:',required:true">
                        </li>
                        <li>
                            <input class="easyui-textbox" name="apLqrs" style="width: 92%"
                                   data-options="label:'低保领取人数:',required:true,validType:['numberZ','empty']">
                        </li>
                        <li>
                            <input class="easyui-datebox" name="apFzsj" style="width: 92%"
                                   data-options="label:'低保发证时间',required:true,editable:false,validType:['minDate']">
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
                            <td class="tdname"><span class="name">收入情况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(0)">查看详情</span></td>
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
                            <td class="tdname"><span class="name">住房状况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(1)">查看详情</span></td>
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
                            <td class="tdname"><span class="name">家庭成员身份证</span><span class="red">*(必填)</span></td>
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
                            <td class="tdname"><span class="name">家庭成员户口簿(含首页)</span><span class="red">*(必填)</span></td>
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
                            <td class="tdname"><span class="name">合法有效家庭成员之间的赡养、抚养、扶养关系及共同生活的证明</span></td>
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
                            <td class="tdname"><span class="name">反映家庭财产状况的有关证明材料</span></td>
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
                            <td class="tdname"><span class="name">申请人申报财产真实性书面承诺</span></td>
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
                            <td class="tdname"><span class="name">特殊情况证明</span><span class="aspan" onclick="view(3)">查看详情</span></td>
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
                            <td class="tdname"><span class="name">婚姻情况证明</span><span class="red">*(必填)</span><span class="aspan" onclick="view(2)">查看详情</span></td>
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
                            <td class="tdname"><span class="name">户籍所在地社区公示证明</span><span class="red">*(必填)</span></td>
                            <td class="addJpg">
                                <div>
                                    <div class="fileMark9  filePicker" onclick="add(9)">添加附件</div>
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
                                    <div class="fileMark10  filePicker" onclick="add(10)">添加附件</div>
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
    .process img {
        width: 21% !important;
        margin-right: -1.6%;
        height: 20px;
    }
</style>
<script>
    var person=false;
    var i = 0, j=0,sucIndex=0,currentIndex=0,num = "",codeArray=[],nameArray = [];
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
            '<img >' +
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
        codeArray.push(index);//执行3次
    }

    function send(applyid){
        //上传后才执行
        var newArray=solveArray(codeArray);
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
    function judgeArray(newArray){
        var judgeFlag=true;
        var bitianArray=[0,1,2,3,8,9];
        if(newArray.length>0){
            for(var x in bitianArray){
                if(typeof(bank.getArrayIndex(newArray,bitianArray[x]))=="boolean"){
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
        var judgeFlag=judgeArray(solveArray(codeArray));
        var flag=false;
        var apTsjt=[];
        var jzxz=$.trim($("#applyFamilyHouses0afhZfxz").combobox('getValue'));
        var pjmj=$.trim($("#applyFamilyHouses0afhRjmj").textbox('getValue'));
        //是否特殊家庭处理
        $('input[type=checkbox][name=apTsjts]').each(function() {
            if($(this).is(':checked')){
                apTsjt.push($(this).val())
            }
        });
        $('#form').form('submit', {
            url: '<%=basePath %>apply/addApplyInfo',
            onSubmit: function (param) {
                param.apSqlb = ${applyType};
                var isValid = $(this).form('validate');
                if (!isValid) {
                    flag=false;
                    bank.ajaxMessage('请检查是否有漏填或错填内容！');
                }else if(!judgeFlag){
                    flag=false;
                    bank.alertMessage("附件所有必填项不能为空！")
                }else{
                    if(jzxz=="4"&&Number(pjmj)>10){
                        flag=false;
                        bank.alertMessage("自住房平均建筑面积大于10不能申请");
                    }else if(apTsjt.length==0){
                        flag=false;
                        bank.alertMessage("请选择特殊家庭类型！");
                    }else{
                        flag=true;
                        param.apTsjt=apTsjt.toString();
                    }
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
        if(num>= 4){
            num = 4;
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
    function change(){
        var text = $("#cq label").text("货币补偿金额(元):");
        $("#cq").show();
    }
    function changeSecond(){
        var text = $("#cq label").text("转让金额(元):");
        $("#cq").show();

    }
    //添加家庭成员
    function addPerson() {
        if(person){
            i++;
            $("#apJtrk").textbox('setValue',(i+1));
            var perString=$('<ul class="input-group windowInner">' +
                '<legend>同住家庭成员情况</legend>' +
                '<li>' +
                '<select class="easyui-combobox" name="applyFamilyMembers['+i+'].afmYsqrgx" style="width: 92%" data-options="label:\'关系:\',valueField:\'piItemname\',textField:\'piItemname\',panelHeight:\'auto\',required:true,editable:false">' +
                '<option value="3">子女</option>'+
                '</select>'+
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmXm" id="applyFamilyMembers' + i + 'afmXm" style="width: 92%" data-options="label:\'姓名:\',required:true,validType:[\'chinese\',\'specialCharacter\'],events:{blur:checkUser}">' +
                '</li>' +
                '<li class="readonly">' +
                '<input class="easyui-datebox" name="applyFamilyMembers[' + i + '].afmCsny" id="applyFamilyMembers' + i + 'afmCsny" style="width: 92%" data-options="label:\'出生年月:\',required:true,readonly:true">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-combobox" name="applyFamilyMembers[' + i + '].afmHyzk" style="width: 92%" data-options="label:\'婚姻状况:\',valueField:\'piItemcode\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/getOptions?parmSetcode=07\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\'">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmGzdw" style="width: 92%" data-options="label:\'工作单位:\',prompt:\'请输入单位全称\'">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmSfzh" id="applyFamilyMembers' + i + 'afmSfzh" style="width: 92%" data-options="label:\'身份号码:\',required:true,validType:[\'sfz\'],events:{blur:checkUser}">' +
                '</li>' +
                '<li>' +
                '<input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmNsr" id="applyFamilyMembers' + i + 'afmNsr" value="0" style="width: 92%" data-options="label:\'年收入(元):\',required:true,events:{keyup:changeSr}">' +
                '</li>' +
                '</ul>').appendTo("#addPerson");
            $.parser.parse(perString);
            changeSr(i);
            changeMj(i);
        }else{
            bank.alertMessage("未婚状态下不能增加家庭成员！")
        }

    }
    //删除同住人口
    function delPerson() {
        if(i>0){
            i--;
        }
        $("#apJtrk").textbox('setValue',(i+1));
        $("#addPerson").find("ul:last").remove();
        changeSr(i);
        changeMj(i);
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
    function changeMj(obj){
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
        var sum=0,average=0,yuan=0;
        for(var j=0;j<=i;j++){
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
    function selecthyzk(record){
        //已婚
        if(record.piItemcode=="2"){
            if(i==0){
                i=i+1;
            }
            $("#apJtrk").textbox('setValue',(i+1));
            person=true;
            $('#applyFamilyMembers1afmXm,#applyFamilyMembers1afmSfzh,#applyFamilyMembers1afmLxdh,#applyFamilyMembers1afmNsr').textbox({required:true});
        }else if(record.piItemcode=="1"){//未婚
            $("#apJtrk").textbox('setValue',1);
            i=0;
            person=false;
            $("#addPerson").html("");
            $('#applyFamilyMembers1afmXm,#applyFamilyMembers1afmSfzh,#applyFamilyMembers1afmLxdh,#applyFamilyMembers1afmNsr').textbox({required:false});
        }else{
             if(i==0){
                 i=i+1;
             }
            $("#apJtrk").textbox('setValue',(i+1));
            person=true;
            $('#applyFamilyMembers1afmXm,#applyFamilyMembers1afmSfzh,#applyFamilyMembers1afmLxdh,#applyFamilyMembers1afmNsr').textbox({required:false});

        }

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
                    }else{
                        bank.alertMessage(result);
                    }
                }
            })
        }

    }
    function view(type){
        bank.viewAttach(type,"<%=basePath%>path/toAttachment","查看详情",500,300,true)
    }
</script>