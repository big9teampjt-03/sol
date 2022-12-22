package petcare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import petcare.config.auth.PrincipalUser;
import petcare.model.BoardPetstory;
import petcare.service.PetStoryBoardService;

@Controller
@RequestMapping("/board/*")
public class PetStoryBoardController {
	@Autowired
	private PetStoryBoardService petStoryBoardService;
	
	@GetMapping("insert")
	@PreAuthorize("isAuthenticated()")
	public String insert() {
		return "/board/boardPetStoryInsert";
	}
	
	@PostMapping("fileInsert")
	public String insert(BoardPetstory bpsboard, HttpSession session, @AuthenticationPrincipal PrincipalUser principal) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		bpsboard.setUser(principal.getUser());
		petStoryBoardService.fileInsert(bpsboard, uploadFolder);
		 return "redirect:list";
	}
	
	
	/*
	 * @GetMapping("list") public String list(Model model) {
	 * model.addAttribute("lists",petStoryBoardService.list()); return
	 * "/board/boardPetStoryList"; }
	 */
	  
	
	  //게시글 전체보기:페이징,검색
	  
	 @GetMapping("list") 
	 public String list(Model model, 
			 			@PageableDefault(size=5,sort="petstoryID",direction=Direction.DESC)Pageable pageable,
			 			@RequestParam(required=false, defaultValue="")String field,
			 			@RequestParam(required=false, defaultValue="")String word) {
	  Page<BoardPetstory>lists=petStoryBoardService.findAll(field,word,pageable);
	  Long count = petStoryBoardService.count(field,word);
	  model.addAttribute("count",count); 
	  model.addAttribute("lists",lists); 
	  return "/board/boardPetStoryList"; 
	  }

	@GetMapping("view/{petstoryID}")
	public String view(@PathVariable Long petstoryID, Model model) {
		model.addAttribute("bpsboard",petStoryBoardService.findById(petstoryID));
		return "/board/boardPetStoryView";
	}
	
	
	//수정폼
	@GetMapping("update/{petstoryID}")
	public String update(@PathVariable Long petstoryID, Model model) {
		model.addAttribute("bpsboard", petStoryBoardService.findById(petstoryID));
		return "/board/boardPetStoryUpdate";
	}
	
	@PutMapping("updateLikes")
	@ResponseBody
	public long updateLikes(@RequestBody BoardPetstory boardPetStory) {
		//System.out.println("likes :"+boardPetStory.getLikes());
		
		return petStoryBoardService.updateLikes(boardPetStory);
	}
	
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody BoardPetstory boardPetStory) {
		petStoryBoardService.update(boardPetStory);
		//petStoryBoardService.updateLikes(boardPetStory);
		return "success";
	}
	
	@DeleteMapping("delete/{petstoryID}")
	@ResponseBody
	public String delete(@PathVariable Long petstoryID) {
		petStoryBoardService.delete(petstoryID);
		return "success";
	} 
	

}
