<#assign importServerLookup = false>
<#assign importNumberField = false>
<#assign importDatePicker = false>
<#assign importTextField = false>
<#list fields as field>
	<#if field["columnName"] == "id" || field["columnName"] == "createdBy" || field["columnName"] == "createdOn" || field["columnName"] == "lastUpdBy" || field["columnName"] == "lastUpdOn">
	<#continue>
	</#if>
    <#if field["foreignKey"] != 0>
        <#assign importServerLookup = true>
    <#elseif field["reactDataType"] == "number">
        <#assign importNumberField = true>
    <#elseif field["reactDataType"] == "date">
        <#assign importDatePicker = true>
    <#else>
        <#assign importTextField = true>
    </#if>
</#list>
import { useParams } from 'react-router-dom';
import { FieldGroupContainer, <#if importServerLookup>ServerLookup, </#if><#if importNumberField>NumberField, </#if><#if importDatePicker>DatePicker, </#if><#if importTextField>TextField </#if> } from "../../../components/form";
import { IPageInput } from "../../../templates/Types";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { EditForm } from '@palmyralabs/template-stine';

const ${name}EditPage = (props: IPageInput) => {

	const params: any = useParams();
	const ${convertedName}EndPoint = ServiceEndpoint.${convertedName}.restApi;

	return <div className="user-form-container">
		<EditForm id={params.id} title="Edit ${splitedName}" pageName={props.pageName}
			options={{ endPoint: ${convertedName}EndPoint }}>
			<div className="palmyra-form-field-container-wrapper">
				<FieldGroupContainer columns={2}>
				<#list fields as field>
				<#if field["columnName"] == "id" || field["columnName"] == "createdBy" || field["columnName"] == "createdOn" || field["columnName"] == "lastUpdBy" || field["columnName"] == "lastUpdOn">
				<#continue>
				</#if>
				<#if field["foreignKey"]!=0>
					<ServerLookup attribute="${field["columnName"]}" title="${field["splitedColumnName"]}"
						placeholder="Select ${field["splitedColumnName"]}" 
						queryOptions={{ endPoint: ServiceEndpoint.${field["targetTable"]}.restApi }} <#if field["mandatory"]>required</#if>
						lookupOptions={{ idAttribute: '${field["targetAttribute"]}', labelAttribute: '${field["targetTableColumn"]}' }}
					/>
				<#elseif field["reactDataType"] == "number" >
					<NumberField attribute="${field["columnName"]}"  
						title="${field["splitedColumnName"]}"  variant="standard" <#if field["mandatory"]>required</#if>
					/>
				<#elseif field["reactDataType"] == "date" >
					<DatePicker attribute="${field["columnName"]}" title="${field["splitedColumnName"]}"
						variant="standard" displayPattern="DD-MM-YYYY" <#if field["mandatory"]>required</#if>
					></DatePicker>
				<#else>
					<TextField attribute="${field["columnName"]}" 
						title="${field["splitedColumnName"]}" variant="standard"
						validRule={"string"} <#if field["mandatory"]>required</#if>
					/>
				</#if>
				</#list>     
				</FieldGroupContainer>
			</div>
		</EditForm>
	</div>
}

export default ${name}EditPage;