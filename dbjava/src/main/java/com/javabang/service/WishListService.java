package com.javabang.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javabang.model.WishListDTO;
import com.javabang.repository.RentDAO;
import com.javabang.repository.WishListDAO;

@Service
public class WishListService {
	@Autowired private WishListDAO wishListDAO;
	@Autowired private RentDAO rentDAO;
	
	public int countWish(HashMap<String, Object> map) {
		return wishListDAO.countWish(map);
	}

	public void createWishList(WishListDTO dto) {
		wishListDAO.createWishList(dto);
	}

	public void deleteWishList(WishListDTO dto) {
		wishListDAO.deleteWishList(dto);
	}

	public List<WishListDTO> selectMyWishList(int member) {
		List<WishListDTO> list = wishListDAO.selectMyWishList(member);
		
		list.forEach(dto -> {
			dto.setFilePath(rentDAO.selectOneFile(dto.getRent()));
		});
		
		return list;
	}
}
