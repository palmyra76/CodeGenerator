import { useEffect, useState } from "react";
import { Outlet } from "react-router-dom";
import { Box, CssBaseline, Toolbar } from "@mui/material";
import { Sidebar } from "./Sidebar";
import { useWindowSize } from "usehooks-ts";
import TitleConfig from "../../config/TitleConfig";
import Topbar from "./Topbar";

interface MainLayoutInput {
  sideBarWidth?: string
}

const MainLayout = (props: MainLayoutInput) => {
  var sideWidth = props.sideBarWidth;
  var sidebarTitle = TitleConfig.subTitle.text;

  if (!sideWidth) {
    sideWidth = '250px';
  }

  const { width } = useWindowSize();
  const [mobileMode, setMobileMode] = useState(false);
  const [mobileOpen, setMobileOpen] = useState(false);

  const responsive = width < 900;

  useEffect(() => {
    setMobileMode(responsive);
  }, [responsive, setMobileOpen])

  const display = mobileMode ? "block" : "none";

  return (
    <Box sx={{ display: "flex" }}>
      <CssBaseline />
      <Topbar mobileOpen={mobileOpen} setMobileOpen={setMobileOpen} display={display} />
      <Sidebar
        appTitle={sidebarTitle} width={sideWidth} mobileOpen={mobileOpen} setMobileOpen={setMobileOpen} responsive={responsive} />
      <Box
        component="main"
        sx={{
          flexGrow: 1,
          padding: '10px',
          width: `calc(100% - ${r"${sideWidth}"})`,
          minHeight: "100vh"
        }}
      >
        <Toolbar />
        <Outlet />
      </Box>
    </Box>
  );
};

export type { MainLayoutInput };

export { MainLayout };