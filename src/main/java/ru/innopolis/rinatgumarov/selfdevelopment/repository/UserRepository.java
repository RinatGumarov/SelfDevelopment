package ru.innopolis.rinatgumarov.selfdevelopment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByLogin(String login);

}
