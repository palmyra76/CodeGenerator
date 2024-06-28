<#assign importServerLookup = false>
<#assign importNumberField = false>
<#assign importDatePicker = false>
<#assign importTextField = false>
<#list fields as field>
    <#if field["isForeignKey"] != 0>
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
import { FieldGroupContainer, <#if importServerLookup>ServerLookup, </#if><#if importNumberField>NumberField, </#if><#if importDatePicker>DatePicker, </#if><#if importTextField>TextField, </#if> } from "../../../components/form";
import { IPageInput } from "../../../templates/Types";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { EditForm } from 'palmyra-template';
import AppStoreFactory from '../../wire/StoreFactory';

const ${name}EditPage = (props: IPageInput) => {

	const params: any = useParams();
	const ${convertedName}EndPoint = ServiceEndpoint.${convertedName}.restApi;
	const store = AppStoreFactory;

	return <div className="user-form-container">
		<EditForm storeFactory={store} id={params.id} title="New ${name}" pageName={props.pageName}
			options={{ endPoint: ${convertedName}EndPoint }}>
			<div className="palmyra-form-field-container-wrapper">
				<FieldGroupContainer columns={2}>
				<#list fields as field>
				<#if field["columnName"]=="createdBy" || field["columnName"]=="createdOn" || field["columnName"]=="lastUpdBy" || field["columnName"]=="lastUpdOn">
				<#continue>
				</#if>
				<#if field["isForeignKey"]!=0>
					<ServerLookup attribute="${field["columnName"]}.${field["targetAttribute"]}" title="${field["splitedName"]}"
						placeHolder="Select ${field["splitedName"]}"
						storeOptions={{ endPoint: ServiceEndpoint.${field["targetTable"]}.restApi }} <#if field["mandatory"]>required</#if>
						lookupOptions={{ idAttribute: '${field["targetAttribute"]}', displayAttribute: '${field["targetTableColumn"]}' }}
					/>
				<#elseif field["reactDataType"] == "number" >
					<NumberField attribute="${field["columnName"]}"  
						title="${field["splitedName"]}"  variant="standard" <#if field["mandatory"]>required</#if>
					/>
				<#elseif field["reactDataType"] == "date" >
					<DatePicker attribute="${field["columnName"]}" title="${field["splitedName"]}"
						variant="standard" displayPattern="DD-MM-YYYY" <#if field["mandatory"]>required</#if>
					></DatePicker>
				<#else>
					<TextField attribute="${field["columnName"]}" 
						title="${field["splitedName"]}" variant="standard"
						validationRule={"string"} <#if field["mandatory"]>required</#if>
					/>
				</#if>
				</#list>     
				</FieldGroupContainer>
			</div>
		</EditForm>
	</div>
}

export default ${name}EditPage;