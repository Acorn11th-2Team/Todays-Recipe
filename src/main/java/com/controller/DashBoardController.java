package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.OrderdaySalesDTO;
import com.service.DashBoardService;

@Controller
public class DashBoardController {

	@Autowired
	DashBoardService service;

	// 에러처리
	@ExceptionHandler({ Exception.class })
	public String errorPage() {
		return "error/error";
	}

	@RequestMapping("/dashBoard")
	public String dashBoard(Model model) throws Exception {
		// orderday, orderday로 그룹화하여 더한 값(sum)
		List<OrderdaySalesDTO> list = service.getDaySales();

		// Map으로 변환
		Map<String, Integer> map = new HashMap<String, Integer>();

		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getOrderday(), list.get(i).getSales());
		}

		// 차트로 표현 가능하도록 데이터 가공 [항목, 값]
		String result = "";
		Set<String> keys = map.keySet();

		for (String key : keys) {
			if (result != "") {
				result += ",";
			}
			result += "['" + key + "', " + map.get(key) + "]";
		}

		System.out.println(map);

		model.addAttribute("daysales", result);

		return "dashBoard";
	}

	@RequestMapping("/selectDay")
	public String dashBoard(Model model, String startDay, String endDay) throws Exception {
		// 날짜 형식 변환
		startDay = startDay.replaceAll("-", "/");
		endDay = endDay.replaceAll("-", "/");		
		
		// map으로 변환
		Map<String, String> mapDay = new HashMap<String, String>();
		mapDay.put("startDay", startDay);
		mapDay.put("endDay", endDay);
		
		// orderday, orderday로 그룹화하여 더한 값(sum)
		List<OrderdaySalesDTO> list = service.getDaySalesMap(mapDay);
		
		// Map으로 변환
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		for (int i = 0; i < list.size(); i++) {
			map.put(list.get(i).getOrderday(), list.get(i).getSales());
		}
		
		// 차트로 표현 가능하도록 데이터 가공 [항목, 값]
		String result = "";
		Set<String> keys = map.keySet();
		
		for (String key : keys) {
			if (result != "") {
				result += ",";
			}
			result += "['"+key+"', "+map.get(key)+"]";
		}
		
		System.out.println(map);
		
		model.addAttribute("daysales", result);
		
		return "dashBoard";
	}
}
