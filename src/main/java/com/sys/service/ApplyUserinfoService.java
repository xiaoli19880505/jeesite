package com.sys.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.sys.common.CommonUtils;
import com.sys.common.encrypt.AESUtil;
import com.sys.mapper.ApplyUserinfoMapper;
import com.sys.mapper.ParmItemMapper;
import com.sys.mapper.apply.ApplyFamilyMemberMapper;
import com.sys.pojo.ApplyUserinfo;
import com.sys.pojo.RoleInfo;
import com.sys.pojo.apply.ApplyFamilyMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hwx
 * @CopyRight (C) 江苏乳虎
 * @date 2018/10/15 0015
 * @desc
 */
@Service
public class ApplyUserinfoService extends BaseService<ApplyUserinfo> {
    @Autowired
    ApplyUserinfoMapper applyUserinfoMapper;
    @Autowired
    ParmItemMapper parmItemMapper;
    @Autowired
    private ApplyFamilyMemberMapper applyFamilyMemberMapper;



    public PageInfo<ApplyUserinfo> selectAll(Map map){
        PageHelper.startPage(Integer.parseInt((String) map.get("page")),
                Integer.parseInt((String) map.get("rows")));
        List<ApplyUserinfo> list = applyUserinfoMapper.selectAll(map);
        return new PageInfo<ApplyUserinfo>(list);
    }


     public ApplyUserinfo selectById(String userid) {
        ApplyUserinfo applyUserinfo=applyUserinfoMapper.selectById(userid);
        return applyUserinfo;
    }

     public  int insert(ApplyUserinfo applyUserinfo) {
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("usercode", applyUserinfo.getUsercode());
         map.put("sfzh", applyUserinfo.getSfzh());
         int flag=5;
         ApplyUserinfo applyUserinfo1 = this.applyUserinfoMapper.selectUserInfo(map);
         if (applyUserinfo1 == null) {
             applyUserinfo.setUserid(CommonUtils.getUUIDWith_());
             applyUserinfo.setState("0");
             Integer add = this.applyUserinfoMapper.insert(applyUserinfo);
             if (add > 0) {
                 flag = 1;
                 /*更新家庭成员表中对应此注册用户的手机号码，主要针对的是老用户*/
                 ApplyFamilyMember applyFamilyMember = new ApplyFamilyMember();
                 applyFamilyMember.setAfmSfzh(applyUserinfo.getSfzh());
                 applyFamilyMember.setAfmLxdh(applyUserinfo.getLinktel());
                 List<ApplyFamilyMember> memberList = Lists.newArrayList();
                 memberList.add(applyFamilyMember);
                 applyFamilyMemberMapper.updateMemberBatch(memberList);
                 return flag;
             } else {
                 flag = 0;
                 return flag;
             }
         } else if (applyUserinfo1.getUsercode().equals(applyUserinfo.getUsercode())) {
             flag = 2;
             return flag;
         } else if (applyUserinfo1.getSfzh().equals(applyUserinfo.getSfzh())) {
             flag = 3;
             return flag;
         }
         return flag;
     }
    public List<ApplyUserinfo> selectAllApp(Map map){
        return  this.applyUserinfoMapper.selectAll(map);
    }


     public ApplyUserinfo selectUserInfo(Map map){
         return applyUserinfoMapper.selectUserInfo(map);
     }



    public int updatePwd(Map map){
        return applyUserinfoMapper.updatePwd(map);
    }

    /**
     * 更新申请用户信息
     * @param applyUserinfo
     * @return
     */
    public int  updateUser(ApplyUserinfo applyUserinfo){

        int count = this.applyUserinfoMapper.update(applyUserinfo);

        /*更新家庭成员表中对应此注册用户的手机号码，主要针对的是老用户*/
        ApplyFamilyMember applyFamilyMember = new ApplyFamilyMember();
        applyFamilyMember.setAfmSfzh(applyUserinfo.getSfzh());
        applyFamilyMember.setAfmLxdh(applyUserinfo.getLinktel());
        List<ApplyFamilyMember> memberList = Lists.newArrayList();
        memberList.add(applyFamilyMember);
        applyFamilyMemberMapper.updateMemberBatch(memberList);

        return  count;
    }

    /**
     * 查询未激活的用户列表
     * @param map
     * @return
     */
    public PageInfo<ApplyUserinfo> selectNoActiv(Map map){
        PageHelper.startPage(Integer.parseInt((String) map.get("page")),
                Integer.parseInt((String) map.get("rows")));
        List<ApplyUserinfo> list = applyUserinfoMapper.selectNoActiv(map);
        return new PageInfo<ApplyUserinfo>(list);
    }
    /**
     * 根据用户id更新用户状态
     * @param map
     * @return
     */
    public int updateUserState(Map map){
        return applyUserinfoMapper.updateUserState(map);
    }


}
