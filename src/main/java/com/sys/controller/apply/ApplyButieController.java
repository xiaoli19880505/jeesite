package com.sys.controller.apply;

import com.github.pagehelper.PageInfo;
import com.sys.common.PropertiesUtil;
import com.sys.pojo.ApplyUserinfo;
import com.sys.pojo.apply.Apply;
import com.sys.pojo.apply.ApplyButie;
import com.sys.pojo.apply.Approve;
import com.sys.service.apply.ApplyButieService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("applyButie")
public class ApplyButieController {

    @Autowired
    private ApplyButieService applyButieService;



    @RequestMapping("toLowPaulTrap")
    public String toLowPaulTrap(){
        return "applicationForm/lowPaulTrapProtection/lowPaulTrap";
    }

    /**
     * 查询住房补贴信息--保障房备案管理
     * @param request
     * @return
     */
    @RequestMapping("selectApplyButie")
    @ResponseBody
    public Object selectApplyButie(HttpServletRequest request){
        ApplyButie applyButie = new ApplyButie();
        ApplyUserinfo applyUserinfo = new ApplyUserinfo();
        String userName = (String)request.getParameter("username");
        if(StringUtils.isNotEmpty(userName)){
            applyUserinfo.setUsername(userName);
        }
        String sfzh = (String)request.getParameter("sfzh");//身份证
        if(StringUtils.isNotEmpty(sfzh)){
            applyUserinfo.setSfzh(sfzh);
        }
        String ssq = (String)request.getParameter("ssq");//所属区
        if(StringUtils.isNotEmpty(ssq)) {
            applyButie.setAbSsq(ssq);
        }
        String ssj = (String)request.getParameter("ssj");//所属街
        if(StringUtils.isNotEmpty(ssj)) {
            applyButie.setAbJdbsc(ssj);
        }
        //默认查询区字典
        String jiedao = PropertiesUtil.getAreaProperties("jiedao");//街道字典
        if(StringUtils.isNotEmpty(jiedao)) {
            applyUserinfo.setJiedao(jiedao);
        }
        String area = PropertiesUtil.getAreaProperties("area");//区域字典
        if(StringUtils.isNotEmpty(area)) {
            applyUserinfo.setXzq(area);
        }
        applyButie.setApplyUserinfo(applyUserinfo);
        //备案管理必备条件
        applyButie.setAbLc(new Short("4"));
        //非退房小于5
        applyButie.setAbZt(new Short("5"));

        String  page = StringUtils.isEmpty((String)request.getParameter("page"))?
                "1":(String)request.getParameter("page");//页数
        String rows = StringUtils.isEmpty((String)request.getParameter("rows"))?
                "20":(String)request.getParameter("rows");//行数
        PageInfo<Apply> applyForForeignPageInfoes =
                (PageInfo<Apply>)applyButieService
                        .selectByCondition(applyButie,page,rows);
        Map<String,Object> map=new HashMap();
        map.put("rows",applyForForeignPageInfoes.getList());
        map.put("total",applyForForeignPageInfoes.getTotal());
        return map;
    }

    /**
     * 添加申请信息
     * @return
     */
    @RequestMapping("addApplyInfo")
    @ResponseBody
    public Object addApplyInfo(ApplyButie applyButie, HttpServletRequest request){
        Map<String,Object> resultMap = new HashMap<String,Object>();
        String result="";//返回结果字符
        String applyid="";//返回的applyid
        String addResult = applyButieService.addApplyForForeign(applyButie,request);
        System.out.println("addResult-------:"+addResult);
        if("success".equals(addResult)){
            result="success";
            applyid=applyButie.getAbId();
        }
        resultMap.put("result",result);
        resultMap.put("applyid",applyid);
        return resultMap;
    }

    /**
     * 修改补贴申请信息
     * @param applyButie
     * @return
     */
    @RequestMapping("updateApplyButieInfo")
    @ResponseBody
    public Object updateApplyButieInfo(ApplyButie applyButie){

        //1、使用JSONObject
//        JSONObject json = JSONObject.fromObject(applyButie);
//        System.out.println("********"+json.toString());

        Map<String,Object> resultMap = new HashMap<String,Object>();
        String result="";//返回结果字符
        String updateResult=applyButieService.updateApplyButieInfo(applyButie);
        if("success".equals(updateResult)){
            result="success";
        }
        resultMap.put("result",result);
        resultMap.put("applyid",applyButie.getAbId());
        return resultMap;
    }

}
