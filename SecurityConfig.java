package config;

import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Collection;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserService userService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors(withDefaults())
                .csrf(csrf -> csrf.disable())
                .authorizeRequests(requests -> requests
                        .antMatchers("/", "/login", "/register").permitAll() // Izinkan akses tanpa autentikasi
                        .antMatchers("/admin/**").hasRole("ADMIN") // Hanya ADMIN yang bisa akses
                        .antMatchers("/school/**").hasRole("SCHOOL") // Hanya SCHOOL yang bisa akses
                        .antMatchers("/student/**").hasRole("STUDENT") // Hanya STUDENT yang bisa akses
                        .anyRequest().authenticated())
                .formLogin(login -> login
                        
                        .successHandler((request, response, authentication) -> {
                            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
                            System.out.println("Authenticated User: " + authentication.getName());
                            authorities.forEach(auth -> System.out.println("Authority: " + auth.getAuthority()));

                            if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_ADMIN"))) {
                                response.sendRedirect("/admin/dashboard");
                            } else if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_SCHOOL"))) {
                                response.sendRedirect("/school/dashboard");
                            } else if (authorities.stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_STUDENT"))) {
                                response.sendRedirect("/student/dashboard");
                            } else {
                                response.sendRedirect("/home");
                            }
                        })
                        .failureUrl("/login?error=true") // Redirect jika login gagal
                        .permitAll())
                .logout(logout -> logout
                        .logoutSuccessUrl("/login") // Redirect setelah logout
                        .invalidateHttpSession(true) // Menghapus session
                        .deleteCookies("JSESSIONID")); // Menghapus cookies
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder(); // Bean untuk password encoder
    }
}