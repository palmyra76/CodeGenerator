import { MenuDef } from "palmyra-rui";

interface AppMenu extends MenuDef {
    userGroup?: string[]
}

const MasterDataMenu: AppMenu[] = [
 <#list tables as key, value> 
  {
   		name: "${value.splitedName}",
        title: "${value.splitedName}",
        path: "${value.name}"
    }<#if key?has_next>,</#if>
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