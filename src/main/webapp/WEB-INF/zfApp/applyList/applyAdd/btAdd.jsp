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
    <meta charset="UTF-8" />
    <title>我的申请</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<script type="text/javascript" src="<%=basePath %>srcApp/css/mui.css"></script>
</head>
<body>
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
	      <h1 class="mui-title">徐州市市区公共租赁住房租赁补贴申请须知</h1>
	    </header>
	    <nav class="mui-bar mui-bar-tab">
		    <a class="mui-tab-item mui-active" id="apply">
		        <span class="mui-icon mui-icon-home"></span>
		        <span class="mui-tab-label">我的申请</span>
		    </a>
		    <a class="mui-tab-item"  id="audit">
		        <span class="mui-icon mui-icon-phone"></span>
		        <span class="mui-tab-label">我的年审</span>
		    </a>
		    <a class="mui-tab-item"  id="userInfo">
		        <span class="mui-icon mui-icon-contact"></span>
		        <span class="mui-tab-label">个人信息</span>
		    </a>
		    <a class="mui-tab-item"  id="updatePwd">
		        <span class="mui-icon mui-icon-gear"></span>
		        <span class="mui-tab-label">修改密码</span>
		    </a>
		</nav>
	    <div class="mui-content mui-scroll-wrapper" id="pullrefresh">
	      <div class="mui-scroll">
			  <form action="" id="ff">

			  </form>
	        <!-- 主界面具体展示内容 -->
	          <div id="wrap0">
		          <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">在线申请用户须知</div>
					<!--内容区-->
					<div class="mui-card-content" >
						<div class="mui-row" style="padding:5px">根据《徐州市市区公共租赁住房租赁补贴实施细则》徐住保办发[2017]6号）的有关规定，现将本市公共租赁住房租赁补贴申请有关事项告知如下：</div>
						<div class="mui-row" style="padding:5px">一、徐州市公共租赁住房租赁补贴保障范围</div>
						<div class="mui-row" style="padding:5px">徐州市市区公共租赁住房租赁补贴主要面向在市区（鼓楼区、云龙区、泉山区、经济技术开发区）范围内符合条件的低保、特困、低收入家庭。</div>
						<div class="mui-row" style="padding:5px">申请人应当为具有完全民事行为能力的人，特殊情况可委托代理人。</div>
						<div class="mui-row" style="padding:5px">二、申请条件</div>
						<div class="mui-row" style="padding:5px">1.具有市区城镇常住户口5年以上；</div>
						<div class="mui-row" style="padding:5px">2.家庭人均月收入低于1549元（低保特困家庭需连续享受城市最低生活保障或持有市总工会核发的《特困职工证》一年以上）；</div>
						<div class="mui-row" style="padding:5px">3.家庭人均住房建筑面积低于15平方米。</div>
						<div class="mui-row" style="padding:5px">注意事项：申请家庭正在享受其他住房保障政策的，不得申请。低收入家庭人均月收入认定标准在年度市区住房保障政策动态调后，以新标准执行。</div>
						<div class="mui-row" style="padding:5px">三、申请所需材料</div>
						<div class="mui-row" style="padding:5px">1、申请人户口所在地社区公示证明；</div>
						<div class="mui-row" style="padding:5px">2、收入情况的证明材料（有单位的由单位出具证明【6个月以上单位发放工资的银行流水单】，无单位的由社区出具证明。在法定劳动年龄内并有劳动能力的申请人，本人不能提供收入证明的，以及单位出具收入证明低于上年度市区最低工资标准或无法计算的，均按照市区上年度最低工资标准计算收入）；</div>
						<div class="mui-row" style="padding:5px">3、住房状况的证明材料（包括不动产证、产权证、他项权证、公房租约、5年内已转让和已领取拆迁补偿款房屋、已签订合同尚未交付房屋等相关资料，无房的出具无房证明）；</div>
						<div class="mui-row" style="padding:5px">4、家庭成员身份证和户口簿 ；申请家庭委托代理人的，须提供申请家庭的书面《委托书》及代理人的身份证件；</div>
						<div class="mui-row" style="padding:5px">5、合法有效的家庭成员之间的赡养、抚养、扶养关系及共同生活的证明；</div>
						<div class="mui-row" style="padding:5px">6、反映家庭财产状况的有关证明材料（申请人应申报家庭存款、汽车、股票、公积金、开办企业等情况，并对申报财产的真实性作出书面承诺）；</div>
						<div class="mui-row" style="padding:5px">7、申请人诚信具结书；</div>
						<div class="mui-row" style="padding:5px">8、按按规定需要提交的其他证明材料。</div>
						<div class="mui-row" style="padding:5px">四、申请审核程序</div>
						<div class="mui-row" style="padding:5px">1、申请人向户口所在地的区街道办事处住房保障服务窗口提出申请，住保窗口同时组织所辖社区居委会对申请人递交的材料进行初审，并就家庭有关情况进行调查确认，对是否符合规定条件提出审核意见，并在社区进行公示，公示期限为10天。经公示无异议或者异议不成立的，申请人登录徐州市住房保障系统，按系统提示要求进行注册、填写资料、提交上传各项证明资料（原件拍照后上传）。 </div>
						<div class="mui-row" style="padding:5px">2、申请人户口所在地的办事处住保窗口工作人员凭账号和密码登录徐州市住房保障系统，对申请人提交的资料进行本级审核，3个工作日内完成对申请人提交的材料及有关情况的调查核实。审核通过的，在审核系统上签署审核通过意见并签字；对审核不通过的，审核人填写初审不通过原因，由审核系统向申请人发送短信告知本人。 </div>
						<div class="mui-row" style="padding:5px">3、区民政部门工作人员凭账号和密码登录徐州市住房保障系统，对经办事处住保窗口审核通过的申请人提交的资料进行收入审核，审核通过的，在审核系统上签署审核通过意见并签字。区民政部门 3个工作日内完成本级审核工作。</div>
						<div class="mui-row" style="padding:5px">4、区住保部门工作人员凭账号和密码登录徐州市住房保障系统，对经区民政部门审核通过的申请人提交的资料进行本级审核，由系统向申请人发送短信告知其审核申请资料原件的时间、地点、；审核通过的，审核人在审核系统上签署审核通过意见并签字,由审核系统向申请人发送审核通过短信；审核不通过的，审核人填写复审不通过原因，由审核系统向申请人发送短信告知本人。区住保部门 4个工作日内完成本级审核工作。</div>
						<div class="mui-row" style="padding:5px">5、市住保中心工作人员凭账号和密码登录徐州市住房保障系统，对经各区审核通过的申请人提交的资料进行本级审核。审核通过的，审核人在审核系统上签署审核通过意见并签字，由审核系统向申请人发送审核通过的短信，市住保中心在市住房保障和房产管理局政务网、市政府政务网公告公示栏目上公示10天，期间接受举报和举证，并组织复查。公示无异议及调查核实后符合条件的家庭，由市住房保障服务中心进行备案，确认为租赁补贴发放对象。审核不通过的，审核人填写审核不通过原因，由审核系统向申请人发送短信告知本人。市住保中心5个工作日（不含公示期）内完成本级审核工作</div>
						<div class="mui-row" style="padding:5px">五、公共租赁住房租赁补贴标准</div>
						<div class="mui-row" style="padding:5px">1、低保、特困家庭14元/㎡。</div>
						<div class="mui-row" style="padding:5px">2、低收入家庭10元/㎡。</div>
						<div class="mui-row" style="padding:5px">六、其他需注意事项</div>
						<div class="mui-row" style="padding:5px">1、公共租赁住房租赁补贴保障有效期为一年，按年度进行审核，补贴协议一年一签。保障家庭应在保障有效期届满前30天内，向市<住房保障服务中心提交相关材料进行资格年审。经年审符合条件的，可继续按规定申领补贴；年审不符合条件的，补贴保障终止；未按规定进行资格审核的，视为自愿放弃租赁补贴资格，将停发租赁补贴。</div>
						<div class="mui-row" style="padding:5px">2、对按规定申报家庭人口、收入、住房变化情况的家庭，市、区住保部门审核其租赁补贴资格和租赁补贴额度，对不再符合租赁补贴条件的家庭，自不符合条件当月起停发租房补贴；对需调整补贴额的家庭，自申报次月起调整租房补贴的补贴额度。</div>
						<div class="mui-row" style="padding:5px">3、对未按规定进行年度申报的家庭，市住房保障服务中心自该家庭享受租赁补贴期满次月起停发补贴；享受租赁补贴的家庭补报本年度家庭变化情况，并经审核，符合享受租赁补贴条件的，自审核合格的次月起恢复发放租房补贴，但停发期间租赁补贴不予补发。</div>
						<div class="mui-row" style="padding:5px">4、对经核查不符合公共租赁房租赁补贴条件的家庭，自发现不符合条件次月起停发租房补贴；对需调整补贴额的家庭，自核查次月起调整租房补贴的补贴额度。</div>
						<div class="mui-row" style="padding:5px">5、对申请家庭自行购房、中断租赁关系、自愿退出的，市住房保障服务中心通知申请人自复核次月起停发租房补贴。自愿退出租房补贴的家庭，需到市住房保障服务中心办理退出手续。</div>
						<div class="mui-row" style="padding:5px">6、对于原申请人已故且该家庭仍符合租房补贴条件的，由申请家庭共同推荐的申请人到市住房保障服务中心办理租赁补贴变更手续后，可由变更后的申请人继续领取租房补贴。</div>
						<div class="mui-row" style="padding:5px">七、其他未尽事项，以《徐州市市区公共租赁住房租赁补贴实施细则》徐住保办发[2017]6号）相关规定为准，申请前请详细阅读相关政策。</div>
						<div class="mui-row" style="padding:5px">特此告知。</div>
						<div class="mui-row" style="padding:5px">徐州市住房保障服务中心</div>
					</div>
					<!--页脚，放置补充信息或支持的操作-->
					<div class="mui-card-footer">
						<div class="mui-input-row mui-checkbox mui-left">
		                <label>我已阅读同意</label>
		                <input name="checkbox1" value="Item 1" type="checkbox">
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
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>户籍所在区</label>
					    <input type="text" class="mui-input-clear" placeholder="请输入户籍所在区">
					    </div>
					    <div class="mui-input-row">
					        <label>户籍所在街道</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入街道">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">申请人信息</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>姓名</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入姓名">
					    </div>
					    <div class="mui-input-row">
					        <label>身份证号</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入身份证号">
					    </div>
					    <div class="mui-input-row">
					        <label>性别</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入性别">
					    </div>
					    <div class="mui-input-row">
					        <label>工作单位</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>联系电话</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">配偶信息</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>姓名</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入姓名">
					    </div>
					    <div class="mui-input-row">
					        <label>身份证号</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入身份证号">
					    </div>
					    <div class="mui-input-row">
					        <label>性别</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入性别">
					    </div>
					    <div class="mui-input-row">
					        <label>工作单位</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>联系电话</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">户籍信息</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>户籍年限</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入户籍年限">
					    </div>
					    <div class="mui-input-row">
					        <label>家庭收入</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入家庭收入">
					    </div>
					    <div class="mui-input-row">
					        <label>家庭人口</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入家庭人口">
					    </div>
					    <div class="mui-input-row">
					        <label>人均月收入</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入人均月收入">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">工作单位</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>法定代表人</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入法定代表人">
					    </div>
					    <div class="mui-input-row">
					        <label>营业执照号</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入营业执照号">
					    </div>
					    <div class="mui-input-row">
					        <label>委托代理人</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入委托代理人">
					    </div>
					    <div class="mui-input-row">
					        <label>手机号码</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入手机号码">
					    </div>
					    <div class="mui-input-row">
					        <label>联系地址</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系地址">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-content-padded" style="margin-top: 2rem;">
					    <button id='next2' class="mui-btn mui-btn-block mui-btn-primary">下一步</button>
				   </div>
			   </div>
			  <div id="wrap2" style="display: none;">
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">家庭现住房情况</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>房屋坐落</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入姓名">
					    </div>
					    <div class="mui-input-row">
					        <label>产权单位</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入身份证号">
					    </div>
					    <div class="mui-input-row">
					        <label>建筑面积</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入性别">
					    </div>
					    <div class="mui-input-row">
					        <label>人均建筑面积</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>现住房性质</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">住房变更情况</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>原住房坐落</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入姓名">
					    </div>
					    <div class="mui-input-row">
					        <label>原产权单位</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入身份证号">
					    </div>
					    <div class="mui-input-row">
					        <label>建筑面积m²</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入性别">
					    </div>
					    <div class="mui-input-row">
					        <label>拆迁时间</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>拆迁金额</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					</div>
					</div>
			    </div>
                   <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">拆迁安置</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>安置房坐落</label>
					        <input type="text" class="mui-input-clear" placeholder="安置房坐落">
					    </div>
					    <div class="mui-input-row">
					        <label>建筑面积</label>
					        <input type="text" class="mui-input-clear" placeholder="建筑面积">
					    </div>
					    <div class="mui-input-row">
					        <label>是否特殊家庭</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					   
					</div>
					</div>
			    </div>
			      <div class="mui-button-row">
			        <button type="button" class="mui-btn mui-btn-primary" id="prev1">上一步</button>
			        <button type="button" class="mui-btn mui-btn-success" id="next3" >下一步</button>
			    </div>
			  </div>
			  <div id="wrap3" style="display: none;">
		          <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">同住家庭成员情况</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    <div class="mui-input-row">
					        <label>关系</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入姓名">
					    </div>
					    <div class="mui-input-row">
					        <label>姓名</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入身份证号">
					    </div>
					    <div class="mui-input-row">
					        <label>出生年月</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入性别">
					    </div>
					    <div class="mui-input-row">
					        <label>婚姻状况</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>工作单位</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					    <div class="mui-input-row">
					        <label>身份证号</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入工作单位">
					    </div>
					    <div class="mui-input-row">
					        <label>年收入</label>
					        <input type="text" class="mui-input-clear" placeholder="请输入联系电话">
					    </div>
					</div>
					</div>
			    </div>
			      <div class="mui-button-row">
			        <button type="button" class="mui-btn mui-btn-primary" id="prev2">上一步</button>
			        <button type="button" class="mui-btn mui-btn-success" id="next4" >下一步</button>
			    </div>
			   </div>
			  <div id="wrap4" style="display: none;">
		          <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-收入情况证明材料</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
					</div>
			    </div>
			     <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-住房状况证明材料</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			       <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-家庭成员身份证</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			    <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-家庭成员户口簿</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			       <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-合法有效家庭成员之间的赡养、抚养、扶养关系及共同生活的证明</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			    <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-反映家庭财产状况的有关证明材料</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			       <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-无房证明</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			     <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-申请人申报财产真实性书面承诺</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			     <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-低保特困证明</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			      <div class="mui-card">
					<!--页眉，放置标题-->
					<div class="mui-card-header">附件-政府规定的其他材料</div>
					<!--内容区-->
					<div class="mui-card-content" >
					<div class="mui-input-group">
					    
					</div>
					</div>
					<div class="mui-card-footer">
						<button type="button" class="mui-btn mui-btn-warning" id="">添加图片</button>
					</div>
			    </div>
			      <div class="mui-button-row">
			        <button type="button" class="mui-btn mui-btn-primary" id="prev3">上一步</button>
			        <button type="button" class="mui-btn mui-btn-success" id="submit">提交申请</button>
			    </div>
			   </div>
	      </div>
	    </div>  
	    <div class="mui-off-canvas-backdrop"></div>
	  </div>
	</div>
    <script src="<%=basePath %>srcApp/js/public/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath %>srcApp/js/mui/mui.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=basePath %>srcApp/js/public/public.js" type="text/javascript" charset="utf-8"></script>
	<script>
		mui.init();
		mui('.mui-scroll-wrapper').scroll({
          deceleration: 0.0006 
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
       mui(document.body).on('tap', '.mui-btn', function(e) {
       	 var id = this.getAttribute("id");
       	 var code=id.substring(4);
       	 mui("#pullrefresh").scroll().scrollTo(0,0,0);
       	 if(id.indexOf("next")!=-1){
       	 	$('#wrap'+code+'').show().siblings().hide();
       	 }
       	 if(id.indexOf("prev")!=-1){
       	 	$('#wrap'+code+'').show().siblings().hide();
       	 }
       });
	</script>
</body>
</html>

