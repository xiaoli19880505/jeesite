<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!-- 引入el标识所需要的标签 -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>徐州市公共租赁住房租赁补贴申请审核表</title>
	<script src=”http://local:8000/CLodopfuncs.js”></script>
	<script src=”http://local:18000/CLodopfuncs.js”></script>
	<script type="text/javascript" src="<%=basePath %>srcApply/js/jquery.min.js"></script>
	<script language="javascript" type="text/javascript">
        function print() {
            var LODOP=getCLodop();
            var strHTML=document.getElementsByTagName("html")[0].innerHTML;
            LODOP.PRINT_INITA(1,1,950,800,"测试预览功能");
            LODOP.ADD_PRINT_HTM(30,5,"100%","100%",strHTML);
            LODOP.PREVIEW();
        }

	</script>
	<style type="text/css">
		table,tr,th,td,th{margin:0;padding:0;}
		table{width:100%;border-collapse:collapse;}
		table,table tr th, table tr td{border:1px solid #000;}
		table tr th,table tr td{line-height:40px;height:40px;text-align:center;
			font-weight:normal;font-size:12px;font-family:'宋体';}
		.td_1{width:1%;}
		.td_6{width:6%;}
		.td_10{width:10%;}
		.td_12{width:12%;}
		.td_13{width:13%;}
		.td_14{width:14%;}
		.td_15{width:15%;}
		.td_18{width:18%;}
		.td_20{width:20%;}
		.td_25{width:25%;}
		.td_30{width:30%;}
		.td_35{width:35%;}
		.td_36{width:36%;}
		.td_40{width:40%;}
		.td_44{width:44%;}
		.td_50{width:50%;}
		.td_60{width:60%;}
		.td_75{width:75%;}
		.td_80{width:80%;}
		.td_90{width:90%;}
		.td_94{width:94%;text-align:left;}
	</style>
</head>

<body>
<div><button onclick="print()">打印</button></div>
<div style="margin:0 auto;width:780px;">
	<h1 style="text-align:center;font-family:'宋体';">徐州市公共租赁住房租赁补贴申请审核表</h1>
	<div style="margin-left:50%;margin-bottom:10px;font:normal 16px '宋体';"> ${applyButie.ssqStr } ${applyButie.ssjStr }街道办事处 ${applyButie.abSqjwh }社区居委会</div>
	<table style="">
		<tr>
			<td class="td_10" colspan="10" rowspan="2">申请人姓名</td>
			<td class="td_15" colspan="15" rowspan="2">${applyButie.applyFamilyMembers[0].afmXm }</td>
			<td class="td_10" colspan="10">身份证号</td>
			<td class="td_15" colspan="15">${applyButie.applyFamilyMembers[0].afmSfzh }</td>
			<td class="td_15" colspan="15">联系电话</td>
			<td class="td_35" colspan="35">${applyButie.applyFamilyMembers[0].afmLxdh }</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10">工作单位</td>
			<td class="td_80" colspan="80">${applyButie.applyFamilyMembers[0].afmGzdw }</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10" rowspan="2">配偶姓名</td>
			<td class="td_15" colspan="15" rowspan="2">${applyButie.applyFamilyMembers[1].afmXm }</td>
			<td class="td_10" colspan="10">身份证号</td>
			<td class="td_15" colspan="15">${applyButie.applyFamilyMembers[1].afmSfzh }</td>
			<td class="td_15" colspan="15">联系电话</td>
			<td class="td_35" colspan="35">${applyButie.applyFamilyMembers[1].afmLxdh }</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10">工作单位</td>
			<td class="td_80" colspan="80">${applyButie.applyFamilyMembers[1].afmGzdw }</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10">市区户籍<br/>年    限</td>
			<td class="td_10" colspan="15">${applyButie.abSqhjnx }</td>
			<td class="td_10" colspan="10">家  庭<br/>年收入</td>
			<td class="td_10" colspan="15">${applyButie.abJtnsr }元</td>
			<td class="td_10" colspan="10">家庭人口</td>
			<td class="td_15" colspan="15">${applyButie.abJtrk }</td>
			<td class="td_10" colspan="10">人  均<br/>月收入</td>
			<td class="td_15" colspan="15">${applyButie.abRjysr }元</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10" rowspan="3">家 庭 现<br/>住房情况</td>
			<td class="td_36" colspan="36">房屋坐落</td>
			<td class="td_18" colspan="18">产权单位（人）</td>
			<td class="td_18" colspan="18">使用面积（㎡）</td>
			<td class="td_18" colspan="18">人均使用面积<br/>（㎡）</td>
		</tr>
		<c:forEach items="${applyButie.applyFamilyHouses }" varStatus="i" var="item" >
			<tr>
				<td class="td_36" colspan="36">${item.afhZl }</td>
				<td class="td_18" colspan="18">${item.afhCqr }</td>
				<td class="td_18" colspan="18">${item.afhMj }</td>
				<td class="td_18" colspan="18">${item.afhRjmj }</td>
			</tr>
		</c:forEach>
		<tr>
			<td class="td_10" colspan="10" rowspan="2">现住房性质<br/>（√）</td>
			<td class="td_18" colspan="18">直管公房</td>
			<td class="td_18" colspan="18">单位公房</td>
			<td class="td_18" colspan="18">租赁私房</td>
			<td class="td_18" colspan="18">自有私房</td>
			<td class="td_18" colspan="18">借住</td>
		</tr>
		<tr>
			<td class="td_18" colspan="18"><c:if test="${fn:length(applyButie.applyFamilyHouses)>0 && apply.applyFamilyHouses[0].afhZfxz == '1'}" >（√）</c:if></td>
			<td class="td_18" colspan="18"><c:if test="${fn:length(applyButie.applyFamilyHouses)>0 && apply.applyFamilyHouses[0].afhZfxz== '2'}" >（√）</c:if></td>
			<td class="td_18" colspan="18"><c:if test="${fn:length(applyButie.applyFamilyHouses)>0 && apply.applyFamilyHouses[0].afhZfxz == '3'}" >（√）</c:if></td>
			<td class="td_18" colspan="18"><c:if test="${fn:length(applyButie.applyFamilyHouses)>0 && apply.applyFamilyHouses[0].afhZfxz == '4'}" >（√）</c:if></td>
			<td class="td_18" colspan="18"><c:if test="${fn:length(applyButie.applyFamilyHouses)>0 && apply.applyFamilyHouses[0].afhZfxz == '5'}" >（√）</c:if></td>
		</tr>
		<tr>
			<td class="td_10" colspan="10" rowspan="3">5年内（含5<br/>年）家庭住<br/>房变更情况</td>
			<td class="td_30" colspan="30">原房屋坐落</td>
			<td class="td_18" colspan="15">产权单位（人）</td>
			<td class="td_18" colspan="15">建筑面积（㎡）</td>
			<td class="td_18" colspan="15">拆迁</td>
			<td class="td_18" colspan="15"><c:if test="${applyButie.applyFamilyHouseChange.afhcBgfs == '拆迁'}" >（√）</c:if></td>
		</tr>
		<tr>
			<td class="td_30" colspan="30">${applyButie.applyFamilyHouseChange.afhcYzfzl }</td>
			<td class="td_18" colspan="15">${applyButie.applyFamilyHouseChange.afhcCqr }</td>
			<td class="td_18" colspan="15">${applyButie.applyFamilyHouseChange.afhcJzmj }</td>
			<td class="td_18" colspan="15">转让</td>
			<td class="td_18" colspan="15"><c:if test="${applyButie.applyFamilyHouseChange.afhcBgfs == '转让'}" >（√）</c:if></td>
		</tr>
		<tr>
			<td class="td_15" colspan="15">拆迁时间</td>
			<td class="td_15" colspan="15">${applyButie.applyFamilyHouseChange.afhcBgsj}</td>
			<td class="td_20" colspan="20">货币补偿金额${applyButie.applyFamilyHouseChange.afhcZrbcje}元</td>
			<td class="td_10" colspan="10">转让时间</td>
			<td class="td_15" colspan="15">${applyButie.applyFamilyHouseChange.afhcBgsj}</td>
			<td class="td_15" colspan="15">转让金额${applyButie.applyFamilyHouseChange.afhcZrbcje}元</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10">拆迁安置房坐落</td>
			<td class="td_60" colspan="60">${applyButie.applyFamilyHouseChange.afhcAzfzl}</td>
			<td class="td_15" colspan="15">建筑面积（m2）</td>
			<td class="td_15" colspan="15">${applyButie.applyFamilyHouseChange.afhcAzfjzmj}</td>
		</tr>
		<tr>
			<td class="td_10" colspan="10">是否特殊家庭</td>
			<td class="td_90" colspan="90"><c:if test="${applyButie.abTsjt != null}" >（√)</c:if></td>
		</tr>
		<tr>
			<td class="td_10" colspan="10" rowspan="6">同<br/>住<br/>家<br/>庭<br/>成<br/>员<br/>情<br/>况</td>
			<td class="td_10" colspan="10">与申请人关系</td>
			<td class="td_10" colspan="10">姓名</td>
			<td class="td_10" colspan="10">出生时间</td>
			<td class="td_10" colspan="10">婚姻状况</td>
			<td class="td_25" colspan="25">工作单位</td>
			<td class="td_15" colspan="15">身份证号</td>
			<td class="td_10" colspan="10">年收入（元）</td>
		</tr>
		<c:forEach items="${applyButie.applyFamilyMembers }" varStatus="i" var="item" >
			<tr>
				<td class="td_10" colspan="10">${item.afmYsqrgx }</td>
				<td class="td_10" colspan="10">${item.afmXm }</td>
				<td class="td_10" colspan="10">${item.afmCsny }</td>
				<td class="td_10" colspan="10">
					<c:choose>
						<c:when test="${item.afmHyzk==2 }">已婚</c:when>
						<c:when test="${item.afmHyzk==1 }">未婚</c:when>
						<%--<c:otherwise>已婚</c:otherwise>--%>
					</c:choose>
				</td>
				<td class="td_25" colspan="25">${item.afmGzdw }</td>
				<td class="td_15" colspan="15">${item.afmSfzh }</td>
				<td class="td_10" colspan="10">${item.afmNsr }</td>
			</tr>
		</c:forEach>
	</table>	<br/><br/><br/>
	<table style="">
		<tr>
			<td class="td_10" colspan="10">申请人<br/>所属办<br/>事处审<br/>核意见</td>
			<td class="td_90" colspan="90" style="text-align:left;padding-left:10px;">
				<c:if test="${approveRecords[0].apcComment!=null }" >
					${approveRecords[0].apcComment }
				</c:if>
				<c:if test="${approveRecords[0].apcComment==null }" >
					经审核，符合条件。
				</c:if><br/>
				本单位承担审查责任。<br/>
				审核人 ：<c:if test="${approveRecords[0].nameUrl!=null }">
				<img src="<%=basePath%>${approveRecords[0].nameUrl }">
			</c:if><br/>
				<span style="margin-left:80%;">
					<c:if test="${approveRecords[0].approvetimeStr!=null }" >
						${approveRecords[0].approvetimeStr }
					</c:if>
					<c:if test="${approveRecords[0].approvetimeStr==null }" >
						年 月 日
					</c:if>
				</span>
			</td>
		<tr>
			<td class="td_10" colspan="10">区民政<br/>部门审<br/>核意见</td>
			<td class="td_90" colspan="90" style="text-align:left;padding-left:10px;">
				<c:if test="${approveRecords[1].apcComment!=null }" >
					${approveRecords[1].apcComment }
				</c:if>
				<c:if test="${approveRecords[1].apcComment==null }" >
					经审核，符合条件。
				</c:if><br/>
				本单位承担审查责任。<br/>
				审核人 ：<c:if test="${approveRecords[1].nameUrl!=null }">
				<img src="<%=basePath%>${approveRecords[1].nameUrl }">
			</c:if><br/>
				<span style="margin-left:80%;">
				<c:if test="${approveRecords[1].approvetimeStr!=null }" >
					${approveRecords[1].approvetimeStr }
				</c:if>
				<c:if test="${approveRecords[1].approvetimeStr==null }" >
					年 月 日
				</c:if></span>
			</td>
		<tr>
			<td class="td_10" colspan="10">区住房<br/>保障部<br/>门审核<br/>意  见</td>
			<td class="td_90" colspan="90" style="text-align:left;padding-left:10px;">
				<c:if test="${approveRecords[2].apcComment!=null }" >
					${approveRecords[2].apcComment }
				</c:if>
				<c:if test="${approveRecords[2].apcComment==null }" >
					经审核，符合条件。
				</c:if><br/>
				本单位承担审查责任。<br/>
				审核人 ：<c:if test="${approveRecords[2].nameUrl!=null }">
				<img src="<%=basePath%>${approveRecords[2].nameUrl }">
			</c:if><br/>
				<span style="margin-left:80%;">
						<c:if test="${approveRecords[2].approvetimeStr!=null }" >
							${approveRecords[2].approvetimeStr }
						</c:if>
						<c:if test="${approveRecords[2].approvetimeStr==null }" >
							年 月 日
						</c:if></span>
			</td>
		</tr>
	</table>
</div>
</body>
</html>