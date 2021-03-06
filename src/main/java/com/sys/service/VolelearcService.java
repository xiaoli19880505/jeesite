package com.sys.service;

import com.google.common.collect.Maps;
import com.sys.common.BatchUtil;
import com.sys.common.CommonUtils;
import com.sys.common.ImageTools;
import com.sys.common.PropertiesUtil;
import com.sys.mapper.VolelearcDtlMapper;
import com.sys.mapper.VolelearcMapper;
import com.sys.mapper.apply.ApproveMapper;
import com.sys.pojo.Volelearc;
import com.sys.pojo.VolelearcDtl;
import com.sys.pojo.apply.Approve;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Desc:desc
 * @Author:wangli
 * @CreateTime:17:05 2018/10/19
 */
@Service
public class VolelearcService {

    @Resource
    private ApproveMapper approveMapper;

    @Resource
    private BatchUtil batchUtil;

    @Resource
    private VolelearcMapper volelearcMapper;

    @Resource
    private VolelearcDtlMapper volelearcDtlMapper;

    public String addVolelearcMultipart(HttpServletRequest request){
        /*如果properties文件中配置了图片上传路径，则配置的路径；否则使用系统上下文路径*/
        String filePath = PropertiesUtil.getImgProperties("imgUrl");
        if(filePath==null || "".equals(filePath)){
            filePath=request.getSession().getServletContext().getRealPath("/") + "ArchivePic/";
        }

        String[] names = request.getParameterValues("volname");//获得所有档案附件名列表
        String applyid = request.getParameter("applyid");//获得申请表id
       /*获得申请编号*/
        Map<String,Object> map = Maps.newHashMap();
        map.put("applyid",applyid);
        Approve approve = this.approveMapper.findByMap(map);
        String sqbh = approve.getAplbh();
        /*创建上传文件的路径，context/申请编号前8位/申请编号*/
        filePath=filePath+sqbh.substring(0,8)+"/"+sqbh+"/";
        /*如果目录不存在，则创建目录*/
        File dir = new File(filePath);
        if(!dir.exists()){
            dir.mkdirs();
        }
       // System.out.println("-----------upload");
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());

