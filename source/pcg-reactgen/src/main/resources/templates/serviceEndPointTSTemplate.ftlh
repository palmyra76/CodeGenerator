import { IEndPoint } from "palmyra-rui"

interface IPageApiRef {
    restApi: IEndPoint
    lookup?: Record<string, IEndPoint>,
}

interface IServerApiConfig extends IPageApiRef {

}

const ServiceEndpoint = {
    aclmgmt: {
        group: '/admin/acl/group',
        groupById: '/admin/acl/group/{id}',
        GroupsByUser: {
            restApi: "/admin/acl/group/{groupId}/users",
            deleteApi: "/admin/acl/group/{groupId}/user/{userId}",
            lookup: {
                restApi: '/admin/acl/group/{groupId}/users/lookup'
            }
        },
        UsersByGroup: {
            restApi: "/admin/acl/user/{userId}/groups",
            deleteApi: "/admin/acl/user/{userId}/group/{groupId}",
            lookup: {
                restApi: '/admin/acl/user/{userId}/groups/lookup'
            }
        },
        menuApi: {
            aclMenuEditorApi: '/admin/acl/group/{groupId}/menuList',
            aclPutMenuEditorApi: '/admin/acl/group/{groupId}',
            sideMenuApi: '/acl/menu/listAll',
            lookup: {
                menuApi: '/acl/menu'
            }
        }
    },
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