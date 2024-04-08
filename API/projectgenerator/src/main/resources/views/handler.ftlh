package ${packageName}.handler;

import org.springframework.stereotype.Component;

import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.handlers.QueryHandler;
import com.palmyralabs.palmyra.handlers.ReadHandler;
import com.palmyralabs.palmyra.handlers.SaveHandler;
import com.palmyralabs.${database.name}.model.${name}Model;

@CrudMapping(mapping = "/${convertedName}", type = ${name}Model.class, secondaryMapping = "/${convertedName}/{id}")
@Component
public class ${name}Handler extends AbstractHandler implements QueryHandler, ReadHandler, SaveHandler {

}
