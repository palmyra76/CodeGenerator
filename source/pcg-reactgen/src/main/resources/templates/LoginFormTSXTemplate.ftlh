import TitleConfig from '../../config/TitleConfig';
import LoginInput from './LoginInput';

const LoginCopyright = () => {
    const currentYear = new Date().getFullYear();
    return (
        <div>
            <p className="login-copyright">©{currentYear} PalmyraLabs, all rights reserved</p>
        </div>
    )
}

const LoginHeader = () => {
    const loginTitle: any = TitleConfig.appTitle.text;

    return (
        <div className='login-header'>
            <h2>{loginTitle}</h2>
        </div>
    )
}

const LoginForm = () => {
    return (
        <div >
            <LoginHeader />
            <LoginInput />
            <LoginCopyright />
        </div>
    )
}

export default LoginForm;