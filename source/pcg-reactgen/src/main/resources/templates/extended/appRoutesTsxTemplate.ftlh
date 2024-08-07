import { Navigate, Outlet } from "react-router-dom";
import HomePage from "../pages/home/HomePage";
import UserPage from "../pages/userManagement/user/UserPage";
import UserEditPage from "../pages/userManagement/user/UserEditPage";
import UserViewPage from "../pages/userManagement/user/UserViewPage";
import UserNewPage from "../pages/userManagement/user/UserNewPage";
import GroupPage from "../pages/userManagement/group/GroupPage";
import EditGroupPage from "../pages/userManagement/group/EditGroupPage";
import ViewGroupPage from "../pages/userManagement/group/ViewGroupPage";
import NewGroupPage from "../pages/userManagement/group/NewGroupPage";
<#list tables as key, value> 
 <#if value.convertedName?starts_with("xpm")>
 	<#continue>
 </#if>
import ${value.name}Page from "../components/tables/${value.name}/${value.name}Page";
import ${value.name}NewPage from "../components/tables/${value.name}/${value.name}NewPage";
import ${value.name}ViewPage from "../components/tables/${value.name}/${value.name}ViewPage";
import ${value.name}EditPage from "../components/tables/${value.name}/${value.name}EditPage";
</#list> 

const appRoutes = [
  {
    name: 'index',
    index: true,
    element: <Navigate to="home" replace={true} />,
    state: "index"
  },
  {
    path: "users",
    idProperty: "id"
  },
  {
    path: "home",
    name: "Home",
    element: <HomePage />,
    state: "home"
  },
   <#list tables as key, value> 
   <#if value.convertedName?starts_with("xpm")>
  		<#continue>
  	</#if>
  {
    path: "${key}",
    name: "${value.name}",
    element: <${value.name}Page />,
    state: "${key}"
  },
  {
    path: '${key}/new',
    element: <${value.name}NewPage pageName="${key}" />,
  },
  {
    path: '${key}/view/:id',
    element: <${value.name}ViewPage pageName="${key}" />,
  },
  {
    path: '${key}/edit/:id',
    element: <${value.name}EditPage pageName="${key}" />,
  },
  </#list> 
  {
    path: "admin",
    element: <Outlet />,
    name: "Admin",
    state: "admin",
    children: [
      {
        path: 'userManagement',
        element: <UserPage pageName="userManagement" />,
      },
      {
        path: 'userManagement/edit/:id',
        element: <UserEditPage pageName="userManagement" />,
      },
      {
        path: 'userManagement/view/:id',
        element: <UserViewPage pageName="userManagement" />,
      },
      {
        path: 'userManagement/new',
        element: <UserNewPage pageName="userManagement" />,
      },
      {
        path: 'groups',
        element: <GroupPage />,
      },
      {
        path: 'groups/edit/:id',
        element: <EditGroupPage pageName="groups" />,
      },
      {
        path: 'groups/view/:id',
        element: <ViewGroupPage pageName="groups" />,
      },
      {
        path: 'groups/new',
        element: <NewGroupPage pageName="groups" />,
      }
    ]
  }
];

export default appRoutes;