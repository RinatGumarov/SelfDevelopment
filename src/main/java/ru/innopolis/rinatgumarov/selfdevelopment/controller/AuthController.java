package ru.innopolis.rinatgumarov.selfdevelopment.controller;

import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.innopolis.rinatgumarov.selfdevelopment.model.User;
import ru.innopolis.rinatgumarov.selfdevelopment.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AuthController {
    private static final PasswordEncoder encoder = new BCryptPasswordEncoder();
    private final UserService userService;

    @Autowired
    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = "/login")
    public String getLoginPage
            (Model model,
             @RequestParam(value = "error", required = false) Boolean error) {
        if (Boolean.TRUE.equals(error)) {
            model.addAttribute("error", error);
        }
        return "login";
    }

    @GetMapping(value = "/register")
    public String getRegistrationPage() {
        return "register";
    }

    @PostMapping(value = "/register")
    public String register(
            HttpServletRequest request,
            @RequestParam(name = "password") String password,
            @RequestParam(name = "passwordRepeat") String passwordRepeat,
            @RequestParam(name = "login") String login,
            Model model
    ) throws ServletException {
        if (userService.findByLogin(login) != null) {
            model.addAttribute("error", "Login is already taken by another user");
            return "register";
        }
        if (!password.equals(passwordRepeat)) {
            model.addAttribute("error", "Passwords doesn't match");
            return "register";
        }
        userService.save(User.builder()
                .login(login)
                .password(password)
                .build());
        request.login(login, password);
        return "redirect:/tasks";
    }
}
