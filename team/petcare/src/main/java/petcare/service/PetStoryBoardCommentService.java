package petcare.service;

import java.util.List;

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
		
		BoardPetstory bpsboard = petStoryBoardRepository.findById(petStoryBoardComment.getBPetstoryl().getPetstory_id()).get();
		bpsboard.setReplycnt(bpsboard.getReplycnt() + 1); 
		petStoryBoardCommentRepository.insert(petStoryBoardComment.getContent(),
											  petStoryBoardComment.getBPetstoryl().getPetstory_id());
											  //petStoryBoardComment.getUsername());
		
}

  public List<CommentPetStory> list(Long petstory_id) { 
	  return petStoryBoardCommentRepository.findByPetStoryId(petstory_id); }
 
}
