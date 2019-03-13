<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page language="java" import="java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>我的申请</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/mui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/easyui/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/easyui/mobile.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/easyui/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/webuploader.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>srcApp/css/common.css"/>
</head>
<body>
<div class="easyui-navpanel">
    <!-- 主界面不动、菜单移动 -->
    <!-- 侧滑导航根容器 -->
    <div class="mui-off-canvas-wrap mui-draggable mui-slide-in">
        <!-- 菜单容器 -->
        <aside class="mui-off-canvas-left" id="offCanvasSide">
            <div class="mui-scroll-wrapper">
                <div class="mui-scroll">
                    <!-- 菜单具体展示内容 -->
                    <ul class="mui-table-view">
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">我的申请</a>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">我的年审</a>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">个人信息</a>
                        </li>
                        <li class="mui-table-view-cell">
                            <a class="mui-navigate-right">修改密码</a>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
        <!-- 主页面容器 -->
        <div class="mui-inner-wrap">
            <!-- 主页面标题 -->
            <header class="mui-bar mui-bar-nav">
                <a class="mui-icon mui-action-menu mui-icon-bars mui-pull-left" href="#offCanvasSide"></a>
                <h1 class="mui-title">徐州市市区经济适用住房申请须知</h1>
            </header>
            <nav class="mui-bar mui-bar-tab">
                <a class="mui-tab-item mui-active" id="apply">
                    <span class="mui-icon mui-icon-home"></span>
                    <span class="mui-tab-label">我的申请</span>
                </a>
                <a class="mui-tab-item" id="audit">
                    <span class="mui-icon mui-icon-phone"></span>
                    <span class="mui-tab-label">我的年审</span>
                </a>
                <a class="mui-tab-item" id="userInfo">
                    <span class="mui-icon mui-icon-contact"></span>
                    <span class="mui-tab-label">个人信息</span>
                </a>
                <a class="mui-tab-item" id="updatePwd">
                    <span class="mui-icon mui-icon-gear"></span>
                    <span class="mui-tab-label">修改密码</span>
                </a>
            </nav>
            <div class="mui-content mui-scroll-wrapper" id="pullrefresh">
                <div class="mui-scroll">
                    <form method="post" id="form" class="easyui-form" enctype="multipart/form-data" >
                        <div id="wrap0">
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">在线申请用户须知</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-row" style="padding:5px">根据《徐州市市区经济适用住房管理办法》徐政规[2009]2号）的有关规定，现将本市经济适用住房申请有关事项告知如下：</div>
                                    <div class="mui-row" style="padding:5px">一、徐州市经济适用住房保障范围</div>
                                    <div class="mui-row" style="padding:5px">徐州市市区经济适用住房主要面向在市区（鼓楼区、云龙区、泉山区、经济技术开发区）范围内符合条件的低收入、中等偏下收入家庭。</div>
                                    <div class="mui-row" style="padding:5px">申请人应当为具有完全民事行为能力的人，特殊情况可委托代理人。</div>
                                    <div class="mui-row" style="padding:5px">二、申请条件</div>
                                    <div class="mui-row" style="padding:5px">1、具有市区城镇常住户口5年以上；</div>
                                    <div class="mui-row" style="padding:5px">2、家庭人均月收入低于2065元；</div>
                                    <div class="mui-row" style="padding:5px">3、家庭人均住房建筑面积低于15平方米（含15平方米）。</div>
                                    <div class="mui-row" style="padding:5px">年满35周岁的单身人员可作为独立家庭进行申请。申请家庭正在享受其他类型住房保障的，不得再申请购买经济适用住房。</div>
                                    <div class="mui-row" style="padding:5px">三、申请所需材料</div>
                                    <div class="mui-row" style="padding:5px">1、申请人户口所在地社区公示证明；</div>
                                    <div class="mui-row" style="padding:5px">2、收入情况的证明材料（有单位的由单位出具证明【6个月以上单位发放工资的银行流水单】，无单位的由社区出具证明。在法定劳动年龄内并有劳动能力的申请人，本人不能提供收入证明的，以及单位出具收入证明低于上年度市区最低工资标准或无法计算的，均按照市区上年度最低工资标准计算收入）；</div>
                                    <div class="mui-row" style="padding:5px">3、住房状况的证明材料（包括产权证、他项权证、公房租约、已转让和已领取拆迁补偿款房屋及已签订合同尚未交付房屋等相关资料，无房的出具无房证明）；</div>
                                    <div class="mui-row" style="padding:5px">4、家庭成员身份证和户口簿；</div>
                                    <div class="mui-row" style="padding:5px">5、合法有效的家庭成员之间的赡养、抚养、扶养关系及共同生活的证明；</div>
                                    <div class="mui-row" style="padding:5px">6、反映家庭财产状况的有关证明材料（申请人应申报家庭存款、汽车、股票、公积金、开办企业等情况，并对申报财产的真实性作出书面承诺）；</div>
                                    <div class="mui-row" style="padding:5px">7、申请人诚信具结书；</div>
                                    <div class="mui-row" style="padding:5px">8、按规定需要提交的其他证明材料。</div>
                                    <div class="mui-row" style="padding:5px">四、申请审核程序</div>
                                    <div class="mui-row" style="padding:5px">1、申请人向户口所在地的区街道办事处住房保障服务窗口提出申请，住保窗口同时组织所辖社区居委会对申请人递交的材料进行初审，并就家庭有关情况进行调查确认，对是否符合规定条件提出审核意见，并在社区进行公示，公示期限为10天。经公示无异议或者异议不成立的，申请人登录徐州市住房保障系统，按系统提示要求进行注册、填写资料、提交上传各项证明资料（原件拍照后上传）。 </div>
                                    <div class="mui-row" style="padding:5px">2、申请人户口所在地的区街道办事处住保窗口工作人员凭账号和密码登录徐州市住房保障系统，对申请人提交的资料进行本级审核，5个工作日内完成对申请人提交的材料及有关情况的调查核实。审核通过的，在审核系统上签署审核通过意见并签字；对审核不通过的，审核人填写初审不通过原因，由审核系统向申请人发送短信告知本人。 </div>
                                    <div class="mui-row" style="padding:5px">3、区民政部门工作人员凭账号和密码登录徐州市住房保障系统，对经办事处住保窗口审核通过的申请人提交的资料进行收入审核，审核通过的，在审核系统上签署审核通过意见并签字。区民政部门 3个工作日内完成本级审核工作。</div>
                                    <div class="mui-row" style="padding:5px">4、区住保部门工作人员凭账号和密码登录徐州市住房保障系统，对经办事处住保窗口审核通过的申请人提交的资料进行本级审核，由系统向申请人发送短信告知其审核申请资料原件的时间、地点。审核通过的，审核人在审核系统上签署审核通过意见并签字，由审核系统向申请人发送审核通过短信；审核不通过的，审核人填写审核不通过原因，由审核系统向申请人发送短信告知本人。区住保部门 7个工作日（不含公示期）内完成本级审核工作。</div>
                                    <div class="mui-row" style="padding:5px">5、市住房保障服务中心对审核后符合申请条件的申请人进行备案。</div>
                                    <div class="mui-row" style="padding:5px">五、其他需注意事项</div>
                                    <div class="mui-row" style="padding:5px">1、经济适用住房购房人拥有有限产权，购买经济适用住房不满10年，不得直接上市交易。</div>
                                    <div class="mui-row" style="padding:5px">2、购买经济适用住房满10年，购房人上市转让经济适用住房的，应当按照届时同地段普通商品住房与经济适用住房差价的20%比例向政府交纳土地收益等相关价款。购房人也可以按照规定的标准向政府交纳土地收益等相关价款，取得完全产权后上市转让。</div>
                                    <div class="mui-row" style="padding:5px">3、对轮候到位的经济适用住房申购家庭，因各种原因而放弃此轮购房的，2年内不得再申请购买经济适用住房。轮候期间，申请人家庭收入、人口、住房等情况发生变化的，经市住房保障实施机构核实后，对不符合申购经济适用住房条件的，取消其申请购买经济适用住房资格。</div>
                                    <div class="mui-row" style="padding:5px">4、每个经济适用住房申购家庭只能购买一套经济适用住房，已购买经济适用住房的家庭不得再申请购买经济适用住房。</div>
                                    <div class="mui-row" style="padding:5px">5、经济适用住房在未取得完全产权之前，不得私下转让或者用于出租经营。</div>
                                    <div class="mui-row" style="padding:5px">六、其他未尽事项，以《徐州市市区经济适用住房管理办法》徐政规[2009]2号）相关规定为准，申请前请详细阅读相关政策。</div>
                                    <div class="mui-row" style="padding:5px">特此告知。</div>
                                    <div class="mui-row" style="padding:5px">徐州市住房保障服务中心</div>

                                </div>
                                <!--页脚，放置补充信息或支持的操作-->
                                <div class="mui-card-footer">
                                    <div class="mui-input-row mui-checkbox mui-left">
                                        <label>我已阅读同意</label>
                                        <input name="checkbox1" value="Item1" type="checkbox">
                                    </div>
                                </div>
                            </div>
                            <div class="mui-content-padded" style="margin-top: 2rem;">
                                <button id='next1' class="mui-btn mui-btn-block mui-btn-primary">继续申请</button>
                            </div>
                        </div>
                        <div id="wrap1" style="display: none;">
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">基本信息</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-combobox" name="apSsq" data-options="label:'户籍所在区（县）',required:true,valueField:'piItemcode',textField:'piItemname',url:'http://localhost:8080/bzfxm/ParmItem/selectSsqExceptCenter',onSelect:selectSSQ,editable:false,panelHeight:'auto',panelMaxHeight:'200'">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-combobox" name="apJdbsc" id="apJdbsc" data-options="label:'户籍所在街道办事处',required:true,valueField:'piItemcode',textField:'piItemname',url:'http://localhost:8080/bzfxm/ParmItem/getOptions?parmSetcode=06',editable:false,panelHeight:'auto',panelMaxHeight:'200'">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="apSqjwh"  data-options="label:'户籍所在社区',required:true,validType:['chinese','empty']">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">申请人信息</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmXm" value="${sessionScope.applyUserinfo.username}" data-options="label:'姓名',required:true,readonly:true,validType:['empty','chinese','specialCharacter']">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmSfzh" value="${sessionScope.applyUserinfo.sfzh}"  data-options="label:'身份证号码',required:true,validType:['sfz','empty'],readonly:true">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <select class="easyui-combobox" name="applyFamilyMembers[0].afmXb" value="${sessionScope.applyUserinfo.sex}"  data-options="label:'性别',required:true,readonly:true,editable:false,panelHeight:'auto'">
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <select class="easyui-combobox" name="applyFamilyMembers[0].afmHyzk"
                                                    data-options="label:'婚姻状况',readonly:true,valueField:'piItemcode',textField:'piItemname',editable:false,panelHeight:'auto'">
                                                <option value="2">已婚</option>
                                            </select>
                                        </div>
                                        <div class="commonRow commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmGzdw"  data-options="label:'工作单位',prompt:'请输入单位全称',required:true">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmLxdh" value="${sessionScope.applyUserinfo.linktel}"   data-options="label:'联系电话',required:true,validType:['phone','empty'],readonly:true">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[0].afmNsr"  id="applyFamilyMembers0afmNsr"  data-options="label:'个人年收入(元)',required:true,validType:['empty','number'],events:{keyup:changeSr}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">配偶信息</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmXm" id="applyFamilyMembers1afmXm"  data-options="label:'姓名',required:true,validType:['empty','chinese','specialCharacter'],events:{blur:checkUser}">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmSfzh" id="applyFamilyMembers1afmSfzh"  data-options="label:'身份证号码',required:true,validType:['sfz','empty'],events:{blur:checkUser}">
                                        </div>
                                        <div class="commonRow">
                                            <select class="easyui-combobox" name="applyFamilyMembers[1].afmXb"  data-options="label:'性别',required:true,editable:false,panelHeight:'auto'">
                                                <option value="女">女</option>
                                                <option value="男">男</option>
                                            </select>
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmGzdw"  data-options="label:'工作单位',prompt:'请输入单位全称',required:true">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmLxdh"  data-options="label:'联系电话',required:true,validType:['phone','empty']">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <select class="easyui-combobox" name="applyFamilyMembers[1].afmYsqrgx"  data-options="label:'关系',valueField:'piItemname',textField:'piItemname',panelHeight:'auto',readonly:true,editable:false">' +
                                                <option value="0">配偶</option>
                                            </select>
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyMembers[1].afmNsr" id="applyFamilyMembers1afmNsr"  data-options="label:'个人年收入(元)',required:true,validType:['empty','number'],events:{keyup:changeSr}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">户籍信息</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="apSqhjnx" data-options="label:'户籍年限(年)',required:true,validType:['numberZ','limitHJ[5]','empty']">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="apJtnsr" id="apJtnsr" data-options="label:'家庭年收入(元)',required:true,readonly:true,validType:['number','empty']">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="apJtrk" id="apJtrk" value="2" data-options="label:'家庭人口',required:true,readonly:true,validType:['numberZ','empty']">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="apRjysr" id="apRjysr"  data-options="label:'人均月收入(元)',required:true,readonly:true,validType:['number','empty']">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">工作单位</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyUnit.legelrep"   data-options="label:'法定代表人',prompt:'非必填',validType:['chinese','specialCharacter']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyUnit.bsls"  data-options="label:'统一社会信用代码',prompt:'非必填',validType:'xyCode'">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyUnit.entag"  data-options="label:'委托代理人',prompt:'非必填',validType:['chinese','specialCharacter']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyUnit.tel"  data-options="label:'手机号码',validType:'phone',prompt:'非必填'">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyUnit.address"  data-options="label:'联系住址',prompt:'非必填'">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-content-padded" style="margin-top: 2rem;">
                                <button class="mui-btn mui-btn-block mui-btn-primary"  id='next2'>下一步</button>
                            </div>
                        </div>
                        <div id="wrap2" style="display: none;">
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">家庭现住房情况</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhZl"  data-options="label:'房屋地址',required:true,validType:['empty']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhCqr"  data-options="label:'产权人',required:true,validType:['empty','chinese','specialCharacter']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhMj" id="applyFamilyHouses0afhMj"  data-options="label:'建筑面积(m²)',required:true,validType:['number','empty'],events:{keyup:changeMj}">
                                        </div>
                                        <div class="commonRow readonlyRow">
                                            <input class="easyui-textbox" name="applyFamilyHouses[0].afhRjmj" id="applyFamilyHouses0afhRjmj"  data-options="label:'人均建筑面积(m²)',readonly:true,validType:['number','empty']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-combobox" name="applyFamilyHouses[0].afhZfxz" id="applyFamilyHouses0afhZfxz"  data-options="label:'现住房性质',required:true,valueField:'piItemcode',textField:'piItemname',
                            url:'http://localhost:8080/bzfxm/ParmItem/getOptions?parmSetcode=01',editable:false,panelHeight:'auto',panelMaxHeight:'200'">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">住房变更情况</div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group">
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcYzfzl"  data-options="label:'原住房地址'">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcCqr"  data-options="label:'原产权人',validType:['chinese','specialCharacter']">
                                        </div>
                                        <div class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcJzmj" data-options="label:'建筑面积(m²)',validType:['number']">
                                        </div>
                                        <div class="commonRow">
                                            <label class="textbox-label textbox-label-before" style="text-align: left; height: 32px; line-height: 10px;">
                                                方式
                                            </label>
                                                <input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="拆迁" onclick="change()" required/>拆迁&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="转让" onclick="changeSecond()"/>转让

                                        </div>
                                        <div class="commonRow" id="cqtime">
                                            <input class="easyui-datebox" name="applyFamilyHouseChange.afhcBgsj"  data-options="label:'拆迁时间',editable:false">
                                        </div>
                                        <div id="cq" class="commonRow">
                                            <input class="easyui-textbox" name="applyFamilyHouseChange.afhcZrbcje"  data-options="label:'货币补偿金额(元)',validType:['number']">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mui-button-row">
                                <button type="button" class="mui-btn mui-btn-primary" id="prev1">上一步</button>
                                <button type="button" class="mui-btn mui-btn-success" id="next3">下一步</button>
                            </div>
                        </div>
                        <div id="wrap3" style="display: none;">
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header">同住家庭成员情况<span class="greenPan">新增</span><span class="redPan">删除</span></div>
                            </div>
                            <div class="card-container">

                            </div>
                            <div class="mui-button-row">
                                <button type="button" class="mui-btn mui-btn-primary" id="prev2">上一步</button>
                                <button type="button" class="mui-btn mui-btn-success" id="next4">下一步</button>
                            </div>
                        </div>
                        <div id="wrap4" style="display: none;">
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">收入情况证明材料</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList0">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark0 filePicker" onclick="add(0)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">住房状况证明材料</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList1">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark1 filePicker" onclick="add(1)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">家庭成员身份证</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList2">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark2 filePicker" onclick="add(2)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">家庭成员户口簿(含首页)</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList3">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark3 filePicker" onclick="add(3)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">合法有效家庭成员之间的赡养、抚养、扶养关系及共同生活的证明</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList4">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark4 filePicker" onclick="add(4)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">反映家庭财产状况的有关证明材料</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList5">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark5 filePicker" onclick="add(5)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">申请人申报财产真实性书面承诺</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList6">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark6 filePicker" onclick="add(6)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">婚姻情况证明</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList7">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark7 filePicker" onclick="add(7)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">户籍所在地社区公示证明</span><span class="reqSpan">*(必填)</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList8">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark8 filePicker" onclick="add(8)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-card">
                                <!--页眉，放置标题-->
                                <div class="mui-card-header"><span class="name">其他相关材料</span></div>
                                <!--内容区-->
                                <div class="mui-card-content">
                                    <div class="mui-input-group uploader-list" id="fileList9">

                                    </div>
                                </div>
                                <div class="mui-card-footer">
                                    <div class="fileMark9 filePicker" onclick="add(9)">添加图片</div>
                                </div>
                            </div>
                            <div class="mui-button-row">
                                <button type="button" class="mui-btn mui-btn-primary" id="prev3">上一步</button>
                                <button type="button" class="mui-btn mui-btn-success" id="submit">提交申请</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="mui-off-canvas-backdrop"></div>
        </div>
    </div>
