package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.OrderdaySalesDTO;

@Repository
public class DashBoardDAO {

	@Autowired
	SqlSessionTemplate template;//자동주입
	
	public List<OrderdaySalesDTO> getDaySales() throws Exception {
		// TODO Auto-generated method stub
		List<OrderdaySalesDTO> list = template.selectList("orderdaySales");
		return list;
	}

}
