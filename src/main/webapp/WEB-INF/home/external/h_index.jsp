<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>房管局</title>
		<link rel="stylesheet" href="<%=basePath %>src/css/index.css" />
		<script type="text/javascript" src="<%=basePath %>src/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/sgallery.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/index.js"></script>
	</head>

	<body>
		<!--head-->
		<div class="layout header">
			<div class="logo"><img src="<%=basePath %>src/img/home/logo.png"></div>
			<h1>徐州市住房保障服务中心</h1>
			<h2>Xuzhou Housing Security Service Center</h2>
		</div>
		<!--head end-->
		<div id="menu_container_id">
			<div class="layout menus">
				<ul id="first">
					<li >
						<a href="<%=basePath %>pageColumn/external/h_index" class="trans" title="网站首页">网站首页</a>
					</li>
				</ul>
				<!--搜索-->
				<div class="form">
					<input type="text" class="txt_search" placeholder="请输入关键字" />
					<input type="image" src="<%=basePath %>src/img/home/tj.png" class="find" style="position:relative;top: -27px;left: 180px;" />
					<div class="clear"></div>
				</div>
				<!--搜索end -->
			</div>
		</div>
		<div class="layout mb20">
			<!--轮播图-->
			<div class="slider">
				<div class="FocusPic">
					<div class="content" id="main-slide">
						<div class="changeDiv">

						</div>
					</div>
				</div>
			</div>
			<!--轮播图 end-->
			<!--新闻中心-->
			<div id="news">

			</div>
			<!--新闻中心 end-->
			<!--快速连接-->
			<div class="quicklink">
				<a href="<%=basePath %>path/toregiste" class="bg1">申请注册</a>
				<a href="<%=basePath %>path/toapplogin" class="bg2">登录个人中心</a>
				<a href="" class="bg3">上市交易</a>
			</div>
			<!--快速连接 end-->
		</div>
		<div class="layout" id="content">

		</div>
		<!--foot-->
		<div class="foot-wrap">
			<div class="copyright">
				<span style="font-size: 16px">版权所有：徐州市住房保障服务中心</span><br/>
				<span>友情链接：<a href="http://www.mohurd.gov.cn/" target="_blank">国家住建部</a>&nbsp;&nbsp;<a href="http://jsszfhcxjst.jiangsu.gov.cn/" target="_blank">江苏省住房和城乡建设厅</a>&nbsp;&nbsp;<a href="http://www.xz.gov.cn/" target="_blank">徐州市政府网</a>&nbsp;&nbsp;<a href="http://fg.xz.gov.cn/" target="_blank">徐州市房管局</a>&nbsp;&nbsp;<a href="http://www.xzjs.gov.cn/" target="_blank">徐州市城乡建设局</a></span><br>
				<span style="font-size: 16px">苏ICP备06020539号-3</span>
			</div>
		</div>
		<!--foot end-->
		<div id="right">
			<div class="close" onclick="closeHouse()">关闭</div>
			<div class="photo" id="footEnd">
				<%--<a class="weix" style=" position:relative" href="http://www.jszwfw.gov.cn/">
					<img src="<%=basePath %>src/img/home/weixin.png">
				</a>--%>
			</div>
		</div>
	</body>

</html>
<style>
	.quicklink {
		height: 258px;
		position: relative;
	}
	.bg3{
		position: absolute;
		bottom: 0;
	}
	.right {
		float: right;
	}
