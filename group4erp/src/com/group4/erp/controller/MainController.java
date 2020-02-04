package com.group4.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.group4.erp.MainChartsDTO;
import com.group4.erp.service.MainService;

@Controller
public class MainController {
	@Autowired
	MainService mainService;

	@RequestMapping(value = "/getMainCharts.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public MainChartsDTO getMainCharts() {

		MainChartsDTO mainChartsDTO = null;
		try {
			mainChartsDTO = mainService.getMainCharts();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("mainChartsDTO => " + mainChartsDTO);
		return mainChartsDTO;
	}
}
