package com.javabang.repository;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

@Repository
public interface ReportDAO {

	int usedCount(HashMap<String, Integer> map);

}
