import { PalmyraForm, PalmyraStoreFactory, usePalmyraViewForm } from "palmyra-rui";
import { useState } from "react";
import { Button} from "@mui/material";
import { useNavigate } from "react-router-dom";
import { LockReset, ArrowBack,BorderColor} from '@mui/icons-material/';
import { IFormViewInput } from "../../Types";
import ResetPasswordDialog from "../../../components/dialog/ResetPasswordDialog";


function ViewForm(props: IFormViewInput) {

    const [_isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });

    const pageName = props.pageName;
    const navigate = useNavigate();
    const [showPopup, setShowPopup] = useState<boolean>(false);


    const { data } = usePalmyraViewForm({
        storeFactory,
        endPoint: props.options.endPoint,
        id: props.id
    })

    const goToEditForm = () => {
        return navigate('../' + pageName + '/edit/' + props.id);
    }

    const resetPassword = () => {
        return setShowPopup(true);
    }

    const handleClose = () => {
        return setShowPopup(false);
    }

    return (
        <div className='form-container'>
            <div className='form-header-container'>
                <div>{props.title}</div>
                <div className="form-header-btn-container">
                    <Button onClick={() => window.history.back()}
                        className='filled-button'
                        disableRipple >
                        <ArrowBack className='button-icon' />
                        Back
                    </Button>
                    <Button
                        className='filled-button'
                        disableRipple onClick={resetPassword}>
                        <LockReset className='button-icon' />
                        Reset Password
                        <ResetPasswordDialog isOpen={showPopup} onClose={handleClose} data={data} />
                    </Button>
                    <Button
                        className='filled-button'
                        disableRipple onClick={goToEditForm}>
                        <BorderColor className='button-icon' />
                        Edit
                    </Button>
                </div>
            </div>
            <PalmyraForm formData={data} mode="view" onValidChange={setValid}>
                {props.children}
            </PalmyraForm>
        </div>
    );
}
export default ViewForm;