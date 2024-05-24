package ${packageName}.handler;

import org.springframework.stereotype.Component;

import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.handlers.QueryHandler;
import com.palmyralabs.palmyra.handlers.ReadHandler;
import com.palmyralabs.palmyra.handlers.SaveHandler;
import ${packageName}.model.UserTypeModel;

@CrudMapping(mapping = "/userType", type = UserTypeModel.class, secondaryMapping = "/userType/{id}")
@Component
public class UserTypeHandler extends AbstractHandler implements QueryHandler, ReadHandler, SaveHandler {

}