package home.user.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import home.user.domain.User;
import home.user.service.UserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/joinForm")
	public String userJoin() {
		return "user/joinForm";
	}

	@Transactional
	@RequestMapping("/join")
	@ResponseBody
	public void regUser(User user) {
		userService.addUser(user);
	}

	@GetMapping("/logon")
	public String userLogin() {
		return "user/logon";
	}

	@Transactional
	@GetMapping("/login")
	@ResponseBody
	public int loginUser(User user, HttpSession session) {
		int result = 0;//실패0
		User memUser = userService.loginUser(user);

		if (memUser != null) {
			result = 1;
			userService.loginUser(user);
			session.removeAttribute("user");
			session.setAttribute("user", user);
		}else {
			result =0;
		}
		return result;
	}
	
	@RequestMapping("/logout")
	public String userLogOut(HttpSession session, User user) {
		session.removeAttribute("user");
		return "user/logout";
	}
	
	@RequestMapping("/modUser")
	public String userMod() {
		return "user/modUser";
	}
	
	@Transactional
	@RequestMapping("/chnage")
	@ResponseBody
	public void modiUser(User user) {
		userService.updateUser(user);
	}
	
	@Transactional
	@RequestMapping("/delete")
	@ResponseBody
	public void delUser(User user) {
		userService.deleteUser(user);
	}
	
}
