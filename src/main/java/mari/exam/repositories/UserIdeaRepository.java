package mari.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import mari.exam.models.UserIdea;

public interface UserIdeaRepository extends CrudRepository<UserIdea, Long>{
	List<UserIdea> findAll();
	List<UserIdea> findByUserId(Long userId);

}
