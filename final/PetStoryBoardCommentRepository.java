package petcare.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import petcare.model.CommentPetStory;

public interface PetStoryBoardCommentRepository extends JpaRepository<CommentPetStory, Long>{
	@Modifying
	@Query(value = "insert into comment_pet_story(content, regdate, bpetstorynum, username, userID) values(?1,now(), ?2, ?3, ?4)",nativeQuery = true)
	public void insert(String content, Long bum, String username, Long userID);
	
	 //@Query("select cps from comment_pet_story cps where petstoryID =?1") public
	 @Query("select cps from comment_pet_story cps join fetch cps.bPetstoryl where bpetstorynum=?1")
	 List<CommentPetStory> findByPetStoryId(Long petstoryID);
	 
	// @Query(value="select * from comment_pet_story where bpetstorynum=:petstoryID",nativeQuery = true)
	 @Query("select sc from comment_pet_story sc join fetch sc.user where bpetstorynum=?1")//LAZY(패치조인 사용)
	 public List<CommentPetStory> list(int petstoryID);
	 
	 @Query(value="select count(*) from comment_pet_story where bpetstorynum=:petstoryID",nativeQuery = true)
	 public  int getCount(int petstoryID);

}
