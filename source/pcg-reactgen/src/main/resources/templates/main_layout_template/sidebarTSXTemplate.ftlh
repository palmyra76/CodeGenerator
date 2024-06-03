import { useState } from "react";
import { Drawer, IconButton, List, Stack, Toolbar, Typography } from "@mui/material";
import { TreeQueryStore } from "palmyra-rui";
import { TreeMenu } from "../../components/form";
import { ServiceEndpoint } from "../../config/ServiceEndpoints";
import AppStoreFactory from "../../components/wire/StoreFactory";
import '../../style/layout/Sidebar.css';

interface SidebarInput {
  appTitle: string,
  width: string,
  mobileOpen?: boolean,
  setMobileOpen?: any,
  responsive?: boolean
}

const Sidebar = (props: SidebarInput) => {
  const [isMinimized, setIsMinimized] = useState(false);
  const [isRotated, setIsRotated] = useState(false);

  const SideMenuEndPoint: any = ServiceEndpoint.aclmgmt.menuApi.sideMenuApi;
  const treeStore: TreeQueryStore<any, any> = AppStoreFactory.getTreeStore({}, SideMenuEndPoint);

  let container = document.body;
  const sideBarWidth = props.width;
  const mobileOpen = props.mobileOpen;
  const setMobileOpen = props.setMobileOpen;
  const responsive = props.responsive;

  const barMenu = () => {
    setIsRotated(!isRotated);
    setIsMinimized(!isMinimized);
  }

  const handleDrawerToggle = () => {
    setMobileOpen(!mobileOpen);
  }

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
                  </IconButton>
                )}
              </div>
              <div>
                {!isMinimized && (
                  <div>
                    <span className="sidebar-logo-text">{props.appTitle}</span><br />
                  </div>
                )}
              </div>
            </Typography>
          </Stack>
        </Toolbar>
      </div>
      <div className='sidebar-middle' style={{ display: isMinimized ? 'block' : 'block' }}>
        <TreeMenu store={treeStore} />
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
            transitionProperty: "width",
            transitionDuration: "0.3s"
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