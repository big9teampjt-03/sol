package petcare.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import petcare.model.BoardPetstory;
import petcare.repository.PetStoryBoardRepository;

@Service
public class PetStoryBoardService {

	@Autowired
	private PetStoryBoardRepository petStoryBoardRepository;

	public void fileInsert(BoardPetstory bpsboard, String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile f = bpsboard.getUploadpetstory();
		String uploadFileName = "";
		if (!f.isEmpty()) {// 파일 선택됌
			uploadFileName = uuid.toString() + "_" + f.getOriginalFilename();
			File saveFile = new File(uploadFolder, uploadFileName);
			try {
				f.transferTo(saveFile); // 파일 업로드
				bpsboard.setPetstoryimage(uploadFileName);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		petStoryBoardRepository.save(bpsboard);
	}

	// public List<BoardPetstory>list(){ return petStoryBoardRepository.findAll(); }

	
	public Page<BoardPetstory> findAll(String field, String word, Pageable pageable) {

		Page<BoardPetstory> lists = petStoryBoardRepository.findAll(pageable);// 아무 검색 없을때
		if (field.equals("title")) {
			lists = petStoryBoardRepository.findByTitleContaining(word, pageable);
		} else if (field.equals("content")) {
			lists = petStoryBoardRepository.findByContentContaining(word, pageable);
		}
		return lists;
	}
	  
	public Long count(String field, String word) { 
	Long count =petStoryBoardRepository.count();
	if (field.equals("title")) { count = petStoryBoardRepository.cntTitleSearch(word); } 
	else if (field.equals("content")) { count = petStoryBoardRepository.cntContentSearch(word); }
	  return count; 
	  }
	 

	public Long count() {
		return petStoryBoardRepository.count();
	}

	// 상세보기
	@Transactional
	public BoardPetstory findById(Long petstoryID) {
		BoardPetstory bpsboard = petStoryBoardRepository.findById(petstoryID).get();
		bpsboard.setHitcount(bpsboard.getHitcount() + 1);
		// bpsboard.setLikes(bpsboard.getLikes()+1);
		return bpsboard;

	}

	// 수정하기
	// 더티체킹
	@Transactional
	public void update(BoardPetstory bpsboard) {
		BoardPetstory b = petStoryBoardRepository.findById(bpsboard.getPetstoryID()).get();
		b.setContent(bpsboard.getContent());
		b.setTitle(bpsboard.getTitle());
		b.setRegdate(new Date());
	}

	@Transactional
	public void delete(Long petstoryID) {
		petStoryBoardRepository.deleteById(petstoryID);
	}

	// 좋아요 숫자 늘리기
	@Transactional
	public long updateLikes(BoardPetstory bpsboard) {
		BoardPetstory b = petStoryBoardRepository.findById(bpsboard.getPetstoryID()).get();
		b.setLikes(bpsboard.getLikes() + 1);
		return b.getLikes();
	}

}
