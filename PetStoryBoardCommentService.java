package petcare.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import petcare.model.BoardPetstory;
import petcare.model.CommentPetStory;
import petcare.repository.PetStoryBoardCommentRepository;
import petcare.repository.PetStoryBoardRepository;

@Service
public class PetStoryBoardCommentService {

	@Autowired
	private PetStoryBoardCommentRepository petStoryBoardCommentRepository;
	@Autowired
	private PetStoryBoardRepository petStoryBoardRepository;
	
	@Transactional
	public void insert(CommentPetStory petStoryBoardComment) {
		
		BoardPetstory bpsboard = petStoryBoardRepository.findById(petStoryBoardComment.getBPetstoryl().getPetstoryID()).get();
		bpsboard.setReplycnt(bpsboard.getReplycnt()+1); 
		
		  petStoryBoardCommentRepository.insert(petStoryBoardComment.getContent(),
		  petStoryBoardComment.getBPetstoryl().getPetstoryID(),
		  petStoryBoardComment.getUser().getUsername(),
		  petStoryBoardComment.getUser().getUserid());
		 
		//petStoryBoardCommentRepository.save(petStoryBoardComment);
		
}

  public List<CommentPetStory> list(Long petstoryID) { 
	  return petStoryBoardCommentRepository.findByPetStoryId(petstoryID); }
  
  @Transactional
  public void delete(Long competstoryID) {
	  Optional<CommentPetStory> c = petStoryBoardCommentRepository.findById(competstoryID);
	  BoardPetstory b = c.get().getBPetstoryl();
	  b.setReplycnt(b.getReplycnt()-1);
	  petStoryBoardCommentRepository.deleteById(competstoryID);
  }
 
}
