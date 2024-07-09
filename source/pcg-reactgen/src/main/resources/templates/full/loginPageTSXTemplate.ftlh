import LoginForm from '../../components/login/LoginForm';
import '../../style/layout/Login.css';

const LoginPage = () => {

    return (
        <div className='login-page-container'>
            <div className='login-box-container'>
                <LoginForm />
            </div>
        </div>
    )
}


export default LoginPage;