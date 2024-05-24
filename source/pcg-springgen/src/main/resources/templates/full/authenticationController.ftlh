package ${packageName}.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextHolderStrategy;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.palmyralabs.palmyra.ext.usermgmt.exception.UnAuthorizedException;
import com.palmyralabs.palmyra.ext.usermgmt.model.ChangePasswordRequest;
import com.palmyralabs.palmyra.ext.usermgmt.model.LoginRequest;
import com.palmyralabs.palmyra.ext.usermgmt.model.ResetPasswordRequest;
import com.palmyralabs.palmyra.ext.usermgmt.security.LocalDBAuthenticationProvider;
import com.palmyralabs.palmyra.ext.usermgmt.service.PasswordMgmtService;
import com.zitlab.palmyra.store.base.security.AuthProvider;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AuthenticationController extends BaseController {
	private final SecurityContextRepository securityContextRepository;
	private SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
	private final LocalDBAuthenticationProvider authenticationManager;
	private final AuthProvider userProvider;
	private final PasswordMgmtService passwordService;
	private SecurityContextHolderStrategy securityContextHolderStrategy = SecurityContextHolder
			.getContextHolderStrategy();

	@PostMapping("/auth/login")
	public void login(@RequestBody LoginRequest loginRequest, HttpServletRequest request,
			HttpServletResponse response) {
		UsernamePasswordAuthenticationToken token = UsernamePasswordAuthenticationToken
				.unauthenticated(loginRequest.getUserName(), loginRequest.getPassword());
		Authentication authentication = authenticationManager.authenticate(token);
		if (authentication.isAuthenticated()) {
			SecurityContext context = securityContextHolderStrategy.createEmptyContext();
			context.setAuthentication(authentication);
			securityContextHolderStrategy.setContext(context);
			securityContextRepository.saveContext(context, request, response);
		} else {
			throw new UnAuthorizedException("USER001", "Invalid Credientials");
		}
	}

	@GetMapping("/auth/logout")
	public void logout(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		this.logoutHandler.logout(request, response, authentication);
	}

	@PostMapping("/user/changePassword")
	public ResponseEntity<Void> ChangePassword(@RequestBody ChangePasswordRequest changePwdRequest) {
		if (isCurrentUser(changePwdRequest) && passwordService.changePassword(changePwdRequest)) {
			return ok();
		} else {
			return unauthorized();
		}
	}

	@PostMapping("/admin/resetPassword")
	public ResponseEntity<Void> ResetPassword(@RequestBody ResetPasswordRequest changePwdRequest) {
		if (isAdminUser() && passwordService.resetPassword(changePwdRequest)) {
			return ok();
		} else {
			return unauthorized();
		}
	}

	private boolean isAdminUser() {
		// TODO add role-check here
		return true;
	}

	private boolean isCurrentUser(ChangePasswordRequest changePwdRequest) {
		return userProvider.getUser().equalsIgnoreCase(changePwdRequest.getLoginName());
	}
}