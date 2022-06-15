/*
 * package com.controller;
 * 
 * import java.util.Map; import java.util.Set;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.ExceptionHandler; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.service.DashBoardService;
 * 
 * @Controller public class DashBoardController {
 * 
 * @Autowired DashBoardService service;
 * 
 * // 에러처리
 * 
 * @ExceptionHandler({ Exception.class }) public String errorPage() { return
 * "error/error"; }
 * 
 * @RequestMapping("/dashBoard") public String statsUser(Model model) throws
 * Exception{ System.out.println("/dashBoard");
 * 
 * Map<String, Object> map = DashBoardService.getSoldGoodsList(); //map에 두개가 담겨져
 * 있음 //List<QuitUser> user //Map<String, Integer> reason Map<String, Integer>
 * reason = (Map<String, Integer>) map.get("reason");
 * 
 * //데이터 가공 후 전달 String result = ""; Set<String> reasonKeys = reason.keySet();
 * 
 * for(String key : reasonKeys) { if(result!="") { result += ","; } result +=
 * "['"+key+"', "+reason.get(key)+"]"; }
 * 
 * model.addAttribute("result", result);
 * 
 * return "forward:/user/dashBoard.jsp"; } }
 */