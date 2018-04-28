package ru.innopolis.rinatgumarov.selfdevelopment.service;

import ru.innopolis.rinatgumarov.selfdevelopment.model.Comment;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;

import java.util.List;

public interface CommentService {
    List<Comment> findAllByTask(Task task);

    void save(Comment comment);
}
