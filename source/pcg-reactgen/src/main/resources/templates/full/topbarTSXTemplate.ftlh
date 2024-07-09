import { useEffect, useState } from 'react';
import { useNavigate } from "react-router-dom";
import { AppBar, Toolbar, ClickAwayListener } from "@mui/material";
import { AccountCircle, KeyboardArrowDown, Logout, Menu } from '@mui/icons-material';
import { PalmyraStoreFactory } from 'palmyra-rui';
import IconButton from '@mui/material/IconButton';
import '../../style/layout/Topbar.css';
import AppStoreFactory from '../../components/wire/StoreFactory';
import { ServiceEndpoint } from '../../config/ServiceEndpoints';

interface TopbarProps {
  mobileOpen?: boolean,
  setMobileOpen?: any,
  display?: any
}

const Topbar: React.FC<TopbarProps> = ({ mobileOpen, setMobileOpen, display }) => {

  const [user, setUser] = useState<any>({});
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const navigate = useNavigate();

  const store = AppStoreFactory;
  const storeFactory = new PalmyraStoreFactory({ baseUrl: "api" });
  const userProfileEndPoint = ServiceEndpoint.userManagement.userProfileApi;

  useEffect(() => {
    const d: any = {};
    store.getFormStore(d, userProfileEndPoint, '').get({}).then((data) => {
      setUser(data);
      localStorage.setItem('userId', data.id);
    });
  }, []);

  const handleLogOut = (event: any) => {
    event.stopPropagation();
    const d: any = {};
    storeFactory.getFormStore(d, '/auth/logout', '').get({}).then(() => {
      navigate("/login");
    });
    setDropdownOpen(false);
  };

  const toggleDropdown = () => {
    setDropdownOpen(!dropdownOpen);
  };

  const handleDrawerToggle = () => {
    setMobileOpen(!mobileOpen);
  }

  const arrowStyles = {
    transform: dropdownOpen ? 'rotate(-180deg)' : 'rotate(0deg)',
    transition: 'transform 0.3s ease',
  };
  return (
    <AppBar
      sx={{
        width: { md: `calc(100%)` },
        ml: { md: '240px' },
      }}
      className='topbar'
    >
      <Toolbar>
        <IconButton
          color="default"
          aria-label="open drawer"
          edge="start"
          onClick={handleDrawerToggle}
          sx={{ mr: 3, display: { display } }}
        >
          <Menu />
        </IconButton>
        <div className='topbar-avathar' onClick={toggleDropdown}>
          <AccountCircle className='avatar' />
          <p className='avathar-name'>{user.displayName}</p>
          <KeyboardArrowDown style={arrowStyles} className='avathar-arrw-icon' />
        </div>
        {dropdownOpen && (
          <ClickAwayListener onClickAway={() => { setDropdownOpen(false) }}>
            <div className="dropdown-content">
              <ul>
                {/* <li onClick={toggleDropdown}>
                  <Logout className='dropdown-icon' />
                  <span className='dropdown-text'>Profile hgfufjhbh</span>
                </li>
                <li onClick={toggleDropdown}>
                  <Logout className='dropdown-icon' />
                  <span className='dropdown-text'>Settings</span>
                </li> */}
                <li onClick={handleLogOut}>
                  <Logout className='dropdown-icon' />
                  <span className='dropdown-text'>Log out</span>
                </li>
              </ul>
            </div>
          </ClickAwayListener>
        )}
      </Toolbar>
    </AppBar>
  );
};

export default Topbar;