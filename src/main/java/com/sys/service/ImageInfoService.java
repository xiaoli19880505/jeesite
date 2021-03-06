package com.sys.service;

import com.sys.common.FileUtils;
import com.sys.mapper.ImageInfoMapper;
import com.sys.pojo.ImageInfo;
import com.sys.pojo.UserInfo;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Service
public class ImageInfoService extends BaseService<ImageInfo> {

    private Logger logger = Logger.getLogger(this.getClass());

    @Resource
    ImageInfoMapper imageInfoMapper;


    /**
     * 新增
     * @param file 文件
     * @param filePath 保存文件路径
     * @param imageCode 文件编码
     * @param request
     * @return
     */
    public Object saveImage(MultipartFile file, String filePath, String imageCode, HttpServletRequest request){
        HttpSession session = request.getSession();
        UserInfo userinfo = (UserInfo)session.getAttribute("user");//获取用户信息
        String path = FileUtils.getRealPath();
        // 判断文件是否为空
        JSONObject jsonObj = new JSONObject();
        if (!file.isEmpty()) {
            boolean flag = FileUtils.checkFileSize(file,5,"M");
            if(!flag){
                logger.error("图片上传异常");
                jsonObj.put("flag",false);
                jsonObj.put("msg","图片超出" + 5 + "M");
                return jsonObj;
            }
                FileUtils.saveFile(file,path + filePath);
            if(!flag){
                logger.error("图片上传异常");
                jsonObj.put("flag",false);
                jsonObj.put("msg","图片上传异常");
                return jsonObj;
            }
            //保存文件至系统
            Date date = new Date();
            ImageInfo imageInfo = new ImageInfo();
            //暂时写死
            imageInfo.setCreatePerson(userinfo.getUsercode());
            imageInfo.setUpdatePerson(userinfo.getUsercode());
            String uuid = UUID.randomUUID().toString().replace("-", "").toLowerCase();
            imageInfo.setId(uuid);
            imageInfo.setCreateTime(date);
            imageInfo.setUpdateTime(date);
            imageInfo.setImgCode(imageCode);
            imageInfo.setDeleteFlag("F");
            imageInfo.setImgName(file.getOriginalFilename());
            imageInfo.setImgUrl(filePath + File.separator + file.getOriginalFilename());
            //后期增加图片分为 文章类型图片/二维码图片
            imageInfo.setImgType(request.getParameter("imgType"));//图片类型（1.首页图片切换2.二维码）
            imageInfo.setArticleId(request.getParameter("articleId"));//文章外键
            imageInfo.setExtranetUrl(request.getParameter("extranetUrl"));//外网URL(二维码类型专用)
            imageInfoMapper.insert(imageInfo);
        }
        jsonObj.put("flag",true);
        return jsonObj;
    }

    /**
     * 删除
     * @param imgId id
     * @return
     */
    @Transactional
    public Object deleteByFileId(String imgId,HttpServletRequest request){
        HttpSession session = request.getSession();
        UserInfo userinfo = (UserInfo)session.getAttribute("user");//获取用户信息
        if(StringUtils.isEmpty(imgId)){
            return "图片信息不完整，无法删除!";
        }
        ImageInfo imageInfo = imageInfoMapper.selectByPrimaryKey(imgId);
        String filePath = FileUtils.getRealPath()
                + imageInfo.getImgUrl().replace(File.separator + imageInfo.getImgName(),"");
        File file = new File(filePath);
        if (!file.exists()) {
            return "删除文件失败:" + imageInfo.getImgName() + "不存在！";
        } else {
            if (file.isFile()) {
                Map<String,Object> mapOut = FileUtils.deleteFile(filePath);
                if(!(Boolean) mapOut.get("flag")){
                    return mapOut.get("msg");
                }
            }else{
                Map<String,Object> mapOut = FileUtils.deleteDirectory(filePath);
                if(!(Boolean) mapOut.get("flag")){
                    return mapOut.get("msg");
                }
            }
        }
        if(imageInfo==null){
            return "图片信息丢失，无法删除!";
        }
        imageInfo.setDeleteFlag("T");
        imageInfo.setUpdatePerson(userinfo.getUsercode());
        imageInfo.setUpdateTime(new Date());
        int  num =  imageInfoMapper.update(imageInfo);
        if(num>0){
            return "删除成功!";
        }else{
            return "删除失败!";
        }
    }

    /**
     * 查询
     * @param imageInfo 图片信息
     * @return
     */
    @Transactional
    public Object selectByConditions(ImageInfo imageInfo){
        return imageInfoMapper.selectByCondition(imageInfo);
    }


}
