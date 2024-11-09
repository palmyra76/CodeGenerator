import Swal from "sweetalert2";
import 'react-toastify/dist/ReactToastify.css';
import { IEndPoint, PalmyraStoreFactory } from "@palmyralabs/palmyra-wire";

const applicationErrorHandle = () => {
    Swal.fire({
        html: "<p class='custom-text'>Application Server is Down.. Please try again later...</p>",
        showConfirmButton: false,
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
            // serverErrorHandle();
            return true;
        } else if (status == 502) {
            applicationErrorHandle();
            return true;
        }
        return true;
    }
}


const AppStoreFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra", errorHandlerFactory: errorHandler });

const getStoreFactory = (baseUrl: string) => {
    return new PalmyraStoreFactory({ baseUrl, errorHandlerFactory: errorHandler });
}

export const useFormstore = (endPoint: IEndPoint, options?: Record<string, any>, idKey?: string) => {
    const o = options || {};
    return AppStoreFactory.getFormStore(o, endPoint, idKey);
}

export const useGridstore = (endPoint: IEndPoint, options?: Record<string, any>, idKey?: string) => {
    const o = options || {};
    return AppStoreFactory.getGridStore(o, endPoint, idKey);
}

export default AppStoreFactory;
export { getStoreFactory }