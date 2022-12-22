package petcare.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import petcare.config.auth.PrincipalUser;
import petcare.model.BoardPetstory;
import petcare.model.CommentListVO;
import petcare.model.CommentPetStory;
import petcare.service.PetStoryBoardCommentService;

@RestController
@RequestMapping("/reply/*")
public class PetStoryBoardCommentController {
	@Autowired
	private PetStoryBoardCommentService petStoryBoardCommentService;
	
//댓글 추가
@PostMapping("insert/{petstoryID}")
public ResponseEntity<String> commentInsert(@PathVariable Long petstoryID,
											@RequestBody CommentPetStory commentPetStory,
											@AuthenticationPrincipal PrincipalUser principal){

	BoardPetstory bpsboard = new BoardPetstory();
	bpsboard.setPetstoryID(petstoryID);
	commentPetStory.setBPetstoryl(bpsboard);
	//System.out.println("principal.getMb() : " + principal.getUser());
	commentPetStory.setUser(principal.getUser());
	petStoryBoardCommentService.insert(commentPetStory);
	return new ResponseEntity<String>("success",HttpStatus.OK);
}


  //댓글 전체보기
  
	/*
	 * @GetMapping("list/{petstoryID}") public List<CommentPetStory>
	 * list(@PathVariable Long petstoryID){ List<CommentPetStory> cpslist =
	 * petStoryBoardCommentService.list(petstoryID);
	 * System.out.println(cpslist.size()); return cpslist; }
	 */
@GetMapping("commentList/{petstoryID}")
public CommentListVO list(@PathVariable int petstoryID) {
	List<CommentPetStory> carr = petStoryBoardCommentService.list(petstoryID);
	System.out.println(carr.get(0).getUser().getNickname());
	int count = petStoryBoardCommentService.getCount(petstoryID);
	CommentListVO cvo = new CommentListVO(carr, count);
	return cvo;
}
  
  //댓글 삭제
  @DeleteMapping("delete/{competstoryID}")
  public Long delete(@PathVariable Long competstoryID) {
	  petStoryBoardCommentService.delete(competstoryID);
	  return competstoryID;
  }
  
  
 

}
