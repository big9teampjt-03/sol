package petcare.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	

}
