package mari.exam.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import mari.exam.models.User;
import mari.exam.services.UserService;


@Component
public class UserValidator implements Validator {
	private final UserService userService;


	public UserValidator(UserService userService) {
		this.userService = userService;
	}

    // 1
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    // 2
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }

        if (userService.findByEmail(user.getEmail()) != null) {
        	errors.rejectValue("email", "Unique");
        }
    }
}