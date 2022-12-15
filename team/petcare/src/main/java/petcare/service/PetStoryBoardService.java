package petcare.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public List<BoardPetstory>list(){
		return petStoryBoardRepository.findAll();
	}
	
	@Transactional
	public BoardPetstory findById(Long petstory_id) {
		BoardPetstory bpsboard = petStoryBoardRepository.findById(petstory_id).get();
		bpsboard.setHitcount(bpsboard.getHitcount()+1);
		return bpsboard;
		
	}
	
	@Transactional
	public void update(BoardPetstory bpsboard) {
		BoardPetstory b = petStoryBoardRepository.findById(bpsboard.getPetstory_id()).get();
		b.setContent(bpsboard.getContent());
		b.setTitle(bpsboard.getTitle());
		b.setRegdate(new Date());
		
	}
	@Transactional
	public void delete(Long petstory_id) {
		petStoryBoardRepository.deleteById(petstory_id);
	}

}
