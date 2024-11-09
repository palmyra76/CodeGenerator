import { useRef, useState } from "react";
import { useNavigate } from "react-router-dom";
import { Button } from "@mui/material";
import { LockReset, ArrowBack, BorderColor } from '@mui/icons-material';
import { IFormViewInput } from "../../Types";
import ResetPasswordDialog from "../../../components/dialog/ResetPasswordDialog";
import { ISaveForm, PalmyraViewForm } from "@palmyralabs/rt-forms";

function ViewForm(props: IFormViewInput) {
    const pageName = props.pageName;
    const navigate = useNavigate();
    const formRef = useRef<ISaveForm>();
    const [showPopup, setShowPopup] = useState<boolean>(false);

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
                        <ResetPasswordDialog isOpen={showPopup} onClose={handleClose} data={formRef.current.saveData()} />
                    </Button>
                    <Button
                        className='filled-button'
                        disableRipple onClick={goToEditForm}>
                        <BorderColor className='button-icon' />
                        Edit
                    </Button>
                </div>
            </div>
            <PalmyraViewForm endPoint={props.options.endPoint} id={props.id} formRef={formRef}>
                {props.children}
            </PalmyraViewForm>
        </div>
    );
}

export default ViewForm;