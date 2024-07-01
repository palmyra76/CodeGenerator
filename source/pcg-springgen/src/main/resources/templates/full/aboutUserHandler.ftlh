package ${packageName}.handler;

import java.util.Date;

import org.springframework.stereotype.Component;

import ${packageName}.model.UserTypeModel;
import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.base.annotations.PalmyraField;
import com.palmyralabs.palmyra.base.annotations.PalmyraType;
import com.palmyralabs.palmyra.base.exception.EndPointForbiddenException;
import com.palmyralabs.palmyra.handlers.HandlerContext;
import com.palmyralabs.palmyra.handlers.ReadHandler;
import com.zitlab.palmyra.sqlbuilder.condition.Criteria;
import com.zitlab.palmyra.store.QueryFilter;
import com.zitlab.palmyra.store.base.exception.Validation;
import com.zitlab.palmyra.store.base.security.AuthProvider;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RequiredArgsConstructor
@CrudMapping(mapping = "/user/about", type = AuthenticationUserModel.class)
@Component
public class AboutUserHandler implements ReadHandler {
	private final AuthProvider userProvider;

	@Override
	public QueryFilter applyFilter(QueryFilter filter, HandlerContext ctx) {
		String loginName = userProvider.getUser();
		if(null == loginName || loginName.equalsIgnoreCase("anonymousUser")) {
			throw new EndPointForbiddenException(Validation.OTHERS, "Not Authenticated");
		}
		filter.addCondition(Criteria.EQ("loginName", loginName));
		return filter;
	}

}




@Getter
@Setter
@PalmyraType(type = "XpmUser")
class AuthenticationUserModel {

	@PalmyraField
	private Integer id;
	
	@PalmyraField
	private String loginName;
	
	@PalmyraField
	private String displayName;
	
	@PalmyraField
	private String email;
	
	@PalmyraField
	private String gender;

	@PalmyraField(pattern = "dd-MM-yyyy")
	private Date dob;
	
	@PalmyraField
	private UserTypeModel userType;
	
	@PalmyraField
	private String firstName;
	
	@PalmyraField
	private String lastName;
	
	@PalmyraField
	private String phoneNumber;
	
	@PalmyraField
	private String address;

}