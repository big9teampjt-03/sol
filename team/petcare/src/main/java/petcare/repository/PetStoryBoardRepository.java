package petcare.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import petcare.model.BoardPetstory;

public interface PetStoryBoardRepository extends JpaRepository<BoardPetstory, Long>{
	

}
