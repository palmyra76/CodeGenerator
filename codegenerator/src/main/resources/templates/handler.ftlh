package ${isXpmTable?then('${packageName}.palmyra','${packageName}')}.handler;

import org.springframework.stereotype.Component;

import com.palmyralabs.palmyra.base.annotations.CrudMapping;
import com.palmyralabs.palmyra.handlers.QueryHandler;
import com.palmyralabs.palmyra.handlers.ReadHandler;
import com.palmyralabs.palmyra.handlers.SaveHandler;
import ${isXpmTable?then('${packageName}.palmyra','${packageName}')}.model.${name}Model;
<#if isXpmTable>
import ${packageName}.handler.AbstractHandler;
</#if>

@CrudMapping(mapping = "/${isMstTable?then('master/${convertedName}','${convertedName}')}", type = ${name}Model.class, secondaryMapping = "/${isMstTable?then('master/${convertedName}','${convertedName}')}/{id}")
@Component
public class ${name}Handler extends AbstractHandler implements QueryHandler, ReadHandler, SaveHandler {

}
