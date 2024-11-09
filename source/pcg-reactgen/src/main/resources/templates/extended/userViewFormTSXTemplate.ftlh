import { useState } from "react";
import { Button } from "@mui/material";
import { LockReset, ArrowBack, BorderColor } from '@mui/icons-material';
import { useNavigate, useParams } from "react-router-dom";
import { IPageInput } from "../../../templates/Types";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import ResetPasswordDialog from "../../../components/dialog/ResetPasswordDialog";
import { FieldGroupContainer, PalmyraViewForm } from "@palmyralabs/rt-forms";
import { DateView, LookupView, OptionsView, TextView } from "../../../components/form";

interface FormInput extends IPageInput {
    id?: any
    userDetail?: any
}

const UserViewForm = (props: FormInput) => {
    const { pageName, userDetail } = props;
    const params: any = useParams();
    const navigate = useNavigate();

    const [showPopup, setShowPopup] = useState<boolean>(false);
    const endPoint = ServiceEndpoint.userManagement.users.restApi;

    const goToEditForm = () => {
        return navigate('../' + pageName + '/edit/' + params.id);
    }

    const goToUserTable = () => {
        return navigate('../' + pageName);
    }

    const resetPassword = () => {
        return setShowPopup(true);
    }

    const handleClose = () => {
        return setShowPopup(false);
    }

    return (
        <div>
            <div className='form-header-container view-form' >
                <div className="form-header-text">View User Detail</div>
                <div className="form-header-btn-container">
                    <Button onClick={goToUserTable}
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
                        <ResetPasswordDialog isOpen={showPopup} onClose={handleClose} data={userDetail} loginName={userDetail.loginName} />
                    </Button>
                    <Button
                        className='filled-button'
                        disableRipple onClick={goToEditForm}>
                        <BorderColor className='button-icon' />
                        Edit
                    </Button>
                </div>
            </div>
            <div className="user-view-form-container">
                <PalmyraViewForm endPoint={endPoint} id={props.id}>
                    <FieldGroupContainer columns={2}>
                        <TextView attribute="displayName"
                            title="Display Name" />
                        <TextView attribute="firstName"
                            title="First Name" />
                        <TextView attribute="lastName"
                            title="Last Name" />
                        <DateView attribute="dob" title="DOB" displayPattern="DD-MM-YYYY"/>
                        <OptionsView attribute="gender" title="Gender"
                            options={{ M: 'Male', F: 'Female' }} />
                        <LookupView attribute="userType" title="User Type"
                            lookupOptions={{ idAttribute: 'id', labelAttribute: 'userType' }} />
                        <TextView attribute="phoneNumber"
                            title="Phone Number" />
                        <TextView attribute="email"
                            title="Email" />
                        <TextView attribute="address"
                            title="Address" />
                        <LookupView attribute="displayPage" title="Display Page"
                            lookupOptions={{ idAttribute: 'id', labelAttribute: 'name' }} />
                    </FieldGroupContainer>
                </PalmyraViewForm>
            </div>
        </div>
    )
}

export default UserViewForm;