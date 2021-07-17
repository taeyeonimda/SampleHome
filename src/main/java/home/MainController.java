package home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String Main() {
		return "main";
	}

	@GetMapping("/common/myPage")
	public String MyPage() {
		return "common/myPage";
	}

	@GetMapping("/admin")
	public String adminMain() {
		return "/admin/main";
	}
}
