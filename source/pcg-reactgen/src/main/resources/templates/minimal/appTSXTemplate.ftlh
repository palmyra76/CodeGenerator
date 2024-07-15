import axios from 'axios';
import { routes } from "./routes";
import { BrowserRouter, Navigate, Route, Routes } from "react-router-dom";
import { MainLayout } from './layout/mainLayout/MainLayout';
import './style/layout/RuiLayout.css';
import './style/layout/layoutColors.css';
import './style/themes/blue/Colors.css';
import './style/themes/colorDef.css'
import './style/layout/Layout.css'
import './style/layout/Sidebar.css';

axios.defaults.baseURL = "/";


function App() {

  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Navigate to="/app/home" replace={true} />} />
          <Route path="/app" element={<MainLayout />}>
            {routes}
          </Route>
        </Routes>
      </BrowserRouter >
    </>
  )
}

export default App;