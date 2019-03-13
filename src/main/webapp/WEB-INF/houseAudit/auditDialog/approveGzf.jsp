<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="/WEB-INF/index/header.jsp" flush="true"></jsp:include>
<body class="easyui-layout" id="gzf">
<div data-options="region:'center',border:false">
	<div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto;position: relative">
		<div class="applyContainer">
			<div class="applyTitle"><span>公共租赁住房（低保、特困家庭）年审申请</span></div>
			<div class="applyContent">
				<form method="post" id="form" class="easyui-form">
					<ul class="apply-group windowInner">
						<li class="readonly">
							<input class="easyui-combobox" name="apSsq" style="width: 92%"
								   data-options="label:'户籍所在区（县）:',readonly:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=05'">
						</li>
						<li class="readonly">
							<input class="easyui-combobox" name="apJdbsc" style="width: 92%"
								   data-options="label:'户籍所在街道办事处:',readonly:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=06'">
							<input name="apSqlb" type="hidden"
								   value="3">
						</li>
						<li class="readonly">
							<input class="easyui-textbox" name="apSqjwh" style="width: 92%" data-options="label:'户籍所在社区:',required:true,readonly:true">
						</li>
					</ul>
					<div class="applyTab">
						<div class="left tabChange" id="left">
							<img src="<%=basePath %>src/img/audit/left.png" />
						</div>
						<div class="right tabChange" id="right">
							<img src="<%=basePath %>src/img/audit/right.png" />
						</div>
						<div class="stepProcess">
							<ul class="step">
								<li style="width: 19%">
									<div class="step-img-green">
										<span>1</span>
									</div>
									<p>基本信息</p>
								</li>
								<li style="width: 19%">
									<div class="step-img">
										<span>2</span>
									</div>
									<p class="blue">家庭住房情况</p>
								</li>
								<li style="width: 19%">
									<div class="step-img">
										<span>3</span>
									</div>
									<p class="blue">拆迁与低保</p>
								</li>
								<li style="width: 19%">
									<div class="step-img">
										<span>4</span>
									</div>
									<p class="blue">同住家庭成员情况</p>
								</li>
								<li style="width: 19%">
									<div class="step-img">
										<span>5</span>
									</div>
									<p class="blue">附件信息</p>
								</li>
							</ul>
							<div class="process">
								<div class="imgparent">
									<img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="width: 21%"/>
									<img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none;width:21%"/>
									<img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none;width:21%"/>
									<img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none;width:21%"/>
									<img class="imgpro" src="<%=basePath %>src/img/audit/proces.png" style="display: none;width:21%"/>
								</div>
							</div>
						</div>
					</div>
					<!--填写内容区-->
					<div id="inner">
						<div>
							<ul class="apply-group windowInner">
								<legend>申请人信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[0].afmXm" id="applyFamilyMembers0afmXm" style="width: 92%"
										   data-options="label:'姓名:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[0].afmSfzh"  id="applyFamilyMembers0afmSfzh" style="width: 92%"
										   data-options="label:'身份证号码:',readonly:true">
								</li>
								<li class="readonly">
									<select class="easyui-combobox" name="applyFamilyMembers[0].afmXb" id="applyFamilyMembers0afmXb" style="width: 92%"
											data-options="label:'性别:',readonly:true">
										<option>男</option>
										<option>女</option>
									</select>
								</li>
								<li class="readonly">
									<select class="easyui-combobox" name="applyFamilyMembers[0].afmHyzk" id="applyFamilyMembers0afmHyzk" style="width: 92%" data-options="label:'婚姻状况:',readonly:true,valueField:'piItemcode',textField:'piItemname',url:'<%=basePath %>ParmItem/getOptions?parmSetcode=07'">
									</select>
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[0].afmGzdw" id="applyFamilyMembers0afmGzdw" style="width: 92%"
										   data-options="label:'工作单位:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[0].afmLxdh" id="applyFamilyMembers0afmLxdh" style="width: 92%"
										   data-options="label:'联系电话:',readonly:true,validType:'phone'">
								</li>
							</ul>
							<ul class="apply-group windowInner">
								<legend>配偶信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[1].afmXm" id="applyFamilyMembers1afmXm" style="width: 92%"
										   data-options="label:'姓名:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[1].afmSfzh" id="applyFamilyMembers1afmSfzh"  style="width: 92%"
										   data-options="label:'身份证号码:',readonly:true">
								</li>
								<li class="readonly">
									<select class="easyui-combobox" name="applyFamilyMembers[1].afmXb" id="applyFamilyMembers1afmXb" style="width: 92%"
											data-options="label:'性别:',readonly:true">
										<option>男</option>
										<option>女</option>
									</select>
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[1].afmGzdw" id="applyFamilyMembers1afmGzdw" style="width: 92%"
										   data-options="label:'工作单位:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyMembers[1].afmLxdh" id="applyFamilyMembers1afmLxdh" style="width: 92%"
										   data-options="label:'联系电话:',readonly:true,validType:'phone'">
								</li>
								<li class="readonly">
									<label style="display: inline-block;width: 130px;float: left;margin-left: -3px">是否特殊家庭:</label>
									<input type="checkbox" name="apTsjt" value="1" disabled/>烈属&nbsp;&nbsp;
									<input type="checkbox" name="apTsjt" value="2" disabled/>残疾人&nbsp;&nbsp;
									<input type="checkbox" name="apTsjt" value="3" disabled/>孤寡老人&nbsp;&nbsp;
								</li>
							</ul>
							<ul class="apply-group windowInner">
								<legend>户籍信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="apSqhjnx" style="width: 92%"
										   data-options="label:'户籍年限:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="apJtnsr" style="width: 92%"
										   data-options="label:'家庭年收入:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="apJtrk" style="width: 92%"
										   data-options="label:'家庭人口:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="apRjysr" style="width: 92%"
										   data-options="label:'人均月收入:',readonly:true">
								</li>
							</ul>
							<ul class="apply-group windowInner">
								<legend>工作单位信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyUnit.legelrep" id="applyUnitlegelrep"  style="width: 92%" data-options="label:'法定代表人',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyUnit.bsls" id="applyUnitbsls"  style="width: 92%" data-options="label:'营业执照号:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyUnit.entag"  id="applyUnitentag" style="width: 92%" data-options="label:'委托代理人:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyUnit.tel" id="applyUnittel" style="width: 92%" data-options="label:'手机号码:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyUnit.address" id="applyUnitaddress" style="width: 92%" data-options="label:'联系地址:',readonly:true">
								</li>
							</ul>
						</div>
						<div style="display: none;">
							<ul class="apply-group windowInner" >
								<legend>家庭现住房情况</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouses[0].afhZl" id="applyFamilyHouses0afhZl" style="width: 92%" data-options="label:'房屋地址:',readonly:true">
									</li>
								<li class="readonly">
								    <input class="easyui-textbox" name="applyFamilyHouses[0].afhCqr" id="applyFamilyHouses0afhCqr" style="width: 92%" data-options="label:'产权人:',readonly:true">
								</li>
								<li class="readonly">
								    <input class="easyui-textbox" name="applyFamilyHouses[0].afhMj" id="applyFamilyHouses0afhMj" style="width: 92%" data-options="label:'建筑面积:',readonly:true">
								</li>
								<li class="readonly">
								    <input class="easyui-textbox" name="applyFamilyHouses[0].afhRjmj" id="applyFamilyHouses0afhRjmj" style="width: 92%" data-options="label:'人均建筑面积:',readonly:true">
								</li>
								<li class="readonly">
								   <input class="easyui-combobox" name="applyFamilyHouses[0].afhZfxz" id="applyFamilyHouses0afhZfxz" style="width: 92%" data-options="label:'现住房性质:',readonly:true,valueField:'piItemcode',textField:'piItemname',
								   url:'<%=basePath %>ParmItem/getOptions?parmSetcode=01'">
								</li>
							</ul>
							<ul class="apply-group windowInner">
								<legend>住房变更情况</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcYzfzl" id="applyFamilyHouseChangeafhcYzfzl" style="width: 92%"
										   data-options="label:'原住房地址:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcCqr" id="applyFamilyHouseChangeafhcCqr" style="width: 92%"
										   data-options="label:'原产权人:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcJzmj"  id="applyFamilyHouseChangeafhcJzmj" style="width: 92%"
										   data-options="label:'建筑面积（m²）:',readonly:true">
								</li>
								<li class="readonly">
									<input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="拆迁"/>拆迁&nbsp;&nbsp;
									<input type="radio" name="applyFamilyHouseChange.afhcBgfs" value="转让"/>转让 (时间)
									<input class="easyui-datebox" name="applyFamilyHouseChange.afhcBgsj" id="applyFamilyHouseChangeafhcBgsj" style="width: 58%" data-options="readonly:true">
								</li>
								<li id="qc" class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcZrbcje" id="applyFamilyHouseChangeafhcZrbcje" style="width: 92%"
										   data-options="label:'货币补偿金额:',readonly:true">
								</li>
							</ul>
						</div>
						<div style="display: none;">
							<ul class="apply-group windowInner">
								<legend>安置信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcAzfzl" id="applyFamilyHouseChangeafhcAzfzl" style="width: 92%"
										   data-options="label:'安置房地址:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="applyFamilyHouseChange.afhcAzfjzmj"  id="applyFamilyHouseChangeafhcAzfjzmj" style="width: 92%"
										   data-options="label:'建筑面积:',readonly:true">
								</li>
							</ul>
							<ul class="apply-group windowInner">
								<legend>低保信息</legend>
								<li class="readonly">
									<input class="easyui-textbox" name="apDbzbh" style="width: 92%"
										   data-options="label:'低保证编号:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-textbox" name="apLqrs" style="width: 92%"
										   data-options="label:'低保领取人数:',readonly:true">
								</li>
								<li class="readonly">
									<input class="easyui-datebox" name="apFzsj" style="width: 92%"
										   data-options="label:'低保发证时间',readonly:true">
								</li>
							</ul>
						</div>
						<div style="display: none"  id="addPerson"></div>
						<div style="display: none;">
							<table id="table" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
								<tr style="background: #66a0d3">
									<th class="rowCode">序号</th>
									<th style="width:250px;text-align: center">附件名称</th>
									<th style="width:70%;text-align: center">附件图片</th>
								</tr>
								<tr>
									<td class="rowCode">1</td>
									<td class="tdname"><span class="name">收入情况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(0)">查看详情</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">2</td>
									<td class="tdname"><span class="name">住房状况证明材料</span><span class="red">*(必填)</span><span class="aspan" onclick="view(1)">查看详情</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">3</td>
									<td class="tdname"><span class="red">*(必填)</span><span class="name">家庭成员身份证</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">4</td>
									<td class="tdname"><span class="name">家庭成员户口簿(含首页)</span><span class="red">*(必填)</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">5</td>
									<td class="tdname"><span class="name">合法有效家庭成员之间的赡养、抚养、扶养关系及共同生活的证明</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">6</td>
									<td class="tdname"><span class="name">反映家庭财产状况的有关证明材料</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">7</td>
									<td class="tdname"><span class="name">申请人申报财产真实性书面承诺</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">8</td>
									<td class="tdname"><span class="name">特殊情况证明</span><span class="aspan" onclick="view(3)">查看详情</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">9</td>
									<td class="tdname"><span class="name">婚姻情况证明</span><span class="red">*(必填)</span><span class="aspan" onclick="view(2)">查看详情</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">10</td>
									<td class="tdname"><span class="name">户籍所在地社区公示证明</span><span class="red">*(必填)</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
								<tr>
									<td class="rowCode">11</td>
									<td class="tdname"><span class="name">其他相关材料</span></td>
									<td class="addJpg">
										<div class="imageList">

										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
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
</div>
<div data-options="region:'south',border:false">
	<div class="auditRestlt">
		<div class="auditOpion">
			<input class="easyui-textbox" id="comment" name="opion" style="width: 92%;height: 100px" data-options="label:'审核意见:',multiline:true">
		</div>
		<ul class="search-group">
			<li style="width: 600px">
				<label class="textbox-label">审核结果：</label>
				<input type="radio" name="all" value="1"><label class="lispan">通过</label>
				<span class="lispace"></span>
				<input type="radio" name="all" value="2"><label class="lispan">打回修改</label>
				<span class="lispace"></span>
				<input type="radio" name="all" value="3"><label class="lispan">驳回</label>
				<span class="lispace"></span>
				<input type="radio" name="all" value="4"><label class="lispan">加入失信</label>
			</li>
			<li class="query-btn tijiao" onclick="submit()"><a class="icon iconfont " >提交</a> </li>
			<li class="query-btn" onclick="back()"><a class="icon iconfont " >返回</a></li>
		</ul>
	</div>
