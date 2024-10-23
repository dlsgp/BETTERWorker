package kr.co.partTime.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.partTime.beans.ContentBean;
import kr.co.partTime.beans.UserBean;


@Controller
public class MainController {
	

	@GetMapping("/main")
	public String main() {
		
	
		return  "/WEB-INF/views/mainpage.jsp";
	}
	
	
	
	
	
	
}
