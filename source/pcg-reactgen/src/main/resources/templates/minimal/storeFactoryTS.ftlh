import { PalmyraStoreFactory } from "palmyra-rui";
import 'react-toastify/dist/ReactToastify.css';
import Swal from "sweetalert2";

const serverErrorHandle = () => {
    Swal.fire({
        html: "<p class='custom-text'>Server problem.. Please try again later...</p>",
        showConfirmButton:false,
        allowEscapeKey: false,
        allowOutsideClick: false,
        timer: 5000,
        timerProgressBar: true,
    });
};
const applicationErrorHandle = () => {
    Swal.fire({
        html: "<p class='custom-text'>Application Server is Down.. Please try again later...</p>",
        showConfirmButton:false,
        allowEscapeKey: false,
        allowOutsideClick: false,
        timer: 5000,
        timerProgressBar: true,
    });
};

const errorHandler = () => {

    return (error: any) => {
        const status: number = error.response.status;
        if (status >= 600) {
            return false;
        }
        else if (status == 500) {
            serverErrorHandle();
            return true;
        }else if (status == 502) {
            applicationErrorHandle();
            return true;
        }
        return true;
    }
}


const AppStoreFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra", errorHandlerFactory: errorHandler });

export default AppStoreFactory;