</div>

<style>
    .textbox-label{
        max-width: 46%;
        width:11.2rem;
    }
    .commonRow .textbox,.commonRow .combo,.commonRow .datebox{
        min-width:50% !important;
        max-width: 80% !important;
    }
    .commonRow .textbox-text ,.commonRow .validatebox-text{
        width: 100% !important;
    }
</style>
<script src="<%=basePath %>srcApp/js/public/jquery.min.js" type="text/javascript" ></script>
<script src="<%=basePath %>srcApp/js/mui/mui.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath %>srcApp/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="<%=basePath %>srcApp/js/easyui/jquery.easyui.mobile.js" type="text/javascript" ></script>
<script src="<%=basePath %>srcApp/js/webuploader/webuploader.js" type="text/javascript" ></script>
<script src="<%=basePath %>srcApp/js/easyui/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="<%=basePath %>srcApp/js/public/public.js"></script>
<script>
    mui.init();
    var i = 1, j=0,sucIndex=0,currentIndex=0,num = "",codeArray=[],nameArray = [];
    var mask=mui.createMask();//创建遮罩层
    mui('.mui-scroll-wrapper').scroll({
        deceleration: 0.0006
    });
    mui(document.body).on('tap', '.mui-btn', function (e) {
        var id = this.getAttribute("id");
        var code = id.substring(4);
        mui("#pullrefresh").scroll().scrollTo(0,0,0);
        if (id.indexOf("next") != -1) {
            $('#wrap' + code + '').show().siblings().hide();
        }
        if (id.indexOf("prev") != -1) {
            $('#wrap' + code + '').show().siblings().hide();
        }
        if(id=="submit"){
            save()
        }
    });
    mui(".mui-bar").on('tap', '.mui-tab-item', function(e) {
        var target = this.getAttribute("id");
        switch(target) {
            case 'apply':
                weixin.openWindow('applyList','../../applyList/applyList.html');
                break;
            case 'audit':
                weixin.openWindow('audioList','../../audioList/audioList.html');
                break;
            case 'userInfo':
                weixin.openWindow('userInfo','../../userInfo/userInfo.html');
                break;
            case 'updatePwd':
                weixin.openWindow('updatePwd','../../updatePwd.html');
                break;
            default:
                break;
        }
    });
    //新增家庭成员
    mui(".mui-card").on('tap', '.greenPan', function(e) {
        i++;
        $("#apJtrk").textbox('setValue',(i+1));
        var perString=$('<div class="mui-card">' +
            '<div class="mui-card-header">同住家庭成员情况</div>' +
            '    <div class="mui-card-content">' +
            '       <div class="mui-input-group">' +
            '            <div class="commonRow">' +
            '                 <select class="easyui-combobox" name="applyFamilyMembers[' + i + '].afmYsqrgx" style="width: 92%" data-options="label:\'关系:\',valueField:\'piItemname\',textField:\'piItemname\',panelHeight:\'auto\',required:true,editable:false">' +
            '                  <option value="3">子女</option>'+
            '                </select>'+
            '            </div>' +
            '            <div class="commonRow">' +
            '                 <input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmXm" id="applyFamilyMembers' + i + 'afmXm"  data-options="label:\'姓名:\',required:true,validType:[\'empty\',\'chinese\',\'specialCharacter\'],events:{blur:checkUser}">' +
            '            </div>' +
            '            <div class="commonRow readonlyRow">' +
            '                 <input class="easyui-datebox" name="applyFamilyMembers[' + i + '].afmCsny" id="applyFamilyMembers' + i + 'afmCsny"  data-options="label:\'出生年月:\',readonly:true,required:true,editable:false">' +
            '            </div>' +
            '            <div class="commonRow">' +
            '                 <input class="easyui-combobox" name="applyFamilyMembers[' + i + '].afmHyzk"  data-options="label:\'婚姻状况:\',valueField:\'piItemcode\',textField:\'piItemname\',url:\'http://localhost:8080/bzfxm/ParmItem/getOptions?parmSetcode=07\',required:true,editable:false,panelHeight:\'auto\',panelMaxHeight:\'280\'">' +
            '            </div>' +
            '            <div class="commonRow">' +
            '                 <input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmGzdw"  data-options="label:\'工作单位:\',prompt:\'请输入单位全称\'">' +
            '            </div>' +
            '            <div class="commonRow">' +
            '                 <input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmSfzh" id="applyFamilyMembers' + i + 'afmSfzh"  data-options="label:\'身份证号码:\',required:true,validType:[\'sfz\',\'empty\'],events:{blur:checkUser}">' +
            '            </div>' +
            '            <div class="commonRow">' +
            '                 <input class="easyui-textbox" name="applyFamilyMembers[' + i + '].afmNsr" id="applyFamilyMembers' + i + 'afmNsr" value="0"  data-options="label:\'个人年收入(元):\',required:true,validType:[\'number\',\'empty\'],events:{keyup:changeSr}">' +
            '            </div>' +
            '       </div>' +
            '     </div>' +
            '</div>').appendTo(".card-container");
        $.parser.parse(perString);
        //计算面积
        //计算年收入
        changeMj(i);
        changeSr(i)
    });
    //删除家庭成员
    mui(".mui-card").on('tap', '.redPan', function(e) {
        if(i>1){
            i--;
        }
        $("#apJtrk").textbox('setValue',(i+1));
        $("#wrap3 .card-container").find(".mui-card:last").remove();
        //计算面积
        //计算年收入
        changeMj(i);
        changeSr(i)
    });
    //计算面积和收入
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
            $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue',0);
            return false
        }else{
            $.ajax({
                url:'http://localhost:8080/bzfxm/applyUserinfo/checkUser',
                type:'post',
                data:{
                    userName:username,
                    sfzh:sfzh
                },
                success:function(result){
                    if(result=="success"){
                        var birthday= weixin.setBirthday(sfzh);
                        $("#applyFamilyMembers"+id+"afmCsny").textbox('setValue',birthday);
                    }else{
                        $("#applyFamilyMembers"+id+"afmSfzh").textbox('setValue','');//身份证
                        $("#applyFamilyMembers"+id+"afmXm").textbox('setValue','');
                        weixin.toast(result)
                    }
                }
            })
        }

    }
    //街区联动
    function selectSSQ(record){
        $("#apJdbsc").combobox({
            url:'http://localhost:8080/bzfxm/ParmItem/findAllJd',
            onBeforeLoad:function(param){
                param.qid=record.piItemcode;
            }
        });
    }
    //金额label切换
    function change(){
        $("#cq label").text("货币补偿金额(元)");
        $("#cqtime label").text("拆迁时间");
    }
    function changeSecond(){
        $("#cq label").text("转让金额(元)");
        $("#cqtime label").text("转让时间");
    }
    //上传配置
    $('.filePicker').each(function (index) {
        nameArray[index] = $(this).parent().parent().find('.name').text();
    });
    uploader = WebUploader.create({
        auto: false,
        swf: 'http://localhost:8080/bzfxm/srcApply/js/Uploader.swf',
        server: 'http://localhost:8080/bzfxm/volel/uoloadVolel',
        pick:{
            id:'.filePicker',
            label:'添加附件'
        } ,
        fileVal: "volname1",
        sendAsBinary:true,//设置为二进制
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
            weixin.alert("请不要重复选择文件！");
        } else if (type == "Q_EXCEED_SIZE_LIMIT") {
            weixin.alert("单文件大小不超过4M，请调整");
        }
    });
    uploader.on('fileQueued', function(file) {
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
        uploader.makeThumb(file, function(error, src) {
            if(error) {
                weixin.toast('此图不能预览');
            }
            $img.attr('src', src);
        }, 15, 15);
    });
   //图片上传提交
    function del(obj) {
        //移除一个j
        var code=Number(obj.parent().parent().attr('id').substring(8));
        var index=weixin.getArrayIndex(codeArray,code);
        codeArray.splice(index,1);
        codeArray.splice((index-1),1);
        codeArray.splice((index-2),1);
        //移除
        obj.parents(".thumbnail").remove();
        uploader.reset();

    }
    function add(index){
        j=index;
        codeArray.push(index);//执行2次
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
           mask.hide();
           weixin.toast('上传失败');
        });
        //上传后才执行
        uploader.on( 'uploadSuccess', function( file ) {
            sucIndex++;
            if(sucIndex==newArray.length){
                weixin.toast('上传成功');
                setTimeout(function () {
                  mask.hide();
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
        var bitianArray=[0,1,2,3,6,7,8];
        if(newArray.length>0){
            for(var x in bitianArray){
                if(typeof(weixin.getArrayIndex(newArray,bitianArray[x]))=="boolean"){
                    judgeFlag=false;
                    return false;
                }
            }
        }else{
            judgeFlag=false;
        }
        return judgeFlag;
    }

    //表单提交
    function save() {
        var judgeFlag=judgeArray(solveArray(codeArray));
        var flag=false;
        var jzxz=$.trim($("#applyFamilyHouses0afhZfxz").combobox('getValue'));
        var pjmj=$.trim($("#applyFamilyHouses0afhRjmj").textbox('getValue'));
        $('#form').form('submit', {
            url: '<%=basePath %>apply/addApplyInfo',
            onSubmit: function (param) {
                param.apSqlb = "${applyType}";
                var isValid = $(this).form('validate');
                if (!isValid) {
                    flag=false;
                   weixin.toast('请检查是否有漏填或错填内容！');
                }else if(!judgeFlag){
                    flag=false;
                    weixin.toast("附件所有必填项不能为空！")
                }else{
                    if(jzxz=="4"&&Number(pjmj)>15){
                        flag=false;
                        weixin.toast("自住房平均建筑面积大于15不能申请");
                    }else{
                        flag=true;
                    }
                }
                return flag;
            },
            success: function (data) {
                var data = JSON.parse(data);
                if (data.result == "success") {
                    //遮罩层
                    mask.show();
                    var applyid = data.applyid;
                    currentIndex=0;
                    send(applyid);
                } else {
                    weixin.toast(data.result)
                }
            },
            error: function (data) {
                weixin.toast("数据库连接失败，请稍后再试");
            }
        }, 'json');
    }
    //插件处理
</script>
</body>
</html>

