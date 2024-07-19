import { useState } from 'react'
import { useNavigate } from 'react-router-dom';
import { Button, Table, TableBody, TableCell, TableRow, TextField } from '@mui/material';
import { toast } from 'react-toastify';
import axios from 'axios';
import Link from '@mui/material/Link';
import ErrorIcon from '@mui/icons-material/Error';

const LoginInput = () => {
  const navigate = useNavigate();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [usernameError, setUsernameError] = useState('');
  const [passwordError, setPasswordError] = useState('');

  const handleUsernameChange = (event: any) => {
    setUsername(event.target.value);
    setUsernameError('');
  };

  const handlePasswordChange = (event: any) => {
    setPassword(event.target.value);
    setPasswordError('');
  };

  const userNameMandatoryError = () => {
    if (!username) {
      setUsernameError('Username is Mandatory.');
    }
  }

  const pwdMandatoryError = () => {
    if (!password) {
      setPasswordError('Password is Mandatory.');
    }
  }

  const handleClick = () => {
    if (!username) {
      setUsernameError('Username is Mandatory.');
    }

    if (!password) {
      setPasswordError('Password is Mandatory.');
    }

    const showServerErrorToast = () => {
      toast.error("Server problem.. Please try again later");
    };

    const showInvaildToast = () => {
      toast.warn("Invalid Credentials");
    };

    var formData = {
      userName: username,
      password: password,
    };

    var loginUrl = 'api/auth/login';
    if (username && password) {
      axios
        .post(loginUrl, formData, {
          headers: {
            'X-Skip-Interceptor': 'true'
          }
        })
        .then(function (res) {
          localStorage.removeItem("palmyra.rui.sidemenu.expanded.selected");
          const displayPage = res.data.homeMenu;
          navigate('/app/' + displayPage)
        })
        .catch(function (error) {
          if (error.response && error.response.status === 401) {
            showInvaildToast();
          } else if (error.response.status === 500) {
            showServerErrorToast();
          }
        });
    };
  }

  const handleSubmit = (event: any) => {
    event.preventDefault();
    handleClick();
  }

  return (
    <div>
      <form onSubmit={handleSubmit} noValidate>
        <Table className='login-container-table'>
          <TableBody>
            <TableRow >
              <TableCell className='login-textfield-row'>
                <TextField value={username} label='Username' onBlur={userNameMandatoryError} variant='filled' className='login-textfield'
                  onChange={handleUsernameChange} autoFocus
                />
                {usernameError && <div className='error-text'>
                  <ErrorIcon className='error-text-icon' />
                  {usernameError}
                </div>}
              </TableCell>
            </TableRow>
            <TableRow >
              <TableCell className='login-textfield-row'>
                <TextField type='password' value={password} onBlur={pwdMandatoryError} label='Password' variant='filled' className='login-textfield'
                  onChange={handlePasswordChange}
                />
                {passwordError && <div className='error-text'>
                  <ErrorIcon className='error-text-icon' />
                  {passwordError}
                </div>}
              </TableCell>
            </TableRow>
            <TableRow>
              <TableCell>
                <Link underline='none' className='login-forgot-pwd-link'>
                  Forgot Password ?
                </Link>
              </TableCell>
            </TableRow>
            <TableRow>
              <TableCell>
                <Button disableRipple type="submit" variant="contained" className='login-btn'>
                  Login
                </Button>
              </TableCell>
            </TableRow>
          </TableBody>
        </Table>
      </form>
    </div>
  )
}

export default LoginInput;