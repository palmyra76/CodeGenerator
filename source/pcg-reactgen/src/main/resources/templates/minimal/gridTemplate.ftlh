import { useRef } from "react";
import { ColumnDefinition, IPageQueryable, } from "palmyra-rui";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { SummaryGrid } from "palmyra-template";
import AppStoreFactory from "../../wire/StoreFactory";

const ${name}Page = () => {
    const gridRef = useRef<IPageQueryable>(null);
    const endPoint = ServiceEndpoint.${convertedName}.restApi;
    const store = AppStoreFactory;

    const fields: ColumnDefinition[] = [
<#list fields as field>
	<#if field["primaryKey"]  || field["columnName"] == "createdBy" || field["columnName"] == "createdOn" || field["columnName"] == "lastUpdBy" || field["columnName"] == "lastUpdOn">
	<#continue>
	</#if>
<#if field["foreignKey"]!=0>
	{
		attribute: "${field["columnName"]}.${field["targetTableColumn"]}",
		name: "${field.columnName}",
		title:"${field.splitedColumnName}",
		searchable: true,
      	sortable: true,
		type: "${field.targetColumnReactType}"
	}<#if field_has_next>,</#if>
<#else>
	{
		attribute: "${field.columnName}",
		name: "${field.columnName}",
		title:"${field.splitedColumnName}",
		searchable: true,
      	sortable: true,
		type: "${field.reactDataType}"
	}<#if field_has_next>,</#if>
</#if>
</#list>
];
        
   
   
    return (
        <div>
            <SummaryGrid storeFactory={store} pagination={[15,30,45]}
                fields={fields} pageName="${name}" 
                title="${splitedName}" gridRef={gridRef}
                options={{ endPoint: endPoint }} />
        </div>
    )
}

export default ${name}Page;

