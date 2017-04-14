package com.dongmyo.example.service;

import com.dongmyo.example.model.Member;

public interface MemberService {
    Member getMember(Long memberId);

    Member createMember(Member memberRequest);

}
