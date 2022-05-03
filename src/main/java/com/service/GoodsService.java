package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.GoodsDAO_Interface;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;

@Service
public class GoodsService {
@Autowired
GoodsDAO_Interface dao;//////////인터페이스 타입 

@Transactional
public void orderDone(OrderDTO oDTO, int orderNum, HashMap map) throws Exception {

	dao.orderDone(oDTO); //주문정보저장
	dao.cartDelete(orderNum); //카트에서 삭제 두 처리를 tx 처리함 root-context.xml에 
	dao.setgStock(map);
}
public CartDTO orderConfirmByNum(int num) throws Exception{
	CartDTO dto = dao.orderConfirmByNum(num);
	return dto;
}
public List<CartDTO> cartList(String userid) throws Exception{
	List<CartDTO> list= dao.cartList(userid);
	return list;
}
public List<GoodsDTO> goodsList(String gCategory) throws Exception{
	List<GoodsDTO> list= dao.goodsList(gCategory);
	return list;
}

public GoodsDTO goodsRetrieve(String gCode) throws Exception{
	GoodsDTO dto= dao.goodsRetrieve(gCode);
	return dto;
}

public void cartAdd(CartDTO cart)throws Exception {
	dao.cartAdd(cart);	
}
public void cartUpdate(Map<String, String> map) throws Exception{
	dao.cartUpdate(map);
	
}
public void cartDelete(int num)throws Exception {

		dao.cartDelete(num);

	
	
}
public void delAllCart(ArrayList<String> list) throws Exception{
	dao.delAllCart(list);
	
}
public int getgStock(OrderDTO oDTO) throws Exception {
	return dao.getgStock(oDTO);
}






}
