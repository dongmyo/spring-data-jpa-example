package com.dongmyo.example.service;

import com.dongmyo.example.mapper.MemberMapper;
import com.dongmyo.example.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberMapper memberMapper;


    @Override
    public Member getMember(Long memberId) {
        return memberMapper.getMember(memberId);
    }

    @Transactional
    @Override
    public Member createMember(Member member) {
        memberMapper.insertMember(member);
        return member;
    }

}
