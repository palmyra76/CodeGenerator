import { Button } from "@mui/material"
import { useNavigate } from 'react-router-dom';

const NotFoundPage = () => {
    const navigate = useNavigate();
    return (
        <div className="page-not-found-container">
            <div>
                <div className="error-404">404</div>
                <div className="error-404-text">Oops! Page not found</div>
                <div className="btn-container">
                    <Button disableRipple className="py-filled-button"
                        onClick={() => navigate("app/home")}>Back to Home</Button>
                </div>
            </div>
        </div>
    )
}

export default NotFoundPage