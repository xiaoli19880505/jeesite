
(function($,app){
	/**
	 * 设置项目路径
	 **/
	app.basePath="http://localhost:8080/bzfxm/";
	/**
	 * alert提示框
	 **/
	app.alert=function(msg){
		 mui.alert(msg);
		 return false;
	};
	/**
	 * 输入提示框
	 **/
	app.confirm=function(msg){
		mui.confirm(msg, '提示',['是','否'], function(e) {
			e.index == 0 ? mui.toast('感谢您的支持!') : mui.toast('没有得到你的认可,继续加油!')
		})
	};
	
	/**
	 * promot提示框
	 **/
	app.prompt=function(msg){
		e.detail.gesture.preventDefault(); //修复iOS 8.x平台存在的bug
		mui.prompt(msg, '满意', '提示',['确定','取消'], function(e) {
			e.index == 1 && e.value != '' && mui.toast('谢谢您的评价: ' + e.value)			
		})
     
	};
	/**
	 * toast提示框
	 **/
	app.toast=function(msg){
		mui.toast(msg);
	};
	/**
	 * 获取应用本地配置
	 **/
	app.settings=function() {
		return {
            set: function (obj) {
                localStorage.setItem(obj.title, JSON.stringify(obj));
            },
            get: function (key) {
                var params=JSON.parse(localStorage.getItem(key));
                return params;
            },
            remove: function(key) {
                localStorage.removeItem(key)
            },
            clear: function() {
                localStorage.clear();
            }
        }
    };
	/**
	 * 打开窗口
	 **/
	app.openWindow=function(id,url){
		 mui.openWindow({
						id:id,
						url:url
				});
	};
	/**
	 * 关闭窗口
	 **/
	app.closeWindow=function(){
		var ws = plus.webview.currentWebview();
         plus.webview.close(ws);
	};
    /**
     * ajax表单提交
     **/
	app.ajaxForm=function(form,url,params,success){
        $(form).form('submit', {
            url:url,
            onSubmit: function(param){
                if(params){
                    for(var key in params){
                        param[key]=params[key]
                    }
                }
                var isValid = $(this).form('validate');
                if (!isValid){
                }
                return isValid;
            },
            success:success,
            error:function(){
                weixin.alert("数据库连接失败，请稍后再试！");
                return false;
            }
        },'json');
    };

    /**
     * ajax提交
     **/
    app.ajax=function(url,datas,success){
        mui.ajax(url,{
            data:datas,
            dataType:'json',//服务器返回json格式数据
            type:'post',//HTTP请求类型
            timeout:10000,//超时时间设置为10秒；
            headers:{'Content-Type':'application/json'},
            success:success,
            error:function(xhr,type,errorThrown){
                weixin.alert("数据库连接失败，请稍后再试！");
                return false;
            }
        });
    };

    /**
     * 获取生日
     **/
    app.setBirthday=function(idCard) {
        var birthday = "";
        if(idCard != null && idCard != ""){
            if(idCard.length == 15){
                birthday = "19"+idCard.substr(6,6);
            } else if(idCard.length == 18){
                birthday = idCard.substr(6,8);
            }
            birthday = birthday.replace(/(.{4})(.{2})/,"$1-$2-");
        }
        return birthday;
    };

    /**
     * 获取数组标号
     **/
    app.getArrayIndex=function(array,item){
        var i = array.length;
        while (i--) {
            if (array[i] === item) {
                return i;
            }
        }
        return false;
    };
    /**
     * 数组去重
     **/
    app.arraySplice=function(array){
        array.sort();
        var temp = []; //一个新的临时数组
        for(var i = 0; i < array.length; i++){
            if(temp.indexOf(array[i]) == -1){
                temp.push(array[i]);
            }
        }
        return temp;
    };
	/**
	 * 数据格式验证
	 **/
	app.validType=function(){
            //验证正则
           var reg={
                idCard: /^\d{17}[\d|X|x]$|^\d{15}$/,
                email: /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/,
                chinese: /^[\u4e00-\u9fa5]+$/i,
                xyCode: /^[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}$/,
                special: /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
                phone: /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/,
                numberZ: /^\+?[1-9][0-9]*$/,
                money: /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/
            };
            return {
	            	//验证手机
	            isPhone: function(txt) {
	                return reg.phone.test(txt);
	            },
	            //身份证验证
	            isIdCard: function(txt) {
	                return reg.idCard.test(txt);
	            },
	            //验证邮箱
	            isEmail: function(txt) {
	                return reg.email.test(txt);
	            },
	            //验证中文
	            isChinese: function(txt) {
	                return reg.chinese.test(txt);
	            },
	            //统一社会信用代码
	            isXyCode: function(txt) {
	                return reg.xyCode.test(txt);
	            },
	            //特殊字符
	            isSpecial: function(txt) {
	                return reg.special.test(txt);
	            },
	            //正整数
	             isNumberZ: function(txt) {
	                return reg.numberZ.test(txt);
	            },
	            //金额
	            isMoney: function(txt) {
	                return reg.money.test(txt);
	            }
            }
            
        }
}($,window.weixin = {}));
//textbox,验证格式
$.extend($.fn.textbox.defaults.rules, {
    empty:{
        validator : function(value, param) {
            return $.trim(value).length!=0;
        },
        message : "该项不能为空"
    },
    number : {
        validator : function(value, param) {
            var reg = /^\+?[1-9][0-9]*$/;
            return reg.test($.trim(value));
        },
        message : "该项只能输入正整数"
    },
    allNumber:{
        validator:function (value,param) {
            var reg= /^.*[^\d].*$/;
            return reg.test($.trim(value));
        },
        message : "不能全为数字"
    },
    canNumber:{
        validator:function (value,param) {
            var reg= /^(0|[1-9][0-9]*)$/  ;
            var reg1= /^(0[1-9][0-9]*)$/;
            return reg.test($.trim(value))||reg1.test($.trim(value));
        },
        message : "只能输入数字"
    },
    money:{
        validator:function(value,param){
            var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;//金额验证
            return  reg.test($.trim(value));
        },
        message :"金额必须大于0，且最多含有2位小数!"
    },
    email:{
        validator:function (value,param){
            var reg=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
            return  reg.test($.trim(value));
        },
        message :"邮箱格式错误！"
    },
    phone:{
        validator:function (value,param) {
            var reg=/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
            return  reg.test($.trim(value))
        },
        message :"手机号格式错误！"
    },
    tel:{
        validator:function (value,param) {
            var reg= /^(0[0-9]{2,3}\-)([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/;//固话验证
            return  reg.test($.trim(value));
        },
        message:"固话格式格式错误！"
    },
    specialCharacter: {
        validator: function(value, param){
            var reg = /^[\u4E00-\u9FA5A-Za-z0-9]+$/;
            return reg.test($.trim(value));
        },
        message: '该项不能含有特殊字符'
    },
    checkLength: {
        validator: function (value, param) {
            if (($.trim(value)).length < param[0] || ($.trim(value)).length > param[1]) {
                $.fn.textbox.defaults.rules.checkLength.message = '该字段长度必须在' + param[0] + '至' + param[1] + '范围';
                return false;
            }else{
                return true;
            }
        },
        message: ''
    },
    sfz : {
        validator : function(value, param) {
            var reg = /(^\d{15}$)|(^\d{17}(\d|X|x)$)/;
            return reg.test($.trim(value));
        },
        message : "身份证格式不正确"
    },
    limitHJ:{
        validator: function (value, param) {
            if (($.trim(value))<=param[0]) {
                $.fn.textbox.defaults.rules.limitHJ.message = '该字段值不能小于' + param[0]+'';
                return false;
            }else{
                return true;
            }
        },
        message: ''
    },
    sfzh:{
        validator: function (value, param) {
            if (($.trim(value)).length!=param[0]&&($.trim(value)).length!=param[1]) {
                $.fn.textbox.defaults.rules.sfzh.message = '该字段长度只能为' + param[0] + '或' + param[1] + '';
                return false;
            }else{
                return true;
            }
        },
        message: ''
    },
    xyCode:{
        validator: function(value, param){
            var reg = /^[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}$/;
            return reg.test($.trim(value));
        },
        message: '信用代码格式错误'
    },
    equalTo: {
        validator:function(value,param){
            return $.trim($(param[0]).val()) == $.trim(value);
        },
        message:'两次密码不一致!'
    },
    chinese : {
        validator : function(value, param) {
            var reg = /^[\u4e00-\u9fa5]+$/i;
            return reg.test($.trim(value));
        },
        message : "请输入中文"
    },
    englishLowerCase  : {// 验证英语小写
        validator : function(value) {
            var reg=/^[a-z]+$/;
            return reg.test($.trim(value));
        },
        message : '请输入小写字母'
    },
    isDateBox:{
        validator:function () {
            var reg=/^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
            return reg.test($.trim(value));
        },
        message:"日期格式错误"
    },
    overDate:{
        validator:function (value,param) {
            if($.trim(value)<bank.getNowDate()){
                $.fn.textbox.defaults.rules.overDate.message = '选择的时间不能小于当前时间';
                return false;
            }else{
                return true
            }
        },
        message:''
    },
    minDate:{
        validator:function (value,param) {
            if($.trim(value)>=bank.getNowDate()){
                $.fn.textbox.defaults.rules.minDate.message = '选择的时间不能大于当前时间';
                return false;
            }else{
                return true
            }
        },
        message:''
    },
    ZIP: {
        validator: function (value, param) {
            return /^[1-9][0-9]{5}$/.test(value);
        },
        message: '邮政编码不存在'
    },
    QQ: {
        validator: function (value, param) {
            return /^[1-9]\d{4,10}$/.test(value);
        },
        message: 'QQ号码不正确'
    },
    plateNumber:{
        validator : function(value) {
            /*    var reg=/^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;*/
            return /^[\u4E00-\u9FA5a-zA-Z][A-Z0-9]{6}$/.test(value);
        },
        message:'车牌号格式错误'
    }
});