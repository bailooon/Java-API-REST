package bailooon.com.github.bradesco.domain.repository;

import bailooon.com.github.bradesco.domain.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
}