</style>
<script type="text/javascript">
	$(function() {
        $(".txt_search").val("");
        //头部导航拼接
        $.ajax({
            type:"post",
            url:"<%=basePath %>columnInfo/selectColumnInfo",
            async:true,
            success:function(data){
                var list ="";
                var columnName = "";
                var data = $.parseJSON(data);
           		for (var i = 0;i<data.length;i++) {
                   list += '<li>' +
                        '<a href="<%=basePath %>/pageColumn/external/h_active?id='+data[i].id+'" class="trans" title="'+data[i].columnName +'">' + data[i].columnName + '</a>' +
                    '</li>';
				}
                $("#first").append(list);
            }
        });

        //栏目展示
        $.ajax({
            type:"post",
            url:"<%=basePath %>columnInfo/getAllTree",
            async:true,
            success:function (data) {
                var data = $.parseJSON(data);
                var len = "";
                var liFirst = "";
                var li = "";
                var news = '<div class="news">' +
                    '<div class="news-title">' +
                    '<a href="<%=basePath %>/pageColumn/external/h_active?id='+data[0].id+'" class="more">' +
                    '更多&gt;&gt;</a>' +
                    '<h3>' + data[0].columnName +
                    '</h3>' +
                    '<ul>';
                for(var j = 0;j<data[0].articleInfoList.length;j++){
                    liFirst += '<li>' +
                        '<a href="<%=basePath %>/pageColumn/external/h_text?id='+(data[0].articleInfoList)[j].id+'"><span class="right">'+(data[0].articleInfoList)[j].issuingTimeStr +'</span>'+ '<p>' + (data[0].articleInfoList)[j].articleName  + '</p>'
                        '</li>' ;
                }
                for (var i =1; i<data.length;i++) {
                    li = "";
                    for(var j = 0;j<data[i].articleInfoList.length;j++){
                        li += '<li>' +
                            '<a href="<%=basePath %>/pageColumn/external/h_text?id='+(data[i].articleInfoList)[j].id+'"><span>'+(data[i].articleInfoList)[j].issuingTimeStr +'</span>' + '<p>' + (data[i].articleInfoList)[j].articleName  + '</p>'
                            '</li>' ;
                    }
                    len += '<div class="news news-zwgk">' +
                        '<div class="news-title">' +
                        '<a href="<%=basePath %>/pageColumn/external/h_active?id='+data[i].id+'" class="more">' +
                        '更多&gt;&gt;</a>' +
                        '<h3>' + data[i].columnName +
                        '</h3>' +
                        '<ul id="'+i+'">' +
						li +
                        '</ul>' +
                        '</div>'+
                        '</div>';
                }
                $("#news").append(news + liFirst +"</ul></div></div>");
                $("#content").append(len);
            }
        });

        //图片展示
        $.ajax({
            type:"post",
            url:"<%=basePath %>imageInfo/selectFile",
            async:true,
            data:{
                imgType:"1"
            },
			dataType:'json',
            success:function (data) {
                var len = "";
                for (var i = 0;i<data.length;i++) {
                    var urlImg = null;
                    if(data[i].articleId==null){
                        urlImg = '#';
					}else{
                        urlImg='<%=basePath %>pageColumn/external/h_text?id='+data[i].articleId;
					}
                 /*   len += '<a href="' + urlImg + '" title=""  style="display:none">'+i+'</a>';*/
                    len += '<a href="' + urlImg + '" title=""  style="display:none">'
                        + '<img src="<%=basePath %>'+ data[i].imgUrl +'" alt="" width="404" height="260"/></a>';
					if(i==5){
						break;
					}
                }
                $(".changeDiv").append(len);
               /* new slide("#main-slide", "cur", 404, 260, 1); //焦点图*/
               new slide("#main-slide","cur",404,260,true);
            }
        })

        //二维码信息
        $.ajax({
            type:"post",
            url:"<%=basePath %>imageInfo/selectFile",
            async:true,
            data:{
                imgType:"2"
            },
            success:function(data){
                var list ="";
                var columnName = "";
                var data = $.parseJSON(data);
                for (var i = 0;i<data.length;i++){
                    var extranetUrl = data[i].extranetUrl;
					if(extranetUrl==null){
                        extranetUrl = "#";
					}
                    list += '<a class="weix" style=" position:relative" href="'
						+ extranetUrl + '" >'
						+ '<img src="<%=basePath %>' + data[i].imgUrl + '" />'
						+ '</a>';

					break;
                }
                $("#footEnd").html(list);
            }
        });
		//查询功能
		$(".find").click(function () {
			var articleName  = $(".txt_search").val();
			window.location.href = "<%=basePath %>/pageColumn/external/h_search?articleName=" +articleName;
        })
	})
	function closeHouse() {
		$("#right").hide();
    }
</script>
