import { Button } from "@mui/material";
import { DatePicker, FieldGroupContainer, NumberField, RadioGroup, ServerLookup, TextField } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { ISaveForm, PalmyraNewForm } from "@palmyralabs/rt-forms";
import { Close, Done } from '@mui/icons-material';
import { useRef, useState } from "react";
import { useNavigate } from 'react-router-dom';
import { IPageInput } from "../../../templates/Types";
import useKeyPress from "../../../components/utils/usekeyPress";

const UserNewPage = (props: IPageInput) => {
    const formRef = useRef<ISaveForm>();
    const navigate = useNavigate();
    const [isValid, setValid] = useState<boolean>(false);

    const LookupEndPoint = ServiceEndpoint.userManagement.lookup;
    const MenuLookupEndPoint = ServiceEndpoint.aclmgmt.menuApi.lookup;
    const apiEndpoint = ServiceEndpoint.userManagement.users.restApi;

    const handleSaveData = () => {
        formRef.current.saveData().then(() => {
            navigate('../' + props.pageName);
        })
    }
    const goToUserForm = () => {
        navigate('../' + props.pageName);
    }
    const handleKeyPress: any = useKeyPress(handleSaveData, isValid);
    return <div className="user-form-container">
        <div className='form-header-container' >
            <div className="form-header-text">New User</div>
            <div className="form-header-btn-container">
                <Button onClick={goToUserForm}
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
        <PalmyraNewForm endPoint={apiEndpoint} ref={formRef} onValidChange={setValid}>
            <div className="palmyra-form-field-container-wrapper" onKeyDown={handleKeyPress}>
                <FieldGroupContainer columns={2}>
                    <TextField attribute="displayName"
                        title="Display Name"
                        validRule={"string"}
                        required={true}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }}
                    />
                    <TextField attribute="firstName"
                        title="First Name"
                        validRule={"string"}
                        required={true}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }}
                    />
                    <TextField attribute="lastName" required
                        title="Last Name"
                        validRule={"string"}
                        length={{ min: 3, errorMessage: "Minimum of 3 letters" }}
                    />
                    <DatePicker attribute="dob" title="DOB"
                        variant="standard" serverPattern="DD-MM-YYYY"
                        required={true}
                    ></DatePicker>
                    <RadioGroup attribute="gender" title="Gender"
                        options={{ M: 'Male', F: 'Female' }} required />
                    <ServerLookup attribute="userType" title="User Type"
                        placeholder="Select User Type"
                        queryOptions={{ endPoint: LookupEndPoint.userType }} required
                        lookupOptions={{ idAttribute: 'id', labelAttribute: 'userType' }} />
                    <NumberField attribute="phoneNumber" title="Phone Number"
                        validRule={"number"}
                        required={true} invalidMessage={'Invalid Phone Number'} />
                    <TextField attribute="email"
                        title="Email" validRule={"email"}
                        required={true} invalidMessage={'Invalid Email'} />
                    <TextField attribute="address"
                        title="Address" validRule={"string"}
                        required={true} />
                    <ServerLookup attribute="displayPage.id" title="Display Page"
                        placeholder="Select Display Page"
                        queryOptions={{ endPoint: MenuLookupEndPoint.menuApi }} required
                        lookupOptions={{ idAttribute: 'id', labelAttribute: 'name' }}
                        defaultValue={{ id: 1, name: 'Home' }} />
                </FieldGroupContainer>
            </div>
        </PalmyraNewForm>
    </div>
}

export default UserNewPage;