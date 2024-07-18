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
];

export default appRoutes;