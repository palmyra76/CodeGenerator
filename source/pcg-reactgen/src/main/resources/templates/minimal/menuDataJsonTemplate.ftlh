<#assign id = [] />
{
    "result": [
        {
            "parent": null,
			"code": "home",
			"children": null,
			"name": "Home",
			"action": "summary",
			"id": 1
        },
        <#list tables?values?sort_by("splitedName") as value> 
  			<#if value.convertedName?starts_with("xpm")>
  					<#continue>
  			</#if>
  		<#assign newId = 3 + (value?index)>
  		{
  			"parent": 2,
  			"code": "${value.convertedName}",
  			"children": null,
   			"name": "${value.splitedName}",
       		"action": "summary",
       		"id": ${newId}
    	},
    	<#assign id = id + [newId]>
  		</#list> 
        {
        	"parent": null,
			"code": "masterdata",
			"children": "<#list id as i>${i}<#if i_has_next>,</#if></#list>",
			"name": "Master Data",
			"action": "summary",
			"id": 2
        }
    ],
    "limit": 44,
    "offset": 0,
    "total": 0
}