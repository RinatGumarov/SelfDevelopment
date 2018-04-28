package ru.innopolis.rinatgumarov.selfdevelopment.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import ru.innopolis.rinatgumarov.selfdevelopment.security.AuthProviderImpl;


@Configuration
@EnableWebSecurity
@ComponentScan("ru.innopolis.rinatgumarov.selfdevelopment.security")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static SessionRegistry sessionRegistry = new SessionRegistryImpl();
    private final AuthProviderImpl authProvider;
    private final AccessDeniedHandler accessDeniedHandler;

    @Autowired
    public SecurityConfig(AuthProviderImpl authProvider, AccessDeniedHandler accessDeniedHandler) {
        this.authProvider = authProvider;
        this.accessDeniedHandler = accessDeniedHandler;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.authorizeRequests()
                .antMatchers("/login", "/register").anonymous()
                .antMatchers("/tasks**").authenticated();

        http.csrf().disable()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .usernameParameter("login")
                .passwordParameter("password")
                .defaultSuccessUrl("/tasks", true)
                .failureUrl("/login?error=true")
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/")
                .and()
                .exceptionHandling()
                .accessDeniedHandler(accessDeniedHandler);

        http.sessionManagement().maximumSessions(1).sessionRegistry(sessionRegistry).expiredUrl("/login");
    }

    @Bean(name = "sessionRegistry")
    public SessionRegistry sessionRegistry() {
        return sessionRegistry;
    }

    @Bean
    public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() {
        return new ServletListenerRegistrationBean<HttpSessionEventPublisher>(new HttpSessionEventPublisher());
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authProvider);
    }
}