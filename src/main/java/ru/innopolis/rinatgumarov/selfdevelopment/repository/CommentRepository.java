package ru.innopolis.rinatgumarov.selfdevelopment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Comment;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long>{
    List<Comment> findAllByTask(Task task);
}
