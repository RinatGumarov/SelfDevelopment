package ru.innopolis.rinatgumarov.selfdevelopment.service;

import ru.innopolis.rinatgumarov.selfdevelopment.model.Task;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;

import java.util.List;

public interface TaskService {
    void save(Task task);

    List<Task> findAllByUser(User user);

    Task findOne(User user, Long id);

    List<Task> findAllByUserUndone(User user);

    void delete(Long id);
}
