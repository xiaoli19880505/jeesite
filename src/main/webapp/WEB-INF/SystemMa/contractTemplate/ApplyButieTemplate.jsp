
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" style="background:#d5e1f2">
<div class="over" style="display: none;">
    <div id="loading"></div>
</div>
<div data-options="region:'north',border:'false'" id="publicNorth">
    <div class="search-group" style="float: right;width:180px;margin-right: 50px">
        <li class="query-btn" style="float: right"><a class="icon iconfont icon-icon- " onclick="save()"><i>保存</i></a></li>
    </div>
</div>
<div data-options="region:'center',border:false">
    <form class='easyui-form' id='form' method='post'>
        <div class="contract">
            <div class="conPage">
                <div class="conCode">徐房租补  ${contractTemplateFillingDataPojo.regionCodeStr }区〔 ${contractTemplateFillingDataPojo.year }   〕第 ${contractTemplateFillingDataPojo.htQue }   号</div>
                <div class="titleContainer">
                    <div class="conTitle">徐州市市区公共租赁住房租赁补贴协议</div>
                </div>
                <div class="conPrint">徐州市住房保障服务中心印制</div>
                <div class="conRole">
                    <span class="rolespan">甲方：</span>徐州市住房保障服务中心</div>
                <div class="conRole">
                    <span class="rolespan">乙方：</span>
                    <span class="conUnder">${contractTemplateFillingDataPojo.userName }</span>身份证号码：<span class="conUnder">${contractTemplateFillingDataPojo.userCardId }</span></div>

                <div class="conContent">
                    <span class="conColumn">第一条</span>  根据《徐州市市区廉租住房保障办法》（徐政规〔2009〕3号）、《徐州市市区公共租赁住房和廉租住房并轨运行实施细则》（徐政办发〔2016〕3号）等相关规定，乙方自愿、如实申请市区公共租赁住房租赁补贴，经双方协商一致，并经乙方家庭成员全体一致同意，由乙方代表家庭全体成员与甲方就公共租赁住房租赁补贴相关事宜签订本协议。
                </div>
                <div class="conContent">
                    <span class="conColumn">第二条 </span>  经双方核算，乙方家庭成员<span class="conUnder">${contractTemplateFillingDataPojo.familyNum }</span>人，可享受租赁补贴<input class="easyui-textbox" name="rentalSubsidiesNum" data-options="required:true,validType:['numberZ','empty']">人，
                    家庭现有人均住房建筑面积<span class="conUnder">${contractTemplateFillingDataPojo.perCapitaArea }</span>平方米，
                    人均可享受补贴建筑面积<input class="easyui-textbox" name="rentalSubsidiesArea" data-options="required:true,validType:['empty']"/>平方米，
                    补贴发放标准<input class="easyui-textbox" name="rentalSubsidiesUP" data-options="required:true"/>元∕平方米，
                    每月租赁补贴金额共计<input class="easyui-textbox" name="rentalSubsidiesTP" data-options="required:true,events:{keyup:change}"/>元（大写<span class="yearUnder" id="yearUnder" style="width: auto!important;min-width: 60px"></span>）。
                </div>
                <div class="conContent">
                    <span class="conColumn">第三条 </span> 甲方自<span class="conUnder">${contractTemplateFillingDataPojo.yearSta }</span>年
                    <span class="conUnder">${contractTemplateFillingDataPojo.monthSta }</span>月
                    <span class="conUnder">${contractTemplateFillingDataPojo.daySta }</span>日起至
                    <span class="conUnder">${contractTemplateFillingDataPojo.yearEnd }</span>年
                    <span class="conUnder">${contractTemplateFillingDataPojo.monthEnd }</span>月
                    <span class="conUnder">${contractTemplateFillingDataPojo.dayEnd }</span>日止，
                    按月并在每月<span class="conUnder">${contractTemplateFillingDataPojo.deadline }</span>日前，将租赁补贴转入乙方提供的银行账户。
                    乙方提供的账户名称为：<span class="conUnder">${contractTemplateFillingDataPojo.accountTitle }</span>，
                    银行账号为：<input class="easyui-textbox" name="bankAccount" data-options="required:true,validType:['empty','numberZ']"/>。该账号发生变化时，乙方应及时书面通知甲方，否则，未能按时领取租赁补贴的责任由其自行承担。
                </div>
                <div class="conContent">
                    <span class="conColumn">第四条 </span>住房租赁补贴只能用于冲减乙方家庭租住的房屋租金。乙方有住房但未达到人均住房保障标准的，由甲方按核算后的金额发放租赁补贴。乙方无住房的，自行到市场上租赁住房解决住房困难，在签订本协议之前须将与他方所订立的房屋租赁协议备案后报甲方。乙方与他方订立租金标准低于补贴标准的，甲方按房屋租金标准发放补贴；高于补贴标准的，超过部份由乙方自理。
                </div>
                <div class="conContent">
                    <span class="conColumn">第五条 </span>租赁补贴实行年度审核制度。乙方须在本协议期满前30天内向甲方申请办理年度审核。乙方未及时申请办理年度审核造成的租赁补贴发放有误的，由乙方承担责任。逾期未办理的，甲方停止发放租赁补贴。
                </div>
                <div class="conContent">
                    <span class="conColumn">第六条 </span> 乙方补报审核材料的，经甲方审核符合租赁补贴条件的，自次月起恢复发放租房补贴，但停发期间的租赁补贴不予补发。
                </div>
                <div class="conContent">
                    <span class="conColumn">第七条</span>甲方应按本协议规定，按时并足额发放租赁补贴，如果甲方未按规定履行本协议，则乙方可要求甲方按协议履行。乙方应依法、诚信申报，保证向甲方提供的材料真实有效，否则，由乙方承担违约责任。
                </div>
                <div class="conContent">
                    <span class="conColumn">第八条 </span>乙方必须将补贴用于租房。如有下列情况之一，甲方将停发租赁补贴和提前终止协议，并依法予以处罚、记入个人征信系统和公示。<br>
                    （一）乙方家庭的人均收入、住房等情况发生变化不再符合保障标准的；<br>
                    （二）虚报、隐瞒有关情况或者伪造有关证明；<br>
                    （三）将租赁补贴挪作他用或将承租房屋转借、转租的；<br>
                    （四）领取租赁补贴后，连续六个月内不在租赁房屋居住的；<br>
                    （五）不按规定，接受住房保障部门审核和复审的；<br>
                    （六）违反市区公共租赁住房管理相关规定的。<br>
                    违反（二）、（三）、（四）规定的，停发租赁补贴的同时，收回已发放租赁补贴。
                </div>
                <div class="conContent">
                    <span class="conColumn">第九条 </span>乙方在本协议中填写的本人姓名、联系方式、证件信息以及提供的银行卡号须准确无误、真实有效。联系方式如有变更，乙方应书面通知甲方。如乙方联系方式等信息发生变化未及时告知甲方而影响租赁补贴发放的，由乙方承担全部责任。
                </div>
                <div class="conContent">
                    <span class="conColumn">第十条 </span>本协议履行过程中发生争议时，双方应协商解决；协商不成的，可依法向人民法院提起诉讼。
                </div>
                <div class="conContent">
                    <span class="conColumn">第十一条</span>本协议经甲乙双方签字盖章后生效。本协议一式贰份，甲、乙双方各执壹份，具有同等法律效力。
                </div>

                <table>
                    <tr>
                        <td>甲方（签章）： </td>
                        <td> 乙方（签字）：</td>
                    </tr>
                    <tr>
                        <td> 经办人： </td>
                        <td> 联系电话：</td>
                    </tr>
                    <tr>
                        <td>联系电话：  </td>
                        <td>联系地址：</td>
                    </tr>
                    <tr>
                        <td>联系地址：</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><span class="yearUnder"></span>年<span class="yearUnder"></span>月<span class="yearUnder"></span>日  </td>
                        <td> <span class="yearUnder"></span>年<span class="yearUnder"></span>月<span class="yearUnder"></span>日</td>
                    </tr>
                </table>
                <input type="hidden" name="CtCode" value="${contractTemplateFillingDataPojo.ctCode}"/>
                <input type="hidden" name="contractNo" value="${contractTemplateFillingDataPojo.contractNo }"/>
                <input type="hidden" name="regionCodeStr" value="${contractTemplateFillingDataPojo.regionCodeStr }"/>
                <input type="hidden" name="year" value="${contractTemplateFillingDataPojo.year }"/>
                <input type="hidden" name="htQue" value="${contractTemplateFillingDataPojo.htQue }"/>
                <input type="hidden" name="userName" value="${contractTemplateFillingDataPojo.userName }"/>
                <input type="hidden" name="userCardId" value="${contractTemplateFillingDataPojo.userCardId }"/>
                <input type="hidden" name="familyNum" value="${contractTemplateFillingDataPojo.familyNum }"/>
                <input type="hidden" name="perCapitaArea" value="${contractTemplateFillingDataPojo.perCapitaArea }"/>
                <%--<input type="hidden" name="rentalSubsidiesTPZH" value=""/>--%>
                <input type="hidden" name="yearSta" value="${contractTemplateFillingDataPojo.yearSta }"/>
                <input type="hidden" name="monthSta" value="${contractTemplateFillingDataPojo.monthSta }"/>
                <input type="hidden" name="daySta" value="${contractTemplateFillingDataPojo.daySta }"/>
                <input type="hidden" name="yearEnd" value="${contractTemplateFillingDataPojo.yearEnd }"/>
                <input type="hidden" name="monthEnd" value="${contractTemplateFillingDataPojo.monthEnd }"/>
                <input type="hidden" name="dayEnd" value="${contractTemplateFillingDataPojo.dayEnd}"/>
                <input type="hidden" name="deadline" value="${contractTemplateFillingDataPojo.deadline}"/>
                <input type="hidden" name="accountTitle" value="${contractTemplateFillingDataPojo.accountTitle}"/>
            </div>

        </div>
    </form>
</div>
</body>
</html>
<script>
    function save(){
        $(".over").show();
        var data =bank.biography().getParams('butie');
        var id = data.row.appid;
        var cId = data.row.cId;
        var cType = data.row.cType;
        var type = "${contractTemplateFillingDataPojo.apSqlb}";
        var rentalSubsidiesTPZH = $("#yearUnder").text();
        bank.ajaxForm('#form','<%=basePath %>contractTemplate/getContractTemplateFile',
            {objId:id,apSqlb:type,rentalSubsidiesTPZH:rentalSubsidiesTPZH,cType:cType,cId:cId},function(data){
                //提交表单
                $(".over").hide();
                bank.ajaxMessage(data)

            });
    }
    function change() {
        var rent = $(this).val();
        $.ajax({
            type:"post",
            url:"<%=basePath%>contractTemplate/getMoneyZH",
            async:true,
            data:{
                rentalSubsidiesTP:rent
            },
            success:function (data) {
                var data = JSON.parse(data);
                if(data.flag == true){
                    $("#yearUnder").html( data.msg);
                }else{
                    bank.ajaxMessage(data.msg);
                    $("#yearUnder").html( "");
                }
            }
        });
    }
</script>

