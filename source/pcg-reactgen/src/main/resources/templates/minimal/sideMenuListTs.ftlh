import { MenuDef } from "palmyra-rui";

interface AppMenu extends MenuDef {
    userGroup?: string[]
}

const MasterDataMenu: AppMenu[] = [
 <#list tables?values?sort_by("splitedName") as value> 
  <#if value.convertedName?starts_with("xpm")>
  	<#continue>
  </#if>
  {
   		name: "${value.splitedName}",
        title: "${value.splitedName}",
        path: "${value.convertedName}"
    }<#if value?has_next>,</#if>
  </#list> 
]

var mainMenu: AppMenu[] = [
    {
        name: "Home",
        title: "Home",
        path: "home",
    },
    {
        name: "Master Data",
        title: "Master Data",
        children: MasterDataMenu,
    }
    
];


export { mainMenu as MenuList };