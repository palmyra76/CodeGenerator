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
    userApplicationByUser: {
        restApi: "/user/{userId}/applications",
        deleteApi: "/user/{userId}/application/{applicationId}",
        lookup: {
            restApi: "/user/{userId}/applications/lookup"
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
    application: {
        restApi: '/user/applications',
        byId: '/user/applications/{id}'
    },
    server: {
        restApi: '/server'
    },
    dashboard: {
        lookup: {
            server: '/lookup/getServer/{applicationId}'
        },
        charts: {
            responseTime: '/chart/responseTime',
            mostUsedApi: '/chart/mostUsedApi',
            highResponseTimeApi: '/chart/highResponseTime',
            concurrency: '/chart/concurrency'
        }
    },
    applicationDetails: {
        getAllApplication: '/applicationDetails/getAllApplications'
    },
    apiResponseTime: {
        byApplicationId: '/api/responseTime/byApplicationId/{applicationId}'
    }
}


export { ServiceEndpoint }
export type { IPageApiRef, IServerApiConfig }