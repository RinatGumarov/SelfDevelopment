package ru.innopolis.rinatgumarov.selfdevelopment.service.impl;

import org.springframework.stereotype.Service;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Comment;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.repository.CommentRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.service.CommentService;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private final CommentRepository commentRepository;

    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    @Override
    public List<Comment> findAllByTask(Task task) {
        return commentRepository.findAllByTask(task);
    }

    @Override
    public void save(Comment comment) {
        commentRepository.save(comment);
    }
}
