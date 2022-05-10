package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;

public interface GoodsDAO_Interface {

	void orderDone(OrderDTO oDTO) throws Exception;

	CartDTO orderConfirmByNum(int num) throws Exception;

	List<CartDTO> cartList(String userid) throws Exception;

	List<GoodsDTO> goodsList(String gCategory) throws Exception;

	GoodsDTO goodsRetrieve(String gCode) throws Exception;

	void cartAdd(CartDTO cart) throws Exception;

	void cartUpdate(Map<String, String> map) throws Exception;

	void cartDelete(int num) throws Exception;

	void delAllCart(ArrayList<String> list) throws Exception;

	int getgStock(OrderDTO oDTO) throws Exception;

	void setgStock(HashMap map) throws Exception;

	List<CartDTO> orderConfirmByCheck(ArrayList<String> list) throws Exception;

}