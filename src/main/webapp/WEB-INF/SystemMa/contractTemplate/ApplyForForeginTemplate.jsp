
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" style="background:#d5e1f2">\
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
        <div class="contract newcontract">
            <div class="conPage">
                <div class="conCode">合同编号：${contractTemplateFillingDataPojo.contractNo }</div>
                 <div class="titleContainer">
                     <div class="conTitle">徐州市市区</div>
                     <div class="conTitle"> 公共租赁住房租赁合同</div>
                     <div class="fuTitle"> （新就业人员、外来务工人员）</div>
                 </div>
                 <div class="conPrint">徐州市住房保障服务中心印制</div>
                 <div class="xiaoTitle">徐州市市区公共租赁住房租赁合同</div>


                <div class="preColumn">出租方（以下简称甲方）：<span class="conUnder" style="width: 510px">徐州市住房保障服务中心</span></div>
                <div class="preColumn">承租方（以下简称乙方）：<span class="conUnder" style="width: 510px">${contractTemplateFillingDataPojo.userName }</span></div>
                <div class="preColumn">法定代表人：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.legalRepresentative }</span>
                                        营业执照号：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.businessLicense }</span>
                </div>
                <div class="preColumn">委托代理人：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.principadName }</span>
                                        手 机 号码：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.principadMobilePhone }</span>
                </div>
                <div class="preColumn">联 系 住址：<span class="conUnder" style="width: 635px">${contractTemplateFillingDataPojo.principadContactAddress }</span></div>
                <div class="preColumn">承  &nbsp;租  &nbsp;人：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.lessee }</span>
                                        身份证号码：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.lesseeCardId }</span>
                </div>
                <div class="preColumn">联 系 住址：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.lesseeContactAddress }</span>
                                         联 系电 话：<span class="conUnder" style="width: 240px">${contractTemplateFillingDataPojo.lesseeContactPhone }</span>
                </div>
                <div class="conContent">
                    &nbsp; &nbsp;根据《徐州市市区公共租赁住房管理办法》（徐政规﹝2012﹞8号文件），为保证徐州市市区公共租赁住房运营管理工作的稳定高效运转， 遵循平等公平、诚实信用、相互配合、共同监管的原则，经甲乙双方协商一致，就公共租赁住房的租赁事宜签订本合同：
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;一、房屋基本情况</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）甲方将坐落<span class="conUnder">${contractTemplateFillingDataPojo.community }</span>小区
                    <span class="conUnder">${contractTemplateFillingDataPojo.building }</span>号楼
                    <span class="conUnder">${contractTemplateFillingDataPojo.unit } </span>单元
                    <span class="conUnder">${contractTemplateFillingDataPojo.room }</span>室的公共租赁住房租赁（以下简称该房屋）给乙方单位职工使用。该房屋为高层建筑，
                    建筑结构为<span class="conUnder">${contractTemplateFillingDataPojo.buildingStructure }</span>，
                    户型结构为<select class="easyui-combobox" name="roomNum" style="width: 100px" data-options="required:true,editable:false,
                   valueField:'piItemname',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=24',editable:false,panelHeight:'auto',panelMaxHeight:'280'"></select>居室,
                    建筑面积<span class="conUnder">${contractTemplateFillingDataPojo.constructionArea }</span>平方米。
                    <br> &nbsp; &nbsp; &nbsp;（二）房屋用途。该房屋用途为居住，未经甲方准许，乙方不得改变本合同约定的该房屋用途。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;二、租赁期限</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）该房屋租赁期限<span class="conUnder">${contractTemplateFillingDataPojo.yearTime}</span>年，自
                    <span class="conUnder">${contractTemplateFillingDataPojo.yearSta }</span>年
                    <span class="conUnder">${contractTemplateFillingDataPojo.monthSta }</span>月
                    <span class="conUnder">${contractTemplateFillingDataPojo.daySta }</span>日起至
                    <span class="conUnder">${contractTemplateFillingDataPojo.yearEnd }</span>年
                    <span class="conUnder">${contractTemplateFillingDataPojo.monthEnd }</span>月
                    <span class="conUnder">${contractTemplateFillingDataPojo.dayEnd }</span>日止。
                    <br> &nbsp; &nbsp; &nbsp;（二）租赁期限届满，乙方需继续承租的，应在本合同期限届满的2个月前，向甲方申请续租，经市住房保障服务中心审核符合公共租赁住房续租条件的，甲方与乙方续签租赁合同。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;三、租金数额及支付方式</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）该房屋按建筑面积计算租金，租金标准为5.6元/平方米·月，月租金共计为人民币<input class="easyui-textbox" name="monthlyRent" data-options="required:true,validType:['empty'],events:{keyup:change}"/>元（大写:<span class="yearUnder" id="yearUnder" style="width: auto!important;min-width: 60px"></span>                       ）。
                    <br> &nbsp; &nbsp; &nbsp;（二）按照先交租金后使用的原则，租金按季度缴纳，承租人提前10 日缴纳下季度的房屋租金，逾期未缴每天加收月租金 2 %的滞纳金。退租时，按实际使用天数计算租金。
                    <br> &nbsp; &nbsp; &nbsp;（三）租赁期内，按照徐州市公共租赁住房管理相关规定调整租金标准的，乙方和承租人承诺按照调整后的标准缴纳租金。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;四、租赁保证金</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）本合同签订前，乙方按照2000元/ 套的标准缴纳房屋租赁保证金（不计利息）。
                    <br> &nbsp; &nbsp; &nbsp;（二）该款作为该房屋的租房保证金，合同期满或终止，乙方无违约事项和其他损害事由的，且已经结清房租及水、电、燃气、物业等相关费用，乙方腾退出房屋后退还房屋租赁保证金的本金。若出现抵交情况，乙方所持原租房保证金收据作废。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp; 五、物业管理及其它费用</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）乙方自行负担物业管理服务费（包含物业管理基本服务费及机电运行费），并自觉遵守物业管理政策、法规规定，履行义务。
                    <br> &nbsp; &nbsp; &nbsp;（二）房屋租赁期间，因使用该房屋所发生的水、电、煤气、有线电视等有关费用，由乙方自行支付。如迟交或不交给甲方造成损失的由乙方承担责任。

                </div>
                <div class="conContent">
                    <span class="rolespan">   &nbsp; &nbsp;六、房屋使用</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）乙方遵守所在小区各项管理制度，应当遵守国家有关法律、政策的规定，不得在承租的房屋内从事非法活动。如因非法活动给甲方造成损失的须承担相应的法律和赔偿责任。
                    <br> &nbsp; &nbsp; &nbsp;（二）乙方应安全、爱护并合理地使用该房屋及其附属设施设备及相关物品，不得改变房屋结构、装修现状、存放危险物品超负荷使用和擅自拉接电线或使用不合格的电器。因乙方使用不当或人为损坏房屋及其附属设施设备的，乙方应原样修复或赔偿实际损失。
                    <br> &nbsp; &nbsp; &nbsp;（三）为保证公共租赁住房的合理、有效使用，确保双方的合法权益，甲方有权检查住房使用情况及核对住户的有关资料，乙方应予以配合。
                    <br> &nbsp; &nbsp; &nbsp;（四）乙方不得对该房屋原装修进行拆改。乙方未经书面同意擅自改造的或因私自拆改造成该房屋设施设备损坏的，应当恢复原状或者照价赔偿损失。
                    <br> &nbsp; &nbsp; &nbsp;（五）甲方对乙方使用房屋负有监督责任，乙方应当予以配合，并提供方便，不得阻挠、拒绝。乙方承租的公共租赁住房不得转让、转租、转借。
                </div>
                <div class="conContent">
                    <span class="rolespan">  &nbsp; &nbsp;七、房屋维修规定</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）租赁期间，甲方应定期检查房屋，确保该房屋及其附属设施处于安全状态。
                    <br> &nbsp; &nbsp; &nbsp;（二）乙方应当合理使用并爱护房屋及其附属设施设备，不得对房屋进行装修。
                    <br> &nbsp; &nbsp; &nbsp;（三）室内日常使用的设施设备等由乙方自行负责维修。
                    <br> &nbsp; &nbsp; &nbsp;（四）因乙方使用不当造成房屋及其附属设施设备损坏以及造成甲方或第三人财产损失和人身损害的，乙方承担维修责任和赔偿责任。
                    <br> &nbsp; &nbsp; &nbsp;（五）甲方如需要对房屋及附属设施进行检查或维修时，乙方应积极配合，如因乙方原因导致房屋及附属设施不能及时维修而发生安全事故的，乙方承担全部责任。
                </div>
                <div class="conContent">
                    <span class="rolespan">  &nbsp; &nbsp;八、房屋腾退规定</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）承租人应自合同解除或终止之日腾退该房屋, 并结清租金、物管费、水、电、气等相关费用，将房屋及附属设施交还甲方。
                    <br> &nbsp; &nbsp; &nbsp;（二）承租人在租赁合同期满或终止后，不符合租住条件但暂时无法退房的，可以给予3个月的过渡期，签订《短期租赁合同》，过渡期内按市场租金的80%标准计收租金。
                    <br> &nbsp; &nbsp; &nbsp;（三）承租人不再符合租住条件，拒不腾退住房的，按原租金标准的双倍收取租金。甲方有权提起诉讼，申请人民法院强制执行。

                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp; 九、合同的终止</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）租赁期满合同自然终止。
                    <br> &nbsp; &nbsp; &nbsp;（二）因不可抗力因素导致合同无法履行的，合同终止。
                    <br> &nbsp; &nbsp; &nbsp;（三）乙方自愿提前退出公共租赁住房，可向甲方申请终止本合同，双方据实进行相关费用的结算。
                    <br> &nbsp; &nbsp; &nbsp;（四）房屋租赁期限内，乙方去世或者外迁的，甲方有权解除本合同，收回房屋。乙方家庭共同居住人需继续承租的，应重新提出书面申请，经审核符合条件的，可办理相关手续继续承租。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;十、合同的解除</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）甲方有下列行为之一的，承租人有权单方解除合同：
                    <br> &nbsp; &nbsp; &nbsp;1.未按约定交付房屋或者交付的房屋不符合质量安全标准的；
                    <br> &nbsp; &nbsp; &nbsp;2.未按本合同约定履行房屋维修义务，严重影响正常使用的；
                    <br> &nbsp; &nbsp; &nbsp;3.<input class="easyui-textbox" style="width: 90%" name="firstPartyOpinion" >。
                    <br> &nbsp; &nbsp; &nbsp;（二）乙方有下列行为之一的，甲方有权解除合同收回该房屋，并要求乙方赔偿损以及将有关情况记入承租人的住房保障个人诚信档案。
                    <br> &nbsp; &nbsp; &nbsp;1.租赁期届满，乙方未再续租的;
                    <br> &nbsp; &nbsp; &nbsp;2.乙方不再符合公共租赁住房保障条件的；
                    <br> &nbsp; &nbsp; &nbsp;3.乙方擅自改变公共租赁住房用途的；
                    <br> &nbsp; &nbsp; &nbsp;4.破坏或者擅自装修所承租公共租赁住房，拒不恢复原状的；
                    <br> &nbsp; &nbsp; &nbsp;5.乙方无正当理由连续3个月以上未在承租的公共租赁住房居住的；
                    <br> &nbsp; &nbsp; &nbsp;6.乙方将公共租赁住房出借、转租或者擅自调换的；
                    <br> &nbsp; &nbsp; &nbsp;7.乙方无正当理由累计3个月以上未缴纳公共租赁住房租金的；
                    <br> &nbsp; &nbsp; &nbsp;8.乙方在该房屋中从事违法活动的；
                    <br> &nbsp; &nbsp; &nbsp;9.法律法规或租赁合同约定的其他情形。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;十一、不可抗力</span>
                    <br> &nbsp; &nbsp; &nbsp;租赁期间，因自然灾害及其他不可抗力事件，使该房屋及其设施设备全部或一部分损坏，导致该房屋不能使用时，本合同自行终止，双方互不承担责任。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;十二、争议解决方式</span>
                    <br> &nbsp; &nbsp; &nbsp;本合同履行中发生的争议，法律、法规、规章、政策有相关规定的，按规定执行；没有规定的，双方可以协商和解，协商不成的，双方约定按下列第
                    <select class="easyui-combobox" name="disputeResolution" style="width: 100px" data-options="required:true,editable:false,panelHeight:'auto',valueField:'id',textField:'text'">
                        <option value="1">（一）</option>
                        <option value="2" selected>（二）</option>
                    </select>种方式解决争议：
                    <br>（一）向徐州市仲裁委员会申请仲裁；
                    <br>（二）向人民法院起诉。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp; 十三、其他约定事项</span>
                    <br> &nbsp; &nbsp; &nbsp;（一）本合同未尽事宜按照《徐州市市区公共租赁住房管理办法》（徐政规﹝2012﹞8号文件）和《徐州市市区公共租赁住房运营管理实施意见》（徐政规﹝2013﹞230号文件）的相关规定执行。
                    <br> &nbsp; &nbsp; &nbsp;（二）乙方及承租人承诺，本合同中填写的名称、联系方式、证件信息准确无误，为与甲方联系的有效方式。联系方式如有变更，乙方及承租人应书面通知甲方。甲方依据上述联系方式采用直接递交或者邮递方式送达，发出即视为送达。
                    <br> &nbsp; &nbsp; &nbsp;（三）本合同未尽事宜，经甲乙双方协商一致，可订立补充条款。补充条款及附件均为本合同组成部分，与本合同具有同等法律效力。
                </div>
                <div class="conContent">
                    <span class="rolespan"> &nbsp; &nbsp;十五、合同的生效</span><br>
                    &nbsp; &nbsp; &nbsp;本合同经甲乙双方签字盖章后生效。本合同一式贰份，甲方执壹份，乙方执壹份，具有同等法律效力。
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
                <input type="hidden" name="ctCode" value="${contractTemplateFillingDataPojo.ctCode}"/>
                <input type="hidden" name="contractNo" value="${contractTemplateFillingDataPojo.contractNo}"/>
                <input type="hidden" name="userName" value="${contractTemplateFillingDataPojo.userName }"/>
                <input type="hidden" name="legalRepresentative" value="${contractTemplateFillingDataPojo.legalRepresentative }"/>
                <input type="hidden" name="businessLicense" value="${contractTemplateFillingDataPojo.businessLicense }"/>
                <input type="hidden" name="principadName" value="${contractTemplateFillingDataPojo.principadName }"/>
                <input type="hidden" name="principadMobilePhone" value="${contractTemplateFillingDataPojo.principadMobilePhone }"/>
                <input type="hidden" name="principadContactAddress" value="${contractTemplateFillingDataPojo.principadContactAddress }"/>
                <input type="hidden" name="lessee" value="${contractTemplateFillingDataPojo.lessee }"/>
                <input type="hidden" name="lesseeCardId" value="${contractTemplateFillingDataPojo.lesseeCardId }"/>
                <input type="hidden" name="lesseeContactAddress" value="${contractTemplateFillingDataPojo.lesseeContactAddress }"/>
                <input type="hidden" name="lesseeContactPhone" value="${contractTemplateFillingDataPojo.lesseeContactPhone }"/>
                <input type="hidden" name="community" value="${contractTemplateFillingDataPojo.community }"/>
                <input type="hidden" name="building" value="${contractTemplateFillingDataPojo.building}"/>
                <input type="hidden" name="unit" value="${contractTemplateFillingDataPojo.unit}"/>
                <input type="hidden" name="room" value="${contractTemplateFillingDataPojo.room }"/>
                <input type="hidden" name="constructionArea" value="${contractTemplateFillingDataPojo.constructionArea }"/>
                <input type="hidden" name="yearTime" value="${contractTemplateFillingDataPojo.yearTime }"/>
                <input type="hidden" name="yearSta" value="${contractTemplateFillingDataPojo.yearSta}"/>
                <input type="hidden" name="monthSta" value="${contractTemplateFillingDataPojo.monthSta}"/>
                <input type="hidden" name="daySta" value="${contractTemplateFillingDataPojo.daySta }"/>
                <input type="hidden" name="yearEnd" value="${contractTemplateFillingDataPojo.yearEnd}"/>
                <input type="hidden" name="monthEnd" value="${contractTemplateFillingDataPojo.monthEnd}"/>
                <input type="hidden" name="dayEnd" value="${contractTemplateFillingDataPojo.dayEnd }"/>
                <input type="hidden" name="buildingStructure" value="${contractTemplateFillingDataPojo.buildingStructure }"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<script>
    function save(){
        $(".over").show();
        var data =bank.biography().getParams('idData');
        var objId = data.row.objId;
        var type = "${contractTemplateFillingDataPojo.apSqlb}";
        var rentalSubsidiesTPZH = $("#yearUnder").text();
        var cType = "";
        if(data.row.contractDetail == undefined){
            cType = 1;
        }else if(data.row.contractDetail != undefined && data.row.contractDetail.cType == ""){
            cType = 1;
        }else if(data.row.contractDetail != undefined && data.row.contractDetail.cType != ""){
            cType = data.row.contractDetail.cType;
        }
        bank.ajaxForm('#form','<%=basePath%>contractTemplate/getContractTemplateFile',{objId:objId,apSqlb:type,rentalSubsidiesTPZH:rentalSubsidiesTPZH,cType:cType},function(data){
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


