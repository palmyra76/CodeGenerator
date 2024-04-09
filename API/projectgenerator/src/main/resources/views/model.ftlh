package ${packageName}.model;

import com.palmyralabs.palmyra.base.annotations.PalmyraField;
import com.palmyralabs.palmyra.base.annotations.PalmyraType;
	<#list fields as field>
		<#if field["isForeignKey"]!=0>
import ${packageName}.model.${field["targetTable"]}Model;	
		</#if>
		<#if field["dataType"]=="LocalDate">
import java.time.LocalDate;
		</#if>
		<#if field["dataType"]=="LocalDateTime">
import java.time.LocalDateTime;
		</#if>
	</#list>

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
