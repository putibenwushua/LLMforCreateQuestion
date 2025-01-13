package com.rabbiter.oes.mapper;

import com.rabbiter.oes.entity.Admin;
import org.apache.ibatis.annotations.*;

import java.util.List;

//对数据库进行数据数据持久化操作，方法语句是直接针对数据库操作的。
//作用为访问数据库，向数据库发送sql语句，完成数据的增删改查任务。
@Mapper
public interface AdminMapper {

    @Select("select adminName,sex,tel,email,cardId,role from admin")
    public List<Admin> findAll();

    @Select("select adminId,adminName,sex,tel,email,cardId,role,pwd from admin where adminId = #{adminId}")
    public Admin findById(Integer adminId);

    @Delete("delete from admin where adminId = #{adminId}")
    public int deleteById(int adminId);

    @Update("update admin set adminName = #{adminName},sex = #{sex}," +
            "tel = #{tel}, email = #{email},pwd = #{pwd},cardId = #{cardId},role = #{role} where adminId = #{adminId}")
    public int update(Admin admin);

    @Options(useGeneratedKeys = true,keyProperty = "adminId")
    @Insert("insert into admin(adminName,sex,tel,email,pwd,cardId,role) " +
            "values(#{adminName},#{sex},#{tel},#{email},#{pwd},#{cardId},#{role})")
    public int add(Admin admin);
}
