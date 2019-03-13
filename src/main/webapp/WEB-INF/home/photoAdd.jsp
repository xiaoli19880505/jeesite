<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9">
		<title>图片上传</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>themes/gray/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/icon/iconfont.css">
		<link rel="stylesheet" href="<%=basePath %>src/css/webuploader.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/common.css">
		<script type="text/javascript" src="<%=basePath %>src/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/home/common.js"></script>
		<script type="text/javascript" src="<%=basePath %>src/js/webuploader.js"></script>
		<link href="<%=basePath %>src/img/public/favicon.ico" rel="shortcut icon" type="image/x-icon">
	</head>

	<body class="easyui-layout">
		<div data-options="region:'center',border:false">
			<div class="easyui-panel windowPanel">
				<div class="abtn-group btnInner">
					<a class="icon iconfont icon-icon- green" onclick="saveAdd()"><i>开始上传</i></a>
					<a class="icon iconfont icon-chuangkouhua" onclick="bank.openWindow()"><i>新窗口打开</i></a>
					<a class="icon iconfont icon-guanbi red" onclick="bank.hideWindow()"><i>关闭</i></a>
				</div>
				<form method="post" id="form" class="easyui-form">
					<ul class="search-group windowInner">
						<legend>基本信息</legend>
						<li>
							<select class="easyui-combobox" name="imgType" id="imgType" style="width: 92%" data-options="label:'图片类型:',required:true,editable:false,panleHeight:'auto',
                               valueField:'id',textField:'text',onSelect:select">
								<option value="1">首页图片切换</option>
								<option value="2">二维码</option>
						    </select>
						</li>
						<li class="readonly extranetUrl">
							<input class="easyui-textbox" name="extranetUrl" id="extranetUrl" style="width: 92%" data-options="label:'外网url:'">
						</li>
						<li style="width: 100% !important;margin-top: 10px">
							<!--dom结构部分-->
							<div id="uploader-demo">
								<!--用来存放item-->
								<div id="fileList" class="uploader-list"></div>
								<div id="filePicker">选择图片</div>
							</div>
						</li>
					</ul>
				</form>
			</div>

		</div>
		<style>
			.thumbnail {
				display: inline-block;
				margin-right: 20px;
			}
		</style>
		<script>
			function saveAdd() {
				uploader.upload();
			}
			var fileArray=[];
			// 初始化Web Uploader
			var BASE_URL = "",
				thumbnailWidth = 80,
				thumbnailHeight = 80;
			$list = $("#fileList");
			var uploader = WebUploader.create({
				// 选完文件后，是否自动上传。
				auto: false,
				// swf文件路径
				swf: BASE_URL + '/js/Uploader.swf',

				// 文件接收服务端。
				server: '<%=basePath %>imageInfo/fileUpload',

				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick:{
                    id:"#filePicker",
                    multiple:false
                },
				disableGlobalDnd: true, //禁用浏览器的拖拽功能，否则图片会被浏览器打开
				fileSizeLimit: 10 * 1024 * 1024, // 总共的最大限制10M
				fileSingleSizeLimit: 3 * 1024 * 1024, // 单文件的最大限制3M

				// 只允许选择图片文件。
				accept: {
					title: 'Images',
					extensions: 'gif,jpg,jpeg,bmp,png',
					mimeTypes: 'image/*'
				}
			});
			// 当有文件添加进来的时候
			uploader.on('fileQueued', function(file) {
                fileArray.push(file);
			     if(fileArray.length>1){
                    uploader.removeFile(fileArray[0],true);
                     fileArray[0]=fileArray[1];
                     fileArray.length=1;
				 }
				var $li = $(
						'<div id="' + file.id + '" class="file-item thumbnail">' +
						'<img>' +
						'<div class="info">' + file.name + '</div>' +
						'</div>'
					),
					$img = $li.find('img');

				// $list为容器jQuery实例
				$list.html($li);

				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader.makeThumb(file, function(error, src) {
					if(error) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}

					$img.attr('src', src);
				}, thumbnailWidth, thumbnailHeight);
			});
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on('uploadBeforeSend', function (obj, data, headers){
                data.imgType=$.trim($("#imgType").combobox('getValue'));
                data.extranetUrl=$.trim($("#extranetUrl").textbox('getValue'));
            });
			uploader.on('uploadSuccess', function(file) {
				bank.ajaxMessage("上传成功！");
				$("#fileList").children("div").remove();
                    setTimeout(function () {
                        parent.$('.bankWindow').dialog('close');
                    },1000);
                parent.$('#dataTable').datagrid('reload');
			});

			// 文件上传失败，显示上传出错。
			uploader.on('uploadError', function(file) {
				bank.ajaxMessage("上传失败！")
			});
			function select(record){
			    if(record.id=="1"){
                    $("#extranetUrl").textbox('setValue','');
			        $("#extranetUrl").textbox('textbox').attr('readonly',true);
                   $(".extranetUrl").addClass('readonly');
                }else{
                    $("#extranetUrl").textbox('textbox').attr('readonly',false);
                    $(".extranetUrl").removeClass('readonly');
                }
			}

		</script>
	</body>

</html>