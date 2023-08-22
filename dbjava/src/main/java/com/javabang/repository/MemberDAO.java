package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.MemberDTO;

@Repository
public interface MemberDAO {

   int add(MemberDTO dto);

   MemberDTO login(MemberDTO dto);

   int reset(MemberDTO dto);   // 비밀번호 재설정

   MemberDTO selectOne(int idx);   // 회원정보수정 목록하나만 부르기

   int update(MemberDTO dto);   // 회원정보수정

   int delete(int idx); // 회원 탈퇴(삭제)

   String getMail(MemberDTO dto); // 비밀번호 재설정 이메일 보내기

   MemberDTO userCheck(MemberDTO dto);

   int updatePw(MemberDTO tmp);

   int selectCount(String userId);

   int updateProfile(MemberDTO dto);

  int basicProfile(MemberDTO dto);   // 기본 이미지로 변경


  MemberDTO selectKakao(MemberDTO dto);

  int insertKakao(MemberDTO dto);

   

}