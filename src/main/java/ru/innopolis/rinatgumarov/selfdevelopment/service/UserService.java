package ru.innopolis.rinatgumarov.selfdevelopment.service;

import ru.innopolis.rinatgumarov.selfdevelopment.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findById(long id);

    User findByLogin(String login);

    void changeUserPassword(final User user, final String password);

    List<User> findAll();
}
