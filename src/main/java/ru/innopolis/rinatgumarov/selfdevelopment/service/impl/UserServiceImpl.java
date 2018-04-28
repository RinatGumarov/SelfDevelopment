package ru.innopolis.rinatgumarov.selfdevelopment.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;
import ru.innopolis.rinatgumarov.selfdevelopment.repository.UserRepository;
import ru.innopolis.rinatgumarov.selfdevelopment.service.UserService;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private static final int PAGE_SIZE = 10;

    private static final PasswordEncoder encoder = new BCryptPasswordEncoder();
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void save(User user) {
        user.setPassword(encoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Override
    public User findById(long id) {
        return userRepository.findOne(id);
    }

    @Override
    public void changeUserPassword(User user, final String password) {
        user.setPassword(encoder.encode(password));
        userRepository.save(user);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findByLogin(String login) {
        return userRepository.findByLogin(login);
    }

}
