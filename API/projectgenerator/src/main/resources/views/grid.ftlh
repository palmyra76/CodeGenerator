import { FC } from "react";
import SummaryDrawerGrid from "../../../../templates/default/grid/SummaryDrawerGrid";
import { FieldGroupContainer, TextField } from "../../../../components/form";

function ${name}SummaryGrid(props: IPageInput) {
    const fields: ColumnDefinition[] = [
        <#list fields as field>
        {
            attribute: "${field.code}",
            name: "${field.columnName}",
            title: "${field.columnName}",
            type: "${field.dataType}"
        }<#if field_has_next>,</#if>
        </#list>
    ];

    const Formlet: FC = () => <>
        <div className="drawer-form-field-container">
            <FieldGroupContainer>
                <#list fields as field>
                <TextField attribute="${field.code}" title="${field.columnName}"
                    validationRule={"string"} variant="standard" required={true} />
                </#list>
            </FieldGroupContainer>
        </div>
    </>;

    return (
        <SummaryDrawerGrid EditFormlet={Formlet} NewFormlet={Formlet}
            fields={fields} pageName='${name}'
            title="${name}"
            options={{ endPoint: '${convertedName}' }} />
    );
}
export default ${name}SummaryGrid;
