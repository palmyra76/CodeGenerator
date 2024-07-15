import { Drawer, IconButton, List, Stack, Toolbar, Typography } from "@mui/material";
import {  StaticTreeMenu } from "palmyra-rui";
import '../../style/layout/Sidebar.css';
import { useState } from "react";
import { MenuList } from "../../routes/SideMenuList";
import MenuIcon from '@mui/icons-material/Menu';
import { useNavigate } from "react-router-dom";


interface SidebarInput {
  appTitle: string,
  width: string,
  mobileOpen?: boolean,
  setMobileOpen?: any,
  responsive?: boolean
}

const Sidebar = (props: SidebarInput) => {
  let container = document.body;
  const sideBarWidth = props.width;
  const mobileOpen = props.mobileOpen;
  const setMobileOpen = props.setMobileOpen;
  const responsive = props.responsive;

  const [isMinimized, setIsMinimized] = useState(false);
  const [isRotated, setIsRotated] = useState(false);
  const navigate = useNavigate();

  const barMenu = () => {
    setIsRotated(!isRotated);
    setIsMinimized(!isMinimized);
  }

  const handleDrawerToggle = () => {
    setMobileOpen(!mobileOpen);
  }

  const navigateHome = () => {
    navigate('../app/home')
  }
  const iconStyles = {
    transform: isRotated ? 'rotate(180deg)' : 'rotate(0deg)',
    transition: 'transform 0.3s ease',
  };

  let drawerList = <List disablePadding>
    <div className="sidebar">
      <div className='sidebar-header'>
        <Toolbar sx={{ marginBottom: "20px" }}>
          <Stack
            sx={{ width: "100%" }}
            direction="row"
            position={'relative'}
            justifyContent="center"
          >
            <Typography variant="h6" className={`sidebar-title ${r"\${!isMinimized ? 'minimized' : ''}"}`}>
              <div>
                {!responsive && (
                  <IconButton
                    color="default"
                    aria-label="open drawer"
                    edge="start"
                    onClick={barMenu}
                    sx={{ mr: 0 }}
                  >
                    <MenuIcon style={iconStyles} className='sidebar-title-menu-icon' />
                  </IconButton>
                )}
              </div>
              <div>
                {!isMinimized && (
                  <div onClick={navigateHome} className="sidebar-logo-container">
                    <span className="sidebar-logo-text">{props.appTitle}</span>
                  </div>
                )}
              </div>
            </Typography>
          </Stack>
        </Toolbar>
      </div>
      <div className='sidebar-middle' style={{ display: isMinimized ? 'block' : 'block' }}>
        <StaticTreeMenu data={MenuList}/>
      </div>
      <div className='sidebar-footer' style={{ display: isMinimized ? 'none' : 'block' }}>
        <p className='sidebar-footer-text'>Powered by Palmyra</p>
      </div>
    </div>
  </List>;

  if (responsive) {
    return <Drawer
      container={container}
      variant="temporary"
      open={mobileOpen}
      onClose={handleDrawerToggle}
      ModalProps={{
        keepMounted: true
      }}
      sx={{
        display: 'block',
        '& .MuiDrawer-paper': {
          boxSizing: 'border-box', width: sideBarWidth,

        },
      }}
    >
      {drawerList}
    </Drawer>;
  } else if (isMinimized) {
    return (

      <Drawer
        variant="permanent"
        sx={{
          width: '80px',
          transitionProperty: " width",
          transitionDuration: " 0.3s",
          flexShrink: 0,
          "& .MuiDrawer-paper": {
            width: '80px',
            boxSizing: "border-box",
            borderRight: "0px",
            transitionProperty: " width",
            transitionDuration: " 0.3s"
          }
        }}
      >
        {drawerList}
      </Drawer>
    );
  } else
    return (

      <Drawer
        variant="permanent"
        sx={{
          width: sideBarWidth,
          flexShrink: 0,
          transitionProperty: " width",
          transitionDuration: "0.3s",
          "& .MuiDrawer-paper": {
            width: sideBarWidth,
            boxSizing: "border-box",
            borderRight: "0px",
            transitionProperty: " width",
            transitionDuration: "0.3s"
          }
        }}
      >

        {drawerList}

      </Drawer>
    );
};


export { Sidebar };

export type { SidebarInput };