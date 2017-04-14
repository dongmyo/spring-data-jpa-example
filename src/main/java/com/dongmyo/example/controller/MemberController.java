package com.dongmyo.example.controller;

import com.dongmyo.example.model.Member;
import com.dongmyo.example.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class MemberController {
    @Autowired
    MemberService memberService;


    @RequestMapping(value = "/members/{memberId}", method = RequestMethod.GET)
    public Member getMember(@PathVariable Long memberId) {
        return memberService.getMember(memberId);
    }

    @RequestMapping(value = "/members", method = RequestMethod.POST)
    public Member createMember(@RequestBody Member memberRequest) {
        return memberService.createMember(memberRequest);
    }

}
