package com.javabang.repository;

import org.springframework.stereotype.Repository;

import com.javabang.model.MemberDTO;

@Repository
public interface MemberDAO {

	int add(MemberDTO dto);

	MemberDTO login(MemberDTO dto);

	int reset(MemberDTO dto);   // ��й�ȣ �缳��

	MemberDTO selectOne(int idx);   // ȸ���������� ����ϳ��� �θ���

	int update(MemberDTO dto);   // ȸ����������

	int delete(int idx); // ȸ�� Ż��(����)

	String getMail(MemberDTO dto); // ��й�ȣ �缳�� �̸��� ������

	MemberDTO userCheck(MemberDTO dto);

	int updatePw(MemberDTO tmp);

	

}
