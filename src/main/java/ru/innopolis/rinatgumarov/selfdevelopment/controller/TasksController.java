package ru.innopolis.rinatgumarov.selfdevelopment.controller;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;
import ru.innopolis.rinatgumarov.selfdevelopment.service.TaskService;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/tasks")
public class TasksController {

    private static final SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
    private final TaskService taskService;

    @Autowired
    public TasksController(TaskService taskService) {
        this.taskService = taskService;
    }


    @GetMapping("all")
    public String getTasksPage(Model model){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        model.addAttribute("tasks", taskService.findAllByUser(user));
        return "tasks";
    }

    @GetMapping
    public String getTasksPageUndone(Model model){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        model.addAttribute("tasks", taskService.findAllByUserUndone(user));
        return "tasks";
    }

    @GetMapping(value = "{id}")
    public String getTaskPage(
            @PathVariable(name = "id") Long id,
            Model model
    ){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        model.addAttribute("task", taskService.findOne(user, id));
        model.addAttribute("format", format);
        return "task";
    }



    @SneakyThrows
    @PostMapping
    public String addTask(
        @RequestParam(name = "title") String title,
        @RequestParam(name = "text") String text,
        @RequestParam(name = "expiresAt") String expiresAt,
        @RequestParam(name = "importance") Integer status
    ){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Date date = format.parse(expiresAt);
        taskService.save(Task.builder()
                .title(title)
                .text(text)
                .user(user)
                .createdAt(new Date())
                .status(status)
                .expiresAt(date)
                .build());
        return "redirect:/tasks";
    }

    @SneakyThrows
    @PostMapping("{id}/edit")
    public String editTask(
            @PathVariable(name = "id") Long id,
        @RequestParam(name = "title") String title,
        @RequestParam(name = "text") String text,
        @RequestParam(name = "expiresAt") String expiresAt,
        @RequestParam(name = "importance") Integer status
    ){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Date date = format.parse(expiresAt);
        Task task = taskService.findOne(user, id);
        task.setExpiresAt(date);
        task.setStatus(status);
        task.setText(text);
        task.setTitle(title);
        taskService.save(task);
        return "redirect:/tasks/" + task.getId();
    }

    @PostMapping(value = "{id}/check")
    @ResponseBody
    public void checkTask(
            @PathVariable(value = "id") Long id,
            @RequestParam(name = "checked") int checked
    ){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Task task = taskService.findOne(user, id);
        task.setStatus(checked == 0? 3 : 0);
        taskService.save(task);
    }

    @DeleteMapping(value = "{id}")
    @ResponseBody
    public void deleteTask(@PathVariable(name = "id") Long id){
        User user = (User) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        taskService.delete(taskService.findOne(user, id).getId());
    }
}
