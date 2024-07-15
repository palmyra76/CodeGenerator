import axios from 'axios';
import { routes } from "./routes";
import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import { MainLayout } from './layout/mainLayout/MainLayout';
import './style/layout/RuiLayout.css';
import './style/layout/layoutColors.css';
import './style/themes/blue/Colors.css';
import './style/themes/colorDef.css'
import './style/layout/Layout.css'
import LoginPage from './pages/login/LoginPage';
import { toast } from 'react-toastify';

axios.defaults.baseURL = "/";
const goToLogin = () => {
  window.location.href = "/login";
}
const showServerErrorToast = () => {
  toast.error("Server problem.. Please try again later");
};
axios.interceptors.response.use(
  response => {
    return response;
  },
  error => {
    if (error.config.headers['X-Skip-Interceptor'] === 'true') {
      return Promise.reject(error);
    }
    if (error.response && error.response.status === 401 || error.response.status === 403) {
      toast.error("Your session may have expired. Please Login to continue.",
        {
          position: "top-right",
          autoClose: 5000,
          hideProgressBar: false,
          closeOnClick: true,
          pauseOnHover: true,
          draggable: true,
          progress: undefined,
          theme: "light",
          bodyClassName: "toast-with-button",
          closeButton: false,
          onClick: goToLogin,
          onClose: () => {
            window.location.href = "/login";
          }
        })
    } else if (error.response && error.response.status === 500) {
      showServerErrorToast();
    }
    return Promise.reject(error);
  }
);

function App() {

  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Navigate to="/login" replace={true} />} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/app" element={<MainLayout />}>
            {routes}
          </Route>
        </Routes>
      </BrowserRouter >
    </>
  )
}

export default App;