package ru.innopolis.rinatgumarov.selfdevelopment.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.innopolis.rinatgumarov.selfdevelopment.error.NotAllowed;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Comment;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;
import ru.innopolis.rinatgumarov.selfdevelopment.service.CommentService;
import ru.innopolis.rinatgumarov.selfdevelopment.service.TaskService;

import java.util.Date;

@Controller
@RequestMapping(value = "/comment")
public class CommentController {

    private final CommentService commentService;
    private final TaskService taskService;


    public CommentController(CommentService commentService, TaskService taskService) {
        this.commentService = commentService;
        this.taskService = taskService;
    }

    @PostMapping(value = "{taskId}/add")
    public String addComment(
            @PathVariable(name = "taskId") Long taskId,
            @RequestParam(name = "text") String text
    ) throws NotAllowed {
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Task task = taskService.findOne(user, taskId);
        if (task == null)
            throw new NotAllowed();
        commentService.save(Comment.builder()
                .task(task)
                .date(new Date())
                .text(text)
                .build());
        return "redirect:/tasks/" + taskId;
    }
}
