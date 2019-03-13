<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <title>文章添加</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/icon/iconfont.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>src/css/common.css">
    <link rel="stylesheet" href="<%=basePath %>src/css/webuploader.css" />
    <link rel="stylesheet" href="<%=basePath %>src/registMa/themes/default/css/umeditor.css" />
    <script type="text/javascript" src="<%=basePath %>src/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/home/common.js"></script>
    <script type="text/javascript" src="<%=basePath %>src/js/webuploader.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath %>src/registMa/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath %>src/registMa/umeditor.min.js"></script>
    <style>
        .webuploader-pick {
            background: #FFFF !important;
            padding: 0 !important;
            overflow: visible !important;
         }
        #thelist {
            height: 30px;
        }
        #picker:hover{
            background: #FFFFFF !important;
        }
    </style>

</head>

<body class="easyui-layout">
<div data-options="region:'center',border:false">
    <div class="easyui-panel resPanel" style="width: 100%;height: 98%;overflow: auto">
        <div class="abtn-group btnInner">
            <a class="icon iconfont icon-xinzeng green" id="picker"><i>附件上传</i></a>
            <a class="icon iconfont icon-icon- green" onclick="saveAdd()"><i>保存</i></a>
            <a class="icon iconfont icon-chuangkouhua" onclick="bank.openWindow()"><i>新窗口打开</i></a>
            <a class="icon iconfont icon-guanbi red" onclick="bank.hideWindow()"><i>关闭</i></a>
        </div>
        <form id="queryForm" method="post">
            <ul class="search-group">
                <li><input class="easyui-textbox" name="articleName" id="articleName" style="width: 92%" data-options="label:'文章标题:',required:true"></li>
                <li><input class="easyui-textbox" name="author" id="author" style="width: 92%" data-options="label:'作者:',required:true"></li>
                <li>
                    <select class="easyui-combogrid" name="columnId" id="columnId" style="width: 92%" data-options="url:'<%=basePath%>columnInfo/selectColumnInfo',label:'栏目名称:',editable:false,
                         panelWidth:'175',panelHeight:'auto',idField: 'id',textField: 'columnName',columns:[[{field:'columnName',title:'栏目名称',width:170,align:'center'}]],required:true">
                    </select>
                </li>
            </ul>
        </form>
        <div>
            <div id="thelist" class="uploader-list"> 附件展示：</div>
        </div>
       <!--style给定宽度可以影响编辑器的最终宽度-->
      <div id="myEditor" style="width: 100%;min-height: 600px">
            <p></p>
        </div>
        </div>
        </div>
        </body>

        </html>
        <script type="text/javascript">
        var id;
        //实例化编辑器
        var um = UM.getEditor('myEditor');
        function saveAdd() {
            var articleBody  = UM.getEditor('myEditor').getContent();
            $('#queryForm').form('submit', {
                url:'<%=basePath %>articleInfo/insertArticleInfo',
                onSubmit: function(param){
                    param.articleBody = articleBody;
                    var isValid = $(this).form('validate');
                    if (!isValid){
                    }
                    return isValid;
                },
                success:function (data) {
                    bank.ajaxMessage('文章上传成功');
                    data = JSON.parse(data);
                    if(data.flag == true){
                        id = data.msg;
                        send(id);
                        setTimeout(function () {
                            parent.$('.bankWindow').dialog('close');
                        },1000);
                    }
                }
            });
        }
        var uploader = WebUploader.create({

            // swf文件路径
            swf:'/js/Uploader.swf',

            // 文件接收服务端。
            server: '<%=basePath %>articleInfo/fileUpload',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#picker',

            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        });
        // 当有文件被添加进队列的时候
        uploader.on( 'fileQueued', function( file ) {
            $list = $("#thelist");
            $list.append( '<div id="' + file.id + '" class="item" style="display: inline-block">' +
                '<h4 class="info" style="margin-right: 10px;display: inline-block">' + file.name + '</h4>' +
                '<div class="info" onclick="del($(this))" style="display: inline-block;color: #0092DC;cursor: pointer;">' + "删除" + '</div>' +
                '</div>' +
                '</div>' );
        });
        function send(id){
            //上传后才执行
            uploader.on('uploadBeforeSend', function (obj, data, headers){
                data.articleId = id
            });
            uploader.upload();
            //上传后才执行
            uploader.on( 'uploadError', function( file ) {
                bank.ajaxMessage('附件上传失败');
            });
            //上传后才执行
            uploader.on( 'uploadSuccess', function( file ) {
                bank.ajaxMessage('附件上传成功');
            });
        }
        function del(obj) {
            //移除
            obj.parents(".item").remove();
        }
        </script>