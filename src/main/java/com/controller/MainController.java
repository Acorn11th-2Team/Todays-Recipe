package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.service.GoodsService;


  @Controller public class MainController {
  
  @Autowired 
  GoodsService service;
  @ExceptionHandler({Exception.class})
  public String errorPage() {
  	return "error/error";//error/error.jsp
  }
  @RequestMapping("/") 
  public ModelAndView goodsList()throws Exception {
 //int num= 10/0;
	  List<GoodsDTO> list= service.goodsList("Vegetable");
	  ModelAndView mav= new ModelAndView();
	  mav.addObject("goodsList", list);
	  //request.setAttribute("goodsList", list)와 동일
	  mav.setViewName("main");//main.jsp
	  return mav;	  
  }
  @RequestMapping("/loginCheck/main") 
  public String main()throws Exception {
	return "redirect:../";  
  }
  
  
  }
 