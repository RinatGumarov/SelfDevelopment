package ru.innopolis.rinatgumarov.selfdevelopment.service.impl;

import org.springframework.stereotype.Service;
import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;
import ru.innopolis.rinatgumarov.selfdevelopment.repository.TaskRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.service.TaskService;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    private final TaskRepository taskRepository;

    public TaskServiceImpl(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @Override
    public void save(Task task) {
        taskRepository.save(task);
    }

    @Override
    public List<Task> findAllByUser(User user) {
        return taskRepository.findAllByUserOrderByStatusDescCreatedAtDesc(user);
    }

    @Override
    public Task findOne(User user, Long id) {
        return taskRepository.findByUserAndId(user, id);
    }

    @Override
    public List<Task> findAllByUserUndone(User user) {
        return taskRepository.findAllByUserAndStatusGreaterThanOrderByStatusDescCreatedAtDesc(user, 0);
    }

    @Override
    public void delete(Long id) {
        taskRepository.delete(id);
    }
}
