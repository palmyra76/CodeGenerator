import { useRef } from "react";
import { CellGetter, ColumnDefinition, GridCustomizer, IPageQueryable, IPagination, gridColumnCustomizer } from "palmyra-rui";
import { ServiceEndpoint } from "../../config/ServiceEndpoints";
import { SummaryGrid } from "palmyra-template";
import AppStoreFactory from "../wire/StoreFactory";

const ${name}Page = () => {
    const gridRef = useRef<IPageQueryable>(null);
    const endPoint = ServiceEndpoint.${convertedName}.restApi;
    const store = AppStoreFactory;

    const fields: ColumnDefinition[] = [
<#list fields as field>
{
            attribute: "${field.columnName}",
            name: "${field.columnName}",
            title:"${field.columnName}",
            type: "${field.reactDataType}"
        }<#if field_has_next>,</#if>
</#list>
];
        
   
   
    return (
        <div>
            <SummaryGrid storeFactory={store} errorText={errorText}
                fields={fields} pageName="${name}" customizer={gridCustomizer}
                title="${name}" gridRef={gridRef}
                options={{ endPoint: endPoint }} />
        </div>
    )
}

export default ${name}Page;

