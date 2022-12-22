package petcare.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import petcare.model.BoardPetstory;

public interface PetStoryBoardRepository extends JpaRepository<BoardPetstory, Long>{
	
	public Page<BoardPetstory>findByTitleContaining(String title, Pageable pageable);


	public Page<BoardPetstory>findByContentContaining(String title, Pageable pageable);

	
	  //제목검색개수
	 
	//제목검색개수
	@Query(value="select count(*) from  b_petstoryl where title like CONCAT('%',:word,'%')", nativeQuery=true)
	public Long cntTitleSearch(@Param("word") String word);

	@Query(value="select count(*) from  b_petstoryl where title like CONCAT('%',:word,'%')",nativeQuery=true)
	public Long cntContentSearch(@Param("word") String word);
}