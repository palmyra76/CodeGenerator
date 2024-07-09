import { Button } from "@mui/material";
import { LockReset, BorderColor } from '@mui/icons-material';
import ResetPasswordDialog from "../../../../components/dialog/ResetPasswordDialog";
import { useNavigate, useParams } from "react-router-dom";
import { IPageInput } from "../../../../templates/Types";
import { useState } from "react";

interface FormInput extends IPageInput {
    userDetail?: any
}
const UserViewForm = (props: FormInput) => {
    const params: any = useParams();
    const user = props.userDetail;

    const [showPopup, setShowPopup] = useState<boolean>(false);
    const pageName = props.pageName;
    const navigate = useNavigate();

    const goToEditForm = () => {
        return navigate('../' + pageName + '/edit/' + params.id);
    }

    const resetPassword = () => {
        return setShowPopup(true);
    }

    const handleClose = () => {
        return setShowPopup(false);
    }

    const gender = user.gender == 'M' ? 'Male' : 'Female';
    const maritalStatus = user.maritalStatus == 'M' ? 'Married' : 'UnMarried';
    const userStatus = user.status == 'active' ? 'Active' : 'de-active' ? 'De-Active' : 'suspend' ? 'Suepend' : null;


    return (
        <div>
            <div className='form-header-container view-form' >
                <div>View User Detail</div>
                <div className="form-header-btn-container">
                    <Button
                        className='filled-button'
                        disableRipple onClick={resetPassword}>
                        <LockReset className='button-icon' />
                        Reset Password
                        <ResetPasswordDialog isOpen={showPopup} onClose={handleClose} data={user} />
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
                <div className="user-view-form-left-container">
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Login Name
                        </div>
                        <div className="user-view-form-data">
                            {user.loginName}
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
                            DOB
                        </div>
                        <div className="user-view-form-data">
                            {user.dob}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Parent Phone Number
                        </div>
                        <div className="user-view-form-data">
                            {user.parentPhoneNumber}
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
                            Bank Name
                        </div>
                        <div className="user-view-form-data">
                            {user.bankName}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Account Holder Name
                        </div>
                        <div className="user-view-form-data">
                            {user.accountHolderName}
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
                            Address
                        </div>
                        <div className="user-view-form-data">
                            {user.address}
                        </div>
                    </div>
                </div>
                <div className="user-view-form-right-container">
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            first Name
                        </div>
                        <div className="user-view-form-data">
                            {user.firstName}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Join Date
                        </div>
                        <div className="user-view-form-data">
                            {user.joinDate}
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
                            Marital Status
                        </div>
                        <div className="user-view-form-data">
                            {maritalStatus}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            User Role
                        </div>
                        <div className="user-view-form-data">
                            {user?.userType?.userType}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Account Number
                        </div>
                        <div className="user-view-form-data">
                            {user.accountNumber}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            IFSC Code
                        </div>
                        <div className="user-view-form-data">
                            {user.ifscCode}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            User Status
                        </div>
                        <div className="user-view-form-data">
                            {userStatus}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default UserViewForm;
