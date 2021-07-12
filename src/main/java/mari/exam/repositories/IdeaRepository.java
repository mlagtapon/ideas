package mari.exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import mari.exam.models.Ideas;

public interface IdeaRepository extends CrudRepository<Ideas, Long>{
	List<Ideas> findAll();
}
