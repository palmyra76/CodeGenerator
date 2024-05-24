package ${packageName}.handler;

import java.util.Map;

import org.springframework.stereotype.Component;

import ${packageName}.model.UserManagementModel;
import com.palmyralabs.palmyra.base.FilterCriteria;
import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.handlers.CreateHandler;
import com.palmyralabs.palmyra.handlers.HandlerContext;
import com.palmyralabs.palmyra.handlers.QueryHandler;
import com.palmyralabs.palmyra.handlers.ReadHandler;
import com.palmyralabs.palmyra.handlers.UpdateHandler;
import com.zitlab.palmyra.store.Tuple;
import com.zitlab.palmyra.store.base.security.ACLRights;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
@CrudMapping(mapping = "/userManagement", type = UserManagementModel.class, secondaryMapping = "/userManagement/{id}")
public class UserManagementHandler implements QueryHandler, ReadHandler, CreateHandler, UpdateHandler {

    public void aclCheck(FilterCriteria criteria, Map<String, String> map) {

    }

    @Override
    public Tuple preCreate(Tuple tuple, HandlerContext ctx) {
        if (tuple.hasAttribute("email"))
            tuple.set("loginName", tuple.get("email"));
        return CreateHandler.super.preCreate(tuple, ctx);
    }

    @Override
    public int aclCheck(Tuple item, HandlerContext ctx) {
        return ACLRights.ALL;
    }
}
