package com.controller;

import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RecipeController {

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
	public String recipeIngred(@RequestParam("check") ArrayList<String> list, @RequestParam("code") String code,
			HttpSession session) throws Exception {
		System.out.println("레시피에서 받아온 정보" + list);
		session.setAttribute("cartNum", list);
		session.setAttribute("code", code);
		System.out.println("code=" + code);

		return "recipeIngred";
	}
}
