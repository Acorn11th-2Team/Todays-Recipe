package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.service.GoodsService;
import com.service.MemberService;

@Controller
public class GoodsController {
	@Autowired
	GoodsService service;
	@Autowired
	MemberService mService;
	//에러처리
		@ExceptionHandler({Exception.class})
		public String errorPage() {
			return "error/error";
		}
	@RequestMapping("/loginCheck/orderDone")
	public String orderDone(OrderDTO oDTO,
			int orderNum, HttpSession session, RedirectAttributes xxx) throws Exception{
		System.out.println(oDTO+"\t"+orderNum);
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
		
		oDTO.setUserid(dto.getUserid());
		oDTO.setNum(orderNum);
		// 재고 개수를 가져옴
		int Stock = service.getgStock(oDTO);	// 주문하려는 상품의 재고
		int gAmount = oDTO.getgAmount();	// 주문하려는 양
		String gCode = oDTO.getgCode();	// 주문하려는 제품코드
		int AfterStock = Stock - gAmount;	// 주문완료 후 남은 재고의 양
		
		HashMap map = new HashMap();
		
		map.put("gCode", gCode);
		map.put("gStock", AfterStock);
		if(AfterStock >= 0) {	// 재고가 있는 경우
			service.orderDone(oDTO, orderNum, map);
			xxx.addFlashAttribute("oDTO", oDTO);
			return "redirect:../orderDone";
		}
		else {	// 재고가 없는 경우
			session.setAttribute("mesg", "재고가 없습니다");
			session.setAttribute("gStock", Stock);
			return "redirect:../loginCheck/cartList";
		}
		
	}
	
	@RequestMapping("/loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num") int num, HttpSession session, 
			RedirectAttributes xxx) throws Exception{
		MemberDTO mDTO=(MemberDTO)session.getAttribute("login");
		String userid= mDTO.getUserid();
		mDTO= mService.myPage(userid); //사용자 정보 가져오기 
		CartDTO cart= service.orderConfirmByNum(num); //장바구니 정보가져오기 
		xxx.addFlashAttribute("mDTO", mDTO);  //request에 회원정보저장
		xxx.addFlashAttribute("cDTO", cart); //request에 카트정보저장	
		return "redirect:../orderConfirm"; //servlet-context에 등록
	}
	
	@RequestMapping(value = "/loginCheck/delAllCart")
	public String delAllCart(@RequestParam("check") ArrayList<String> list) throws Exception{
		System.out.println(list);
		service.delAllCart(list);
		return "redirect:../loginCheck/cartList";
	}
	
	@RequestMapping(value = "/loginCheck/cartDelete")
	@ResponseBody
	public void cartDelte(@RequestParam("num") int num) throws Exception{
		System.out.println(num);
		service.cartDelete(num);
	}
	@RequestMapping(value = "/loginCheck/cartUpdate")
	@ResponseBody
	public void cartUpdate(@RequestParam Map<String, String>map) throws Exception{
		System.out.println(map);
		service.cartUpdate(map);
	}
	
	@RequestMapping("/loginCheck/cartList")
	public String cartList(RedirectAttributes attr, HttpSession session) throws Exception{
		MemberDTO dto= (MemberDTO)session.getAttribute("login");
		String userid=dto.getUserid();
		List<CartDTO> list =service.cartList(userid);
		attr.addFlashAttribute("cartList", list);// 리다이렉트시 데이터 유지
		return "redirect:../cartList"; //servlet-context에 등록
		
	}
	@RequestMapping("/loginCheck/cartAdd")
	public String cartAdd(CartDTO cart, HttpSession session) throws Exception{
		MemberDTO mDTO= (MemberDTO)session.getAttribute("login");
		cart.setUserid(mDTO.getUserid());
		session.setAttribute("mesg", cart.getgCode());
		service.cartAdd(cart);
		return "redirect:../goodsRetrieve?gCode="+cart.getgCode();
	}
	
	@RequestMapping("/goodsRetrieve")//goodsRetrieve.jsp
	@ModelAttribute("goodsRetrieve") //key값
	public GoodsDTO goodsRetrieve(@RequestParam("gCode") String gCode)throws Exception {
		GoodsDTO dto= service.goodsRetrieve(gCode);
		return dto;		
	}
	
	@RequestMapping("/goodsList")
	public ModelAndView goodsList(@RequestParam("gCategory") String gCategory) throws Exception{
		if(gCategory== null) {
			gCategory="Vegetable";
		}
		List<GoodsDTO> list= service.goodsList(gCategory);
		ModelAndView mav= new ModelAndView();
		mav.addObject("goodsList", list);
		//request.setAttribute("goodsList", list)와 동일
		mav.setViewName("main"); //main.jsp
		return mav;				
	}

	
}
