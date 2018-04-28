package ru.innopolis.rinatgumarov.selfdevelopment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findAllByUserOrderByStatusDescCreatedAtDesc(User user);

    List<Task> findAllByUserAndStatusGreaterThanOrderByStatusDescCreatedAtDesc(User user, int status);

    Task findByUserAndId(User user, Long id);

    void deleteByUserAndId(User user, Long id);
}
