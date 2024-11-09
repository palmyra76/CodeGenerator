import { useRef, useState } from "react";
import { Dialog, ClickAwayListener } from "@mui/material";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { Password } from "../form";
import { toast } from "react-toastify";
import { getStoreFactory } from "../../wire/StoreFactory";
import { ISaveForm, PalmyraNewForm } from "@palmyralabs/rt-forms";

interface passwordInput {
    isOpen?: any;
    onClose?: any;
    data?: any;
    loginName?: any
}

function ResetPasswordDialog(props: passwordInput) {
    const formRef = useRef<ISaveForm>();
    const openDialog = props.isOpen;
    const closeDialog = props.onClose;
    const loginName = props.loginName;

    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = getStoreFactory("api");
    const endPoint = '/admin/resetPassword';

    // const { data, formRef } = usePalmyraNewForm({
    //     storeFactory,
    //     
    // })

    const showServerErrorToast = () => {
        toast.error("Server problem.. Please try again later");
    };

    const resetPasswordToast = () => {
        toast.success("Password Reset SuccessFully..");
    };

    const saveData = () => {
        const requestData = formRef.current.getData();
        const request = { loginName: loginName, password: requestData.password }

        const endPoint = '/admin/resetPassword';
        storeFactory.getFormStore({}, endPoint, '').post(request).then(() => {
            resetPasswordToast();
            closeDialog();
        }).catch((error) => {
            if (error.response && error.response.status === 500) {
                showServerErrorToast();
            }
        })
    }

    const handleDialogClick = (event: any) => {
        event.stopPropagation();
    };

    const handleKeyClose = (event: any) => {
        if (event.keyCode === 27) {
            closeDialog();
        }
    }

    return (
        <div>
            <PalmyraNewForm onValidChange={setValid} endPoint={endPoint} ref={formRef}>
                <Dialog className="reset-pwd-dialog" open={openDialog} onClick={handleDialogClick}
                    onClose={closeDialog} onKeyDown={handleKeyClose}
                    PaperProps={{
                        sx: {
                            width: 'auto', minWidth: '400px', height: 'auto', borderRadius: '15px'
                        }
                    }}>
                    <ClickAwayListener onClickAway={closeDialog}>
                        <div>
                            <div className="dialog-header-container">
                                <div className="dialog-header-text">
                                    <span>Reset Password</span>
                                </div>
                                <div className="dialog-header-icon-container">
                                    <Close onClick={closeDialog} className="dialog-cancel-icon" />
                                </div>
                            </div>
                            <div className="dialog-content">
                                <Password attribute="password" title="New Password"
                                    required={true} 
                                    // validRule={["oneUpperCase", 'oneLowerCase', 'oneSpecialChar']}
                                    // invalidMessage={{
                                    //     'oneLowerCase': 'Invalid lower case',
                                    //     'oneUpperCase': 'Invalid upper',
                                    //     'oneSpecialChar': 'One Special Char'
                                    // }}
                                    length={{ min: 8, errorMessage: 'Atleast min 8 chars' }}
                                />
                                <Password attribute="confirmPassword" title="Confirm Password"
                                    required={true} />
                            </div>
                            <div className='reset-pwd-form-btn-container'>
                                <Button onClick={closeDialog}
                                    className='cancel-filled-button'
                                    disableRipple >
                                    <Close className="button-icon" />
                                    Cancel
                                </Button>
                                <Button
                                    disabled={!isValid}
                                    className={!isValid ? 'disabled-button' : 'filled-button'}
                                    disableRipple onClick={saveData}>
                                    <Done className="button-icon" />
                                    Update Password
                                </Button>
                            </div>
                        </div>
                    </ClickAwayListener>
                </Dialog>
            </PalmyraNewForm>
        </div>
    );
}

export default ResetPasswordDialog;