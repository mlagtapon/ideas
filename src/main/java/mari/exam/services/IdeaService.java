package mari.exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import mari.exam.models.Ideas;
import mari.exam.models.User;
import mari.exam.models.UserIdea;
import mari.exam.repositories.IdeaRepository;
import mari.exam.repositories.UserIdeaRepository;

@Service
public class IdeaService {
	private final IdeaRepository iRepo;
	private final UserIdeaRepository uiRepo;
	
	public IdeaService(IdeaRepository iRepo, UserIdeaRepository uiRepo) {
		this.iRepo = iRepo;
		this.uiRepo = uiRepo;
	}
	
	public List<Ideas> allIdea(){
		return iRepo.findAll();
	}
	
	public List<UserIdea> allUserIdea(){
		return uiRepo.findAll();
	}
	
	public List<UserIdea> findUserIdea(Long userId){
		return uiRepo.findByUserId(userId);
	}
	
	public Ideas createIdea(Ideas c) {
		return iRepo.save(c);
	}
	
	public Ideas update(Ideas u) {
		return iRepo.save(u);
	}
	
	public Ideas findOne(Long id) {
		Optional<Ideas> idea = iRepo.findById(id);
			if(idea.isPresent()) {
				return idea.get();
			} else {
				return null;
			}
	}
	
	public Ideas like(Long id, User u) {
		Ideas idea = findOne(id);
		List<User> user = idea.getUsers();
		user.add(u);
		idea.setUsers(user);
		return iRepo.save(idea);
	}
	
	public Ideas unlike(Long id, User u) {
		Ideas idea = findOne(id);
		List<User> user = idea.getUsers();
		user.remove(u);
		idea.setUsers(user);
		return iRepo.save(idea);
	}
	
	public Ideas delete(Long id) {
		iRepo.deleteById(id);
		return null;
	}
}
