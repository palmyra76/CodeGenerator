import { useRef } from "react";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { ColumnDefinition, IPageQueryable } from "@palmyralabs/rt-forms";
import { SummaryGrid } from "@palmyralabs/template-stine";

const ${name}Page = () => {
    const gridRef = useRef<IPageQueryable>(null);
    const endPoint = ServiceEndpoint.${convertedName}.restApi;

    const fields: ColumnDefinition[] = [
<#list fields as field>
	<#if field["primaryKey"]  || field["columnName"] == "createdBy" || field["columnName"] == "createdOn" || field["columnName"] == "lastUpdBy" || field["columnName"] == "lastUpdOn">
	<#continue>
	</#if>
<#if field["foreignKey"]!=0>
	{
		attribute: "${field["columnName"]}.${field["targetTableColumn"]}",
		name: "${field.columnName}",
		label:"${field.splitedColumnName}",
		searchable: true,
      	sortable: true,
      	<#if field.targetColumnReactType == "date">
      	serverPattern: 'DD-MM-YYYY',
		displayPattern: 'DD-MM-YYYY', 
		</#if>
		type: "${field.targetColumnReactType}"
	}<#if field_has_next>,</#if>
<#else>
	{
		attribute: "${field.columnName}",
		name: "${field.columnName}",
		label:"${field.splitedColumnName}",
		searchable: true,
      	sortable: true,
      	<#if field.reactDataType == "date">
      	serverPattern: 'DD-MM-YYYY',
		displayPattern: 'DD-MM-YYYY', 
		</#if>
		type: "${field.reactDataType}"
	}<#if field_has_next>,</#if>
</#if>
</#list>
];
        
   
   
    return (
        <div>
            <SummaryGrid pageSize={[15,30,45]}
                columns={fields} pageName="${name}" 
                title="${splitedName}" gridRef={gridRef}
                options={{ endPoint: endPoint }} />
        </div>
    )
}

export default ${name}Page;

