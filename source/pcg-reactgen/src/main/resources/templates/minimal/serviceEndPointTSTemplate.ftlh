import { IEndPoint } from "palmyra-rui"

interface IPageApiRef {
    restApi: IEndPoint
    lookup?: Record<string, IEndPoint>,
}

interface IServerApiConfig extends IPageApiRef {

}

const ServiceEndpoint = {
    userManagement: {
        users: { restApi: '/userManagement' },
        userProfileApi: '/user/about',
        usersById: { restApi: '/userManagement/{id}' },
        lookup: {
            userType: '/userType',
        }
    },
    <#list tables as key, value> 
    ${key}: {
        restApi: '/${key}',
        byId: '/${key}/{id}'
    }<#if key_has_next>,</#if>
	</#list> 
}


export { ServiceEndpoint }
export type { IPageApiRef, IServerApiConfig }