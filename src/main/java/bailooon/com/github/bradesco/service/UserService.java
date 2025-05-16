package bailooon.com.github.bradesco.service;

import bailooon.com.github.bradesco.domain.model.User;

public interface UserService {

    User findById(Long id);

    User create(User userToCreate);
}