        List<Volelearc> volList = new ArrayList<Volelearc>();//定义了档案表list
        List<VolelearcDtl> volDtlList = new ArrayList<VolelearcDtl>();//定义了档案附件图片list
        /*对档案文件名进行遍历*/
        //将request变成多部分request
        MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
        int pos = 1;
        /*对档案附件名进行遍历*/
        for(String tempName:names){
            Volelearc volelearc = new Volelearc();
            String volelearcid = CommonUtils.getUUIDWith_();//生成uuid
            volelearc.setElearcvolId(volelearcid);//设置uuid
            volelearc.setElearcname(tempName);//设置档案附件名
            volelearc.setArchiveid(applyid);//设置申请表id
            volelearc.setIsshow("1");//设置是否可显示
            List<MultipartFile> fileList = multiRequest.getFiles("volname"+pos);//获取档案图片列表

            volelearc.setPagenumber(Short.parseShort(""+fileList.size()));//设置档案的图片数目
            volList.add(volelearc);
            /*对档案下的所有图片进行遍历*/
           // System.out.println("-------------size:"+fileList.size());
            for (MultipartFile tempFile:fileList){
                String path="";
                short width = 0;
                short height = 0;
                if(tempFile!=null)
                {
                    /*保证项目命名唯一：路径+-uuid+文件原名*/
                    StringBuffer buffer = new StringBuffer(filePath);
                    path= buffer.append("").append(CommonUtils.getUUIDWith_()).
                            append("-").append(tempFile.getOriginalFilename()).toString();
                    File newFile = new File(path);
                    if(!newFile.exists()) {
                        /*创建文件*/
                        try {
                            newFile.createNewFile();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    //上传
                    try {
                        tempFile.transferTo(newFile);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    width= (short) ImageTools.getImgWidth(newFile);
                    height=(short)ImageTools.getImgHeight(newFile);
                }
                path=path.substring(path.indexOf("ArchivePic"));//保存相对路径
                VolelearcDtl volelearcDtl = new VolelearcDtl();
                volelearcDtl.setVolelearcId(volelearcid);
                volelearcDtl.setVolelearcdtlId(CommonUtils.getUUIDWith_());
                volelearcDtl.setImgname(path);
                volelearcDtl.setWidth(width);//设置图片路径
                volelearcDtl.setHeight(height);//设置图片高
                volDtlList.add(volelearcDtl);
            }
            pos++;
        }
        batchUtil.save(volList,"VolelearcMapper");//批量插入档案附件数据
        batchUtil.save(volDtlList,"VolelearcDtlMapper");//批量插入档案附件图片数据
        long  endTime=System.currentTimeMillis();
        System.out.println("上传的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "上传成功";
    }

    public String  addUploadByOne(HttpServletRequest request){
        /*如果properties文件中配置了图片上传路径，则配置的路径；否则使用系统上下文路径*/
        String filePath = PropertiesUtil.getImgProperties("imgUrl");
        if(filePath==null || "".equals(filePath)){
            filePath=request.getSession().getServletContext().getRealPath("/") + "upload";
        }
        int updateCount = 0 ; //更新个数
        System.out.println("-----------addUploadByOne");
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        String volname = request.getParameter("volname");//获得所有档案附件名列表
        String applyid = request.getParameter("applyid");//获得申请表id
        //将request变成多部分request
        MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
        MultipartFile multipartFile=multiRequest.getFile("volname1");
        Map<String,Object> conditionMap = Maps.newHashMap();
        conditionMap.put("applyid",applyid);
        conditionMap.put("volname",volname);
        List<Volelearc> volList = volelearcMapper.getByMap(conditionMap);
        System.out.println("--volname:"+volname+"---applyid:"+applyid);
        String volelearcid="";
        /*如果附件已经存在库中，则更新其对应的详情数目；否则新增附件*/
        if(volList==null || volList.size()==0){

            Volelearc volelearc = new Volelearc();
            volelearcid= CommonUtils.getUUIDWith_();//生成uuid
            System.out.println("进入这里--"+volelearcid);
            volelearc.setElearcvolId(volelearcid);//设置uuid
            volelearc.setElearcname(volname);//设置档案附件名
            volelearc.setArchiveid(applyid);//设置申请表id
            volelearc.setIsshow("1");//设置是否可显示
            volelearc.setPagenumber(Short.parseShort("1"));//设置图片数目
            updateCount=volelearcMapper.insert(volelearc);

        }else {

            Volelearc volelearc = volList.get(0);
            volelearcid=volelearc.getElearcvolId();
            Short pagenumber = volelearc.getPagenumber();
            pagenumber++;
            System.out.println("进入那里--"+volelearcid+"--"+pagenumber);
            volelearc.setPagenumber(pagenumber);
            updateCount=volelearcMapper.update(volelearc);
        }

        String path="";//图片路径
        short width = 0 ;//图片宽
        short height = 0;//图片高
        if(multipartFile!=null)
        {
            /*保证项目命名唯一：路径+-uuid+文件原名*/
            StringBuffer buffer = new StringBuffer(filePath).append(System.getProperty("file.separator"));
            path= buffer.append(CommonUtils.getUUIDWith_()).
                    append("-").append(multipartFile.getOriginalFilename()).toString();
            System.out.println("tupian----url--"+path);
            File newFile = new File(path);
            if(!newFile.exists())
                newFile.mkdirs();
            //上传
            try {
                multipartFile.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
            width= (short) ImageTools.getImgWidth(newFile);
            height=(short)ImageTools.getImgHeight(newFile);
        }
        VolelearcDtl volelearcDtl = new VolelearcDtl();
        volelearcDtl.setVolelearcId(volelearcid);//设置附件id
        volelearcDtl.setVolelearcdtlId(CommonUtils.getUUIDWith_());//设置主键
        path=path.substring(path.indexOf("upload"));//保存相对路径
        volelearcDtl.setImgname(path);//设置图片路径
        volelearcDtl.setWidth(width);//设置图片宽
        volelearcDtl.setHeight(height);//设置图片高
        this.volelearcDtlMapper.insert(volelearcDtl);//插入图片
        System.out.println("end--");
        long  endTime=System.currentTimeMillis();
        System.out.println("上传的运行时间："+String.valueOf(endTime-startTime)+"ms");
        if(updateCount>0)
         return "success";
        else
            return "false";
    }



    public void addUploadByOne(HttpServletRequest request,HttpServletResponse response){
        int counter=0;
        System.out.println("收到图片!");
        MultipartHttpServletRequest Murequest = (MultipartHttpServletRequest)request;
        Map<String, MultipartFile> files = Murequest.getFileMap();//得到文件map对象
        String upaloadUrl = request.getSession().getServletContext().getRealPath("/")+"upload";//得到当前工程路径拼接上文件名
        File dir = new File(upaloadUrl);
        System.out.println(upaloadUrl);
        if(!dir.exists())//目录不存在则创建
            dir.mkdirs();
        for(MultipartFile file :files.values()){
            counter++;
            String fileName=file.getOriginalFilename();
            File tagetFile = new File(upaloadUrl+fileName);//创建文件对象
            if(!tagetFile.exists()){//文件名不存在 则新建文件，并将文件复制到新建文件中
                try {
                    tagetFile.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    file.transferTo(tagetFile);
                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
        }
        System.out.println("接收完毕");
    }
}