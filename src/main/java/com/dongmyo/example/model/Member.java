package com.dongmyo.example.model;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("member")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class Member {
    @JsonSerialize(using = ToStringSerializer.class)
    private int id;

    private String code;

    private String name;

    private String email;

    private String phone;

}
