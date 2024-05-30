package ${packageName}.model;

import com.palmyralabs.palmyra.base.annotations.PalmyraField;
import com.palmyralabs.palmyra.base.annotations.PalmyraType;

<#if fields?has_content>
    <#if fields?filter(field -> field.javaDataType == "LocalDate")?has_content>
import java.time.LocalDate;
    </#if>
    <#if fields?filter(field -> field.javaDataType == "LocalDateTime")?has_content>
import java.time.LocalDateTime;
    </#if>
</#if>

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@PalmyraType(type = "${name}")
public class ${name}Model {
  <#list fields as field>
  
	<#if field["isForeignKey"]!=0>
		@PalmyraField(attribute = "${field["columnName"]}")
		private ${field["targetTable"]}Model ${field["targetTable"]}; 
	<#else>
		@PalmyraField
		private ${field["javaDataType"]} ${field["columnName"]};
	
	</#if>
  </#list>
	
}
