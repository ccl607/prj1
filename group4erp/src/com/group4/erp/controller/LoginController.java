package com.group4.erp.controller;

import java.util.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class LoginController {
	
	@Autowired
	//private LoginService loginService;	
	
	
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginForm() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.jsp");
		
		return mav;
	}
	
	@RequestMapping(value="/loginProc.do")
	public ModelAndView loginProc(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		
		return mav;
	}
	
	/*@RequestMapping(value="/joininsert.do")
	public ModelAndView joinMembership() {
		ModelAndView mav = new ModelAndView();
		System.out.println("가입 메소드 실행");
		mav.setViewName("join.jsp");
		
		return mav;
	} */
	
}
