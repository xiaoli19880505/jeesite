package com.sys.mapper.apply;

import com.sys.mapper.IMapper;
import com.sys.pojo.apply.Approve;
import java.util.List;
import java.util.Map;

public interface ApproveMapper extends IMapper<Approve> {
    /**
     * 根据申请用户id查询申请记录
     * @param
     * @return
     */
    List<Approve> findAppoveByApplyUser(Map map);

    /**
     * 根据申请单查询流程
     * @param aplid
     * @return
     */
    Approve findByApplyId(String aplid);

    /**
     * 条件查询审批单
     * @param map
     * @return
     */
    Approve findByMap(Map map);

    /**
     * 条件查询审批单列表
     * @param map
     * @return
     */
    List<Approve> findListByMap(Map map);

    /**
     * 根据身份证号查询审核全部通过的申请人信息
     * @param
     * @return
     */
    Approve findBySfzh(Map map);

    /**
     * 根据条件查询年审的数量
     * @param map
     * @return
     */
    int countNsByMap(Map map);

    /**
     * 根据条件查询审批单的数量（主要用于初审）
     * @param map
     * @return
     */
    int findCountByMap(Map map);

    /**
     * 根据申请房源类型和所属区查询
     * @param map
     * @return
     */
    List<Map> findByFylxAndSSQ(Map map);
    /**
     * 根据申请房源类型和所属区查询总数
     * @param map
     * @return
     */
    int findByFylxAndSSQCount(Map map);

    /**
     * 低保特困补贴，新就业，外来务工分房前放弃列表
     * @param map
     * @return
     */
    List<Map> houseQuitList(Map map);
    /**
     * 低保特困补贴，新就业，外来务工分房前放弃总数
     * @param map
     * @return
     */
    int houseQuitListCount(Map map);


    /**
     * 分房子但是未签合同分页
     * @param map
     * @return
     */
    List<Map> findNoSign(Map map);

    /**
     * 分房子但是未签合同全部
     * @param map
     * @return
     */
    List<Approve> findAllNoSign(Map map);

    /**
     * 分房子但是未签合同总数
     * @param map
     * @return
     */
    int countNoSign(Map map);

    /**
     * 查询已分配房子的申请
     * @param map
     * @return
     */
    List<Map> findAllApply(Map map);

    int findAllApplyCount(Map map);

    /**
     * 退房审批内容
     * @param map
     * @return
     */
    List<Approve> findTFSpForm(Map map);


    /**
     * 条件查询已经申请通过但没有分到房子的申请信息（经适房和低保特困公租房）
     * @param map
     * @return
     */
    List<Map<String,Object>> findPassApprove(Map map);

    /**
     * 更新审批单状态（主要用于摇号，更新为摇号驳回状态）
     * @param mapList
     * @return
     */
    int updateApproveStateBatch(List<Map<String,Object>> mapList);

    /**
     * 条件查询数目
     * @param map
     * @return
     */
    int findPassApproveCount(Map map);

    List<Approve> findJSFForm(Map map);

    /**
     * 已分房可以调房的用户分页
     * @param map
     * @return
     */
    List<Map> findChangePersons(Map map);

    /**
     * 已分房可以调房的用户总数
     * @param map
     * @return
     */
    int findChangePersonsCount(Map map);

    /**
     * 条件查询待年审列表
     * @param map
     * @return
     */
    List<Map<String,Object>> selectApplyNsMap(Map map);

    /**
     * 根据当前用户身份证号查询初审申请记录
     * @param map
     * @return
     */
    List<Map> findApplyByUserSfzh(Map map);
    /**
     * 根据当前用户身份证号查询初审申请记录总数
     * @param map
     * @return
     */
    int findApplyByUserSfzhCount(Map map);

    /**
     * 根据根据流程实例id关联查询初审
     * @param map
     * @return
     */
    Approve findByProcessInstanceId(Map map);


    /**
     * 根据根据流程实例id关联查询年审
     * @param map
     * @return
     */
    Approve findNSByProcessInstanceId(Map map);

    /**
     * 查询申请审核信息
     * @param approve
     * @return
     */
    List<Approve> findApplyForApprove(Approve approve);

}