</div>
</body>
<script>
	var flag=true; var changeImg='';
    $(function () {
        if("${chengxin}"=="chengxin"){
            $('#gzf').layout('remove','south');
        }
        if("${chengxin}"=="gongshi"){
            var data=bank.biography().getParams('viewGongshi');
            var proid=data.row.proid;
            var blgIsgs=data.row.blgIsgs;
            $(".tijiao").hide();
            setPublic(proid,blgIsgs);
        }
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
    /*审批提交*/
    function submit(){
        var submitArray={'1':'通过此申请','2':'打回此申请','3':'驳回此申请','4':'此人加入失信'};
        if(flag){
            flag=false;
            var processInstanceId="${processInstanceId}";//流程实例id
            var approveResult =$.trim($("input[name='all']:checked").val());//审批的结果选择
            var comment = $.trim($("#comment").val());//审批意见
            var resultText=submitArray[approveResult];
            if(approveResult.length>0&&comment.length>0){
                $.messager.confirm('操作提示', '您确定'+resultText+'吗？', function (r) {
                    if (r) {
                        $.post("<%=basePath %>task/approveTask", {
                                processInstanceId:processInstanceId,
                                approveResult:approveResult,
                                comment:comment
                            },
                            function (data) {
                                bank.ajaxMessage(data);
                                if(data=="审批成功"){
                                    setTimeout(function () {
                                        if (window.opener && !window.opener.closed) {
                                            window.parent.opener.location.reload();
                                        }else{
                                            parent.location.reload();
                                        }
                                        window.close(); return false;
                                    },1000);
                                    flag=false;
                                }else{
                                    flag=true;
                                }
                            }, "json");
                    }
                });

            }
            else{
                flag=true;
                bank.alertMessage("请填写审核意见和审核结果！")
            }
		}
    }
    //返回
    function back(){
        window.close();
        self.location=document.referrer;
    }
    //tab切换
    $(".step li").on("click", function(e) {
        e.preventDefault();
        var i = $(this).index();
        tabshow(i)
    });
    function tabshow(i){
        $(".step li").eq(i).children("div").removeClass("step-img").addClass("step-img-green");
        $(".step li").eq(i).siblings().children("div").addClass("step-img").removeClass("step-img-green");
        $(".step li").eq(i).children("p").removeClass("blue");
        $(".step li").eq(i).siblings().children("p").addClass("blue");
        $(".process .imgparent img:lt("+(i+1)+")").show();
        $(".process .imgparent img:gt("+(i)+")").hide();
        $("#inner div").eq(i).show().siblings().hide();
    }
    $(".applyTab .tabChange").click(function(){
        var tabName=$(this).attr("id");
        var index=Number($(".step  .step-img-green ").parent().index());
        if(tabName=="left"){
            if(index==0){
                index=4;
            }else{
                index--;
            }
            tabshow(index);
        }
        if(tabName=="right"){
            if(index==4){
                index=0;
            }else{
                index++;
            }
            tabshow(index);
        }
    });

    //图片处理
    $("body").on('click','.imageList img',function(){
        //创建一个矩形区域,获取此图片相对偏移量
        $(".imgOperate").show();
        $(".imgOperate img")[0].src=$(this)[0].src;
        var width=Number($(this).attr("data-width"));
        var height=Number($(this).attr("data-height"));
        aimDiv=$(".imgOperate");
        aimImg=$(".imgOperate img");
        aimDiv.rotation=0;
        if(changeImg!=($(this)[0].src)){
            changeImg=$(this)[0].src;
            aimImg.css({
                width:width,
                height:height
            });
            aimImg.width=width;
            aimImg.height=height;
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

    //添加家庭成员
    function setPerson(data){
        if(data.applyFamilyMembers.length>1){
            for(var i=2;i<data.applyFamilyMembers.length;i++){
                $('#addPerson').append(' <ul class="apply-group windowInner">' +
                    '<legend>同住家庭成员情况</legend>' +
                    '<li class="readonly">' +
                    '<input class="easyui-combobox" name="applyFamilyMembers['+i+'].afmYsqrgx" id="applyFamilyMembers'+i+'afmYsqrgx" style="width: 92%" data-options="label:\'关系:\',readonly:true,valueField:\'piItemcode\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/getOptions?parmSetcode=13\'">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmXm" id="applyFamilyMembers'+i+'afmXm" style="width: 92%" data-options="label:\'姓名:\',readonly:true">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-datebox" name="applyFamilyMembers['+i+'].afmCsny" id="applyFamilyMembers'+i+'afmCsny" style="width: 92%" data-options="label:\'出生年月\',readonly:true">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-combobox" name="applyFamilyMembers['+i+'].afmHyzk" id="applyFamilyMembers'+i+'afmHyzk" style="width: 92%" data-options="label:\'婚姻状况:\',readonly:true,valueField:\'piItemcode\',textField:\'piItemname\',url:\'<%=basePath %>ParmItem/getOptions?parmSetcode=07\'">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmGzdw" id="applyFamilyMembers'+i+'afmGzdw" style="width: 92%" data-options="label:\'工作单位:\',readonly:true">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmSfzh" id="applyFamilyMembers'+i+'afmSfzh" style="width: 92%" data-options="label:\'身份号码:\',readonly:true">' +
                    '</li>' +
                    '<li class="readonly">' +
                    '<input class="easyui-textbox" name="applyFamilyMembers['+i+'].afmNsr" id="applyFamilyMembers'+i+'afmNsr" style="width: 92%" data-options="label:\'年收入:\',readonly:true">' +
                    '</li>' +
                    '</ul>');
            }
            $.parser.parse($("#addPerson"))
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
                            if(typeClass.indexOf('easyui-combobox')!=-1){
                                $('#'+idArray[0]+idArray[1]+'').combobox('setValue',(data[x])[idArray[1]])
                            }else if(typeClass.indexOf('easyui-datebox')!=-1){
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
                            if(typeClass.indexOf('easyui-combobox')!=-1){
                                $('#'+idArray[0]+idArray[1]+idArray[2]+'').combobox('setValue',(data[x])[indexCode][idArray[2]])
                            }else if(typeClass.indexOf('easyui-datebox')!=-1){
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
        if($.trim(data.applyFamilyHouseChange.afhcCqr).length>0){
            console.log(data.applyFamilyHouseChange.afhcBgfs);
            $("input:radio[value='"+data.applyFamilyHouseChange.afhcBgfs+"']").prop('checked',true);
            $("input:radio[value='"+data.applyFamilyHouseChange.afhcBgfs+"']").siblings('input').prop('disabled',true)
            if(data.applyFamilyHouseChange.afhcBgfs=="拆迁"){
                $("#cq label").text("拆迁金额:");
            }
        }
    }
    //回填图片
    function setImage(data){
        if(data.volList.length>0){
            var volList=data.volList;
            for(var i=0;i<volList.length;i++){
                for(var j=0;j<volList[i].volelearcDtls.length;j++){
                    var imageUrl = "<%=basePath%>"+(volList[i].volelearcDtls)[j].imgname;
                    var width =(volList[i].volelearcDtls)[j].width;
                    var height =(volList[i].volelearcDtls)[j].height;
                    $("#table tr:contains('"+volList[i].elearcname+"')").find(".imageList").append(
                        '<img src="'+imageUrl+'" data-width="'+width+'" data-height="'+height+'">')
                }
            }

        }
    }

    //根据选择审核结果，判断审核节点是否发送短信
    $('body').on('change','input[type=radio][name=all]',function(){
        var radioId=$.trim($(this).val());
        if(radioId=="1"){
            $("#comment").textbox("setValue","经审核，符合条件");
        }else{
            $("#comment").textbox("setValue","");
        }
    });
    //查看审核结果
    function setPublic(proid,blgIsgs){
        $.ajax({
            url:"<%=basePath %>task/listCommentCX",
            type:'post',
            dataType:'json',
            data:{
                processInstanceId:proid
            },
            success:function(data){
                $("#comment").textbox({'disabled':true});
                $("input[name=all]").prop("disabled",true);
                if(blgIsgs!='0'){
                    $("input[name=all][value='4']").prop("checked",true);
                }
                if(data.length>0){
                    $("#comment").textbox('setValue',data[data.length-1].comment);
                }
            }
        });
    }
    //查看附件
    function view(type){
        bank.viewAttach(type,"<%=basePath%>path/toAttachment","查看详情",500,300,true)
    }
</script>
<style>
	.textbox-label{
		width: 150px;
	}
</style>
</html>