import { Button } from "@mui/material";
import { LockReset, BorderColor } from '@mui/icons-material';
import { useNavigate, useParams } from "react-router-dom";
import { useState } from "react";
import { IPageInput } from "../../../templates/Types";
import ResetPasswordDialog from "../../../components/dialog/ResetPasswordDialog";
import { DateView, FieldGroupContainer, LookupView, OptionsView, PalmyraForm, TextView, usePalmyraViewForm } from "palmyra-rui";
import AppStoreFactory from "../../../components/wire/StoreFactory";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";

interface FormInput extends IPageInput {
    id?: any
    userDetail?: any
}
const UserViewForm = (props: FormInput) => {
    const [_isValid, setValid] = useState<boolean>(false);
    const storeFactory = AppStoreFactory;
    const [showPopup, setShowPopup] = useState<boolean>(false);

    const navigate = useNavigate();
    const params: any = useParams();
    const user = props.userDetail;
    console.log(user,'uu',props.id);
    const pageName = props.pageName;
    const endPoint = ServiceEndpoint.userManagement.users.restApi

    const { data } = usePalmyraViewForm({
        storeFactory,
        endPoint: endPoint,
        id: props.id
    })
    const goToEditForm = () => {
        return navigate('../' + pageName + '/edit/' + params.id);
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
                <div>View User Detail</div>
                <div className="form-header-btn-container">
                    <Button
                        className='outlined-button'
                        disableRipple onClick={resetPassword}>
                        <LockReset className='button-icon' />
                        Reset Password
                        <ResetPasswordDialog isOpen={showPopup} onClose={handleClose} data={user} loginName={user.loginName} />
                    </Button>
                    <Button
                        className='outlined-button'
                        disableRipple onClick={goToEditForm}>
                        <BorderColor className='button-icon' />
                        Edit
                    </Button>
                </div>
            </div>
            <div className="user-view-form-container">
                <PalmyraForm formData={data} mode="view" onValidChange={setValid}
                    storeFactory={storeFactory}>
                    <FieldGroupContainer columns={2}>
                        <TextView attribute="displayName"
                            title="Display Name"
                        />
                        <TextView attribute="firstName"
                            title="First Name"
                        />
                        <TextView attribute="lastName"
                            title="Last Name"
                        />
                        <DateView attribute="dob" title="DOB"
                        ></DateView>
                        <OptionsView attribute="gender" title="Gender"
                            options={{ M: 'Male', F: 'Female' }}
                        />
                        <LookupView attribute="userType.id" title="User Type"
                            displayAttribute="userType.userType"
                            lookupOptions={{ idAttribute: 'id', displayAttribute: 'userType' }} />
                        <TextView attribute="phoneNumber"
                            title="Phone Number"
                        />
                        <TextView attribute="email"
                            title="Email"
                        />
                        <TextView attribute="address"
                            title="Address"
                        />
                        <TextView attribute="homeCustom"
                            title="Home Custom"
                        />
                        <LookupView attribute="homeMenu.id" title="Home Menu"
                            displayAttribute="homeMenu.name"
                            lookupOptions={{ idAttribute: 'id', displayAttribute: 'name' }} />

                    </FieldGroupContainer>
                </PalmyraForm>
                {/* <div className="user-view-form-left-container">
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Display Name
                        </div>
                        <div className="user-view-form-data">
                            {user.displayName}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Last Name
                        </div>
                        <div className="user-view-form-data">
                            {user.lastName}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Gender
                        </div>
                        <div className="user-view-form-data">
                            {gender}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Phone Number
                        </div>
                        <div className="user-view-form-data">
                            {user.phoneNumber}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Address
                        </div>
                        <div className="user-view-form-data">
                            {user.address}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Home Menu
                        </div>
                        <div className="user-view-form-data">
                            {user?.homeMenu?.name}
                        </div>
                    </div>
                </div>
                <div className="user-view-form-right-container">
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            First Name
                        </div>
                        <div className="user-view-form-data">
                            {user.firstName}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            DOB
                        </div>
                        <div className="user-view-form-data">
                            {user.dob}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            User Type
                        </div>
                        <div className="user-view-form-data">
                            {user?.userType?.userType}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Email
                        </div>
                        <div className="user-view-form-data">
                            {user.email}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Home Custom
                        </div>
                        <div className="user-view-form-data">
                            {user?.homeCustom?.name}
                        </div>
                    </div>
                </div> */}
            </div>
        </div>
    )
}

export default UserViewForm;
