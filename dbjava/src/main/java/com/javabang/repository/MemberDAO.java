package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.MemberDTO;

@Repository
public interface MemberDAO {

	int add(MemberDTO dto);

	MemberDTO login(MemberDTO dto);

}
