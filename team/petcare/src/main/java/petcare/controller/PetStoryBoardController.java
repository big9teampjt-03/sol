package petcare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import petcare.model.BoardPetstory;
import petcare.service.PetStoryBoardService;

@Controller
@RequestMapping("/board/*")
public class PetStoryBoardController {
	@Autowired
	private PetStoryBoardService petStoryBoardService;
	
	@GetMapping("insert")
	public String insert() {
		return "/board/boardPetStoryInsert";
	}
	
	@PostMapping("fileInsert")
	public String insert(BoardPetstory bpsboard, HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		petStoryBoardService.fileInsert(bpsboard, uploadFolder);
		 
		 return "redirect:list";
	}
	
	@GetMapping("list")
	public String list(Model model) {
		model.addAttribute("lists",petStoryBoardService.list());
		return "/board/boardPetStoryList";
	}
	

}
