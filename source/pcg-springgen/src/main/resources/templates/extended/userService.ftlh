package ${packageName}.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import ${packageName}.entity.MenuEntity;
import ${packageName}.entity.UserEntity;
import ${packageName}.repo.UserRepository;
import ${packageName}.security.config.LoginResponse;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public Optional<UserEntity> findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public void setLoginNameAndDisplayPage(String email, String loginName, MenuEntity displayPage) {
        Optional<UserEntity> userOptional = userRepository.findByEmail(email);
        userOptional.ifPresent(user -> {
            user.setLoginName(loginName);
            user.setDisplayPage(displayPage);
            userRepository.save(user);
        });
    }

    public LoginResponse getLoginNameAndDisplayPage(String email) {
        Optional<UserEntity> userOptional = userRepository.findUserByLoginName(email);
        if (userOptional.isPresent()) {
            UserEntity user = userOptional.get();
            LoginResponse loginResponse = new LoginResponse();
            loginResponse.setLoginName(user.getLoginName());
            if (null != user.getHomeCustom() && user.getHomeCustom().length() > 0)
                loginResponse.setDisplayPage(user.getHomeCustom());
            else if(null != user.getDisplayPage())    
                loginResponse.setDisplayPage(user.getDisplayPage().getCode());
            return loginResponse;
        }
        return null;
    }
}


