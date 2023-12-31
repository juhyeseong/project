package com.javabang.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.javabang.model.WishListDTO;

@Repository
public interface WishListDAO {
	
	int countWish(HashMap<String, Object> map);

	int createWishList(WishListDTO dto);

	int deleteWishList(WishListDTO dto);

	List<WishListDTO> selectMyWishList(int member);
}