package ${packageName}.handler;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.palmyralabs.palmyra.base.FilterCriteria;
import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.handlers.QueryHandler;
import ${packageName}.model.AclMenuModel;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@CrudMapping(mapping = "/acl/menu", type = AclMenuModel.class)
@Component
public class AclMenuHandler implements QueryHandler {
	public void aclCheck(FilterCriteria criteria, Map<String, String> map) {

	}
}