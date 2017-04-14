package com.dongmyo.example.mapper;

import com.dongmyo.example.model.Member;
import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
    Member getMember(@Param("id") Long id);

    Integer insertMember(Member memberRequest);

}
