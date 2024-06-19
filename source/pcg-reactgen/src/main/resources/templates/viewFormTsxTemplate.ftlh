<#assign importLookupView = false>
<#assign importDateView = false>
<#assign importTextView = false>
<#list fields as field>
    <#if field["isForeignKey"] != 0>
        <#assign importLookupView = true>
    <#elseif field["reactDataType"] == "date">
        <#assign importDateView = true>
    <#else>
        <#assign importTextView = true>
    </#if>
</#list>
import { useParams } from 'react-router-dom';
import { FieldGroupContainer, <#if importLookupView>LookupView, </#if><#if importDateView>DateView, </#if><#if importTextView>TextView, </#if> } from "palmyra-rui";;
import { IPageInput } from "../../templates/Types";
import { ServiceEndpoint } from "../../config/ServiceEndpoints";
import { ViewForm } from 'palmyra-template';
import AppStoreFactory from '../wire/StoreFactory';

const ${name}ViewPage = (props: IPageInput) => {

	const params: any = useParams();
	const ${convertedName}EndPoint = ServiceEndpoint.${convertedName}.restApi;
	const store = AppStoreFactory;

	return <div className="user-form-container">
		<ViewForm storeFactory={store} id={params.id} title="View ${name}" pageName={props.pageName}
			options={{ endPoint: ${convertedName}EndPoint }}>
			<div className="palmyra-form-field-container-wrapper">
				<FieldGroupContainer columns={2}>
				<#list fields as field>
				<#if field["isForeignKey"]!=0>
					<LookupView attribute="${field["columnName"]}.${field["targetAttribute"]}" title="${field["splitedName"]}"
						displayAttribute="${field["columnName"]}.${field["targetTableColumn"]}" 
						variant="standard"
					/>
				<#elseif field["reactDataType"] == "date" >
					<DateView attribute="${field["columnName"]}" title="${field["splitedName"]}"
						variant="standard" displayPattern="DD-MM-YYYY"
					/>
				<#else>
					<TextView attribute="${field["columnName"]}" 
						title="${field["splitedName"]}" variant="standard"
					/>
				</#if>
				</#list>     
				</FieldGroupContainer>
			</div>
		</ViewForm>
	</div>
}

export default ${name}ViewPage;