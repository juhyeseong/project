package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.MemberDTO;

@Repository
public interface MemberDAO {

	int add(MemberDTO dto);

	MemberDTO login(MemberDTO dto);

	int reset(MemberDTO dto);   // 비밀번호 재설정

	MemberDTO selectOne(int idx);   // 회원정보 수정 목록 하나만 불러오기

	int update(MemberDTO dto);   // 회원정보 수정

	int delete(int idx); // 회원탈퇴(삭제)

}
