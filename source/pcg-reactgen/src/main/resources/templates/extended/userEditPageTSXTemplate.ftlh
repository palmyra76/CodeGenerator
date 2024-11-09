import { useParams, useNavigate } from "react-router-dom";
import { DatePicker, FieldGroupContainer, RadioGroup, ServerLookup, TextField } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { ISaveForm, PalmyraEditForm } from "@palmyralabs/rt-forms";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { useRef, useState } from "react";
import { IPageInput } from "../../../templates/Types";
import { showServerErrorToast } from "../../../wire/errorToast";
import useKeyPress from "../../../components/utils/usekeyPress";

const UserEditPage = (props: IPageInput) => {
    const params: any = useParams();
    const formRef = useRef<ISaveForm>();
    const navigate = useNavigate();
    const [isValid, setValid] = useState<boolean>(false);

    const LookupEndPoint = ServiceEndpoint.userManagement.lookup;
    const MenuLookupEndPoint = ServiceEndpoint.aclmgmt.menuApi.lookup;
    const endPoint = ServiceEndpoint.userManagement.users.restApi

    const handleSaveData = () => {
        formRef.current.saveData().then(() => {
            navigate('../' + props.pageName + '/view/' + params.id);
        })
    }
    const goToUserViewForm = () => {
        navigate('../' + props.pageName + '/view/' + params.id);
    }

    const handleKeyPress: any = useKeyPress(handleSaveData, isValid);
    console.log(isValid, 'v');
    return <div className="user-form-container">
        <div className='form-header-container' >
            <div className="form-header-text">Edit User Detail</div>
            <div className="form-header-btn-container">
                <Button onClick={goToUserViewForm}
                    className="py-cancel-filled-button"
                    disableRipple >
                    <Close className="button-icon" />
                    Cancel
                </Button>
                <Button
                    className={isValid ? 'py-filled-button' : 'py-disabled-button'}
                    disabled={!isValid}
                    disableRipple onClick={handleSaveData}>
                    <Done className="button-icon" />
                    <u style={{ width: '5px' }}>S</u>ave
                </Button>
            </div>
        </div>
        <PalmyraEditForm endPoint={endPoint} id={params.id} ref={formRef}
            onValidChange={setValid} onSaveFailure={showServerErrorToast}>
            <div className="palmyra-form-field-container-wrapper" onKeyDown={handleKeyPress}>
                <FieldGroupContainer columns={2}>
                    <TextField attribute="displayName"
                        title="Display Name"
                        validRule={"string"}
                        required={true}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                    <TextField attribute="firstName"
                        title="First Name"
                        validRule={"string"}
                        required={true}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                    <TextField attribute="lastName"
                        title="Last Name" required
                        validRule={"string"}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                    <DatePicker attribute="dob" title="DOB"
                        variant="standard" serverPattern="DD-MM-YYYY"
                        required={true} />
                    <RadioGroup attribute="gender" title="Gender"
                        required options={{
                            M: 'Male',
                            F: 'Female'
                        }} />
                    <ServerLookup attribute="userType" title="User Type"
                        queryOptions={{ endPoint: LookupEndPoint.userType }} required
                        lookupOptions={{ idAttribute: 'id', labelAttribute: 'userType' }} />
                    <TextField attribute="phoneNumber" title="Phone Number" validRule={"number"}
                        required={true} />
                    <TextField attribute="email"
                        title="Email"
                        validRule={"email"}
                        required={true} />
                    <TextField attribute="address"
                        title="Address" validRule={"string"}
                        required={true} />
                    <ServerLookup attribute="displayPage" title="Display Page"
                        queryOptions={{ endPoint: MenuLookupEndPoint.menuApi }} required
                        lookupOptions={{ idAttribute: 'id', labelAttribute: 'name' }} />
                </FieldGroupContainer>
            </div>
        </PalmyraEditForm>
    </div>
}

export default UserEditPage;