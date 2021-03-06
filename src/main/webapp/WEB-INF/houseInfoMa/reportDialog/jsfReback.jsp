<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" id="house">
<div data-options="region:'north',border:false" style="overflow: hidden" id="publicNorth">
    <div class="search-group" style="float: right;width:180px;margin-right: 50px">
        <li class="query-btn" style="float: right"><a class="icon iconfont icon-icon- " onclick="save()"><i>打印</i></a></li>
    </div>
</div>
<div data-options="region:'center',border:false">
    <form class='easyui-form' id='form' method='post'>
        <div class="contract">
            <div class="conPage">
                <div class="conTitle">市区经济适用住房退房审批表</div>
                <div class="conCode">编号：徐住保经退（ ${year} ）${htQue}号</div>
                <table style="margin:20px auto 50px;width:100%">
                    <tr>
                        <td class="td_20" colspan="2">申请人姓名</td>
                        <td class="td_30">${approve.username}</td>
                        <td class="td_20" colspan="2">身份证号码</td>
                        <td class="td_30">${approve.sfzh}</td>
                    </tr>
                    <tr>
                        <td class="td_20" colspan="2">配偶姓名</td>
                        <td class="td_30"><input class="easyui-textbox" name="poxm" value="${approve.poxm}" data-options="required:true,validType:['empty','chinese','specialCharacter'],events:{keyup:setName}" /></td>
                        <td class="td_20" colspan="2">身份证号码</td>
                        <td class="td_30"><input class="easyui-textbox" name="posfzh" value="${approve.posfzh}" data-options="required:true,validType:['sfz','empty'],events:{keyup:setName}" /></td>
                    </tr>
                    <tr>
                        <td class="td_20" colspan="2">房屋座落</td>
                        <td class="td_80" colspan="5"><span class="conUnder">${approve.f_community}</span>小区
                            <span class="conUnder">${approve.f_buname}</span>号楼<span class="conUnder">${approve.f_cecode}</span>单元<span class="conUnder">${approve.f_ronum}</span>室(经房<span class="conUnder"><input class="easyui-textbox" name="pici" data-options="required:true,events:{keyup:setName}"/></span>期)</td>
                    </tr>
                    <tr>
                        <td class="td_20" colspan="2">所属辖区</td>
                        <td class="td_30"><span class="conUnder">${approve.ssq}</span> <span class="conUnder">${approve.ssj}</span>街道办事处<span class="conUnder"><input class="easyui-textbox" name="sqjwh" value="${approve.apSqjwh}" data-options="required:true" /></span>社区)</td>
                        <td class="td_20" colspan="2">联系电话</td>
                        <td class="td_30">${approve.linktel}</td>
                    </tr>
                    <tr>
                        <td class="td_20" colspan="2">原购房资格及<br/>选房顺序号</td>
                        <td class="td_30"> <span class="conUnder">${approve.sh_ssq}</span>经房<span class="conUnder"><input class="easyui-textbox" name="num" value="${approve.num}" data-options="required:true" />号</span></td>
                        <td class="td_20" colspan="2">购房合同编号</td>
                        <td class="td_30"><input class="easyui-textbox" name="htbh"  data-options="required:true,events:{keyup:setName}"/></td>
                    </tr>
                    <tr>
                        <td class="td_6">退<br/>房<br/>事<br/>由</td>
                        <td class="td_44" colspan="2"><input class="easyui-textbox" style="height: 150px;width: 100%" name="yuanyin" value="个人原因退房" data-options="required:true,multiline:true" /></td>
                        <td class="td_6">申<br/>请<br/>人<br/>具<br/>结</td>
                        <td class="td_44" colspan="2" style="text-align: left">本人自愿退出已购经济适用住房，并保证承担由此产生的一切法律责任。<br>
                        <div style="text-align: center">签字：</div>
                        <div style="text-align: right">&nbsp; 年 &nbsp; 月 &nbsp; 日&nbsp;</div></td>
                    </tr>
                    <tr>
                        <td class="td_6">住房<br/>保障<br/>服务<br/>中心<br/>审批<br/>意见</td>
                        <td class="td_44" colspan="2">
                            <div style="text-align: center">（盖章）</div>
                            <div style="text-align: right">&nbsp; 年 &nbsp; 月 &nbsp; 日&nbsp;</div>
                        </td>
                        <td class="td_6">恒远<br/>物业<br/>公司<br/>办理<br/>意见</td>
                        <td class="td_44" colspan="2">
                            <div style="text-align: center">（盖章）</div>
                            <div style="text-align: right">&nbsp; 年 &nbsp; 月 &nbsp; 日&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_6">康乐<br/>公司<br/>经营<br/>科办<br/>理意<br/>见</td>
                        <td class="td_44" colspan="2">
                            <div style="text-align: center">经办人签字：</div>
                            <div style="text-align: right">&nbsp; 年 &nbsp; 月 &nbsp; 日&nbsp;</div>
                        </td>
                        <td class="td_6">康乐<br/>公司<br/>财务<br/>科退<br/>款办<br/>理意<br/>见</td>
                        <td class="td_44" colspan="2">
                            <div style="text-align: center">经办人签字：</div>
                            <div style="text-align: right">&nbsp; 年 &nbsp; 月 &nbsp; 日&nbsp;</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_6">说明</td>
                        <td class="td_94" colspan="5">
                            1.退房办理流程：购房人提出退房申请→区住保部门确认后上报市住房保障服务中心核准<br/>
                            →市住房保障服务中心审核签署审批意见→恒远物业公司查验接收房屋并签署意见盖章<br/>
                            →康乐公司办理注销合同和退款事宜。<br/>
                            2.本表一式肆份，由市住房保障服务中心，康乐公司经营科、康公司财务科、恒远物业公司各执一份留存归档。
                        </td>
                    </tr>
                </table>

                <div class="conCode">编号：徐住保经退（ ${year} ）${htQue}号</div>
                <div class="conTitle">退房核验通知书</div>
                <div class="conTitle">（存根联）</div>
                <div class="conRole">
                    <span class="rolespan">恒远物业管理公司<span class="conUnder">${approve.f_community}</span>管理处：</span>
                </div>
                <div class="conContent">
                    &nbsp;&nbsp;&nbsp;&nbsp;兹有<span class="conUnder">${approve.ssq}</span> <span class="conUnder">${year}</span>年第<span class="conUnder pici"></span>期经济适用住房购房人<span class="conUnder username">${approve.username}</span>
                    （身份证号：<span class="conUnder sfzh">${approve.sfzh}</span>)，配偶：<span class="conUnder poxm">${approve.poxm}</span>（身份证号：<span class="conUnder posfzh">${approve.posfzh}</span>),
                    购房合同编号：<span class="conUnder htbh"></span>,	因自
                    身原因提出申请，自愿放弃已购买的本期经济适用住房：<span class="conUnder">${approve.f_community}</span>小区
                    <span class="conUnder">${approve.f_buname}</span>号楼<span class="conUnder">${approve.f_cecode}</span>单元<span class="conUnder">${approve.f_ronum}</span>室。现已经市住房保障服务中心受理，
                    请对该房屋进行退房核验并结算相关费用，办理退房接收手续。
                </div>
                <div class="conCode">徐州市住房保障服务中心</div>
                <div class="conCode" style="margin-top: 10px">年 月 日</div>

                <div style="border: dashed 1px #000;margin:50px 0"></div>

                <div class="conCode">编号：徐住保经退（ ${year} ）${htQue}号</div>
                <div class="conTitle">退房核验通知书</div>
                <div class="conRole">
                    <span class="rolespan">恒远物业管理公司<span class="conUnder">${approve.f_community}</span>管理处：</span>
                </div>
                <div class="conContent">
                    &nbsp;&nbsp;&nbsp;&nbsp;兹有<span class="conUnder">${approve.ssq}</span> <span class="conUnder">${year}</span>年第<span class="conUnder pici"></span>期经济适用住房购房人<span class="conUnder username">${approve.username}</span>
                    （身份证号：<span class="conUnder sfzh">${approve.sfzh}</span>)，配偶：<span class="conUnder poxm">${approve.poxm}</span>（身份证号：<span class="conUnder posfzh">${approve.posfzh}</span>),
                    购房合同编号：<span class="conUnder htbh"></span>,	因自
                    身原因提出申请，自愿放弃已购买的本期经济适用住房：<span class="conUnder">${approve.f_community}</span>小区
                    <span class="conUnder">${approve.f_buname}</span>号楼<span class="conUnder">${approve.f_cecode}</span>单元<span class="conUnder">${approve.f_ronum}</span>室。现已经市住房保障服务中心受理，
                    请对该房屋进行退房核验并结算相关费用，办理退房接收手续。
                </div>
                <div class="conCode">徐州市住房保障服务中心</div>
                <div class="conCode" style="margin-top: 10px">年 月 日</div>

                <input type="hidden" name="year" value="${year}"/>
                <input type="hidden" name="htQue" value="${htQue }"/>
                <input type="hidden" name="applyid" value="${applyid}"/>
            </div>
        </div>
    </form>
</div>
</body>
</html>
<style>
    .contract .conUnder {
        border-bottom: solid 1px #000;
    }
    table{border-collapse:collapse;}
    table,table tr th, table tr td{border:1px solid #000;}
    table tr th,table tr td{line-height:30px;text-align:center;
        font-weight:bold;font-family: 仿宋;}
    .td_6{width:6%;}
    .td_20{width:20%;}
    .td_30{width:30%;}
    .td_44{width:44%;}
    .td_50{width:50%;}
    .td_80{width:80%;}
    .td_94{width:94%;text-align:left;}
</style>

<script>
    function setName(){
        var name=$(this).siblings('input').attr("name");
        var val=$(this).val();
        $('.'+name+'').text(val);
    }
    function save(){
        bank.ajaxForm('#form','<%=basePath %>sourceHouse/getJSFHouseFile',{},function(data){
                //提交表单
            bank.ajaxMessage(data);
            var a = $('<a href="<%=basePath %>'+data+'" target="_blank"></a>')[0];
            var e = document.createEvent('MouseEvents');
            e.initEvent('click', true, true);
            a.dispatchEvent(e);
            });
    }
</script>
