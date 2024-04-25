package ${isXpmTable?then('${packageName}.palmyra','${packageName}')}.model;

import com.palmyralabs.palmyra.base.annotations.PalmyraField;
import com.palmyralabs.palmyra.base.annotations.PalmyraType;
<#list fields as field>
    <#if field["isForeignKey"]!=0 && (field["targetTable"]?starts_with("Xpm") || name?starts_with("Xpm"))>
    	<#if field["targetTable"]?starts_with("Xpm") && !name?starts_with("Xpm")>
import ${packageName}.palmyra.model.${field["targetTable"]}Model;
		<#elseif name?starts_with("Xpm") && !field["targetTable"]?starts_with("Xpm")>
import ${packageName}.model.${field["targetTable"]}Model;
		<#else>
		</#if>
    </#if>
</#list>

<#if fields?has_content>
    <#if fields?filter(field -> field.dataType == "LocalDate")?has_content>
import java.time.LocalDate;
    </#if>
    <#if fields?filter(field -> field.dataType == "LocalDateTime")?has_content>
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
		@PalmyraField(attribute = "${field["code"]}")
		private ${field["targetTable"]}Model ${field["targetTable"]}; 
	<#else>
		@PalmyraField
		private ${field["dataType"]} ${field["code"]};
	
	</#if>
  </#list>
	
}
