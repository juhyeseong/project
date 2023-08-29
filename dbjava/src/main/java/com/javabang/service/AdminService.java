package com.javabang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.repository.AdminDAO;

@Service
public class AdminService {

	@Autowired private AdminDAO adminDAO;
}
