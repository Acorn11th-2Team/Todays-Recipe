package com.controller;

import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class RecipeController {
	@Autowired
	GoodsService service;
	
	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";// error/error.jsp
	}

	@RequestMapping(value = "/recipeRecomm")
	public String recipeRecomm(@RequestParam("check") ArrayList<String> list, HttpSession session, Model model)
			throws Exception {
		System.out.println("장바구니에서 받아온 정보" + list);
		session.setAttribute("cartNum", list);

		// json 받아와서 코드, 이미지, 유알엘 넘겨주기
		JSONParser parser = new JSONParser();

		try {
			FileReader reader = new FileReader("C:\\recipe.json");
			Object obj = parser.parse(reader);
			JSONObject jsonObject = (JSONObject) obj;

			reader.close();

			System.out.println(jsonObject);

			model.addAttribute("recipe", jsonObject.get("data"));

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "recipeRecomm";
	}

	@RequestMapping(value = "/recipeIngred")
	public String recipeIngred(@RequestParam("check") ArrayList<String> list, @RequestParam("code") String code, HttpSession session, Model model) throws Exception {
		System.out.println("레시피에서 받아온 레시피번호 : " + list);
		
		session.setAttribute("cartNum", list);
		session.setAttribute("code", code);
		
		System.out.println("code=" + code);

		// json 받아와서 코드, 이미지, 유알엘 넘겨주기
		JSONParser parser = new JSONParser();
		
		try {
			FileReader reader = new FileReader("C:\\recipe.json");
			Object obj = parser.parse(reader);
			JSONObject jsonObject = (JSONObject) obj;

			reader.close();
			
//			System.out.println(jsonObject);
			
			ArrayList<JSONObject> jsonlst = (ArrayList<JSONObject>) jsonObject.get("data");
			System.out.println(jsonlst);
			
			ArrayList<String> ingred = new ArrayList<String>(); // json에서 재료 목록
			List<GoodsDTO> recipeGoods = new ArrayList<GoodsDTO>(); // 재료에 해당하는 goods를 db에서 가져옴
			List<CartDTO> cartdto = new ArrayList<CartDTO>();	// 주문정보 가져오기
			
			// json에서 일치하는 레시피코드 찾아 재료 뽑기
			for (JSONObject j : jsonlst) {
				String jcode = String.valueOf(j.get("code"));
				
//				System.out.println("json 코드 : " + jcode + ", RequestParam 코드 : " + code);
				
				if (jcode.equals(code)) {
					ingred = (ArrayList<String>) j.get("ingredients");
				}
			}
			
			System.out.println("재료들 리스트 확인하기 : " + ingred);
			
			// 재료와 일치하는 상품 정보 가져오기
			for (String i : ingred) {
				GoodsDTO dto = service.ingredients(i);
				recipeGoods.add(dto);
			}
			
			System.out.println("***receipeGoods 안의 내용 확인하기 : " + recipeGoods);
			session.setAttribute("ingred", recipeGoods);
			
			// 주문정보 가져오기
			List<CartDTO> cartList = service.orderConfirmByCheck(list);
			System.out.println("cartList 내용 확인하기 : " + cartList);
			session.setAttribute("cartInfo", cartList);
			
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "recipeIngred";
	}
}
