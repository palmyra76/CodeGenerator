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
import ApplicationPage from "../pages/application/ApplicationPage";
import ApplicationChartsPage from "../pages/applicationCharts/ApplicationChartsPage";
import ApplicationNewPage from "../pages/application/ApplicationNewPage";
import ApplicationViewPage from "../pages/application/ApplicationViewPage";
import ApplicationEditPage from "../pages/application/ApplicationEditPage";

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
  {
    path: "application",
    name: "Application",
    element: <ApplicationPage />,
    state: "application"
  },
  {
    path: 'application/new',
    element: <ApplicationNewPage pageName="application" />,
  },
  {
    path: 'application/view/:id',
    element: <ApplicationViewPage pageName="application" />,
  },
  {
    path: 'application/edit/:id',
    element: <ApplicationEditPage pageName="application" />,
  },
  {
    path: "applicationCharts/:id",
    name: "Application Charts",
    element: <ApplicationChartsPage />,
    state: "applicationCharts"
  },
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