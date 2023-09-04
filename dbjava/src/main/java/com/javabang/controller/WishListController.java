package com.javabang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javabang.service.WishListService;

@Controller
@RequestMapping("/wishList")
public class WishListController {
	@Autowired private WishListService wishListService;

}
