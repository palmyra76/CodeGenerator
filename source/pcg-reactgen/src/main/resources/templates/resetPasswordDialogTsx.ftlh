import { Dialog, ClickAwayListener } from "@mui/material";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { PalmyraForm, PalmyraStoreFactory, usePalmyraNewForm } from "palmyra-rui";
import { useState } from "react";
import { Password } from "../form";
import { toast } from "react-toastify";

interface passwordInput {
    isOpen?: any;
    onClose?: any;
    data?: any;
    loginName?: any
}

function ResetPasswordDialog(props: passwordInput) {
    const openDialog = props.isOpen;
    const closeDialog = props.onClose;
    const loginName = props.loginName;

    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api" });

    const { data, formRef } = usePalmyraNewForm({
        storeFactory,
        endPoint: '/admin/resetPassword'
    })

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
            <PalmyraForm formData={data} mode="new" onValidChange={setValid} ref={formRef}>
                <Dialog className="reset-pwd-dialog" open={openDialog} onClick={handleDialogClick}
                    onClose={closeDialog} onKeyDown={handleKeyClose}
                    PaperProps={{
                        sx: {
                            width: 'auto', minWidth: '400px', height: 'auto', borderRadius: '15px'
                        }
                    }}
                >
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
                                <Password attribute="password" label="New Password"
                                    required={true}
                                    validationRule={["oneUpperCase", 'oneLowerCase', 'oneSpecialChar']}
                                    errorMessage={{
                                        'oneLowerCase': 'Invalid lower case',
                                        'oneUpperCase': 'Invalid upper',
                                        'oneSpecialChar': 'One Special Char'
                                    }}
                                    length={{ min: 8, message: 'Atleast min 8 chars' }}
                                />
                                <Password attribute="confirmPassword" label="Confirm Password" required={true} />
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
            </PalmyraForm>
        </div>
    );
}
export default ResetPasswordDialog;