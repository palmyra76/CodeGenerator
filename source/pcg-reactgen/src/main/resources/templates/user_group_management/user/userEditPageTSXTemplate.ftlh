import { useParams } from "react-router-dom";
import { IPageInput } from "../../../templates/Types";
import { FieldGroupContainer } from "palmyra-rui";
import { DatePicker, RadioGroup, ServerLookup, TextField } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import EditForm from "../../templates/default/form/EditForm";

const UserEditPage = (props: IPageInput) => {
    const params: any = useParams();
    const LookupEndPoint = ServiceEndpoint.userManagement.lookup;
    const MenuLookupEndPoint = ServiceEndpoint.aclmgmt.menuApi.lookup;

    return <div className="user-form-container">
        <EditForm id={params.id} title="Edit User" pageName={props.pageName} options={{
            endPoint:
                ServiceEndpoint.userManagement.users.restApi
        }}>
            <div className="palmyra-form-field-container-wrapper">
                <FieldGroupContainer columns={2}>
                    <TextField attribute="displayName"
                        title="Display Name"
                        validationRule={"string"}
                        required={true} autoFocus
                        length={{ min: 3, message: "Minimum of 3 letters" }}
                    />
                    <TextField attribute="firstName"
                        title="First Name"
                        validationRule={"string"}
                        length={{ min: 3, message: "Minimum of 3 letters" }}
                    />
                    <TextField attribute="lastName"
                        title="Last Name"
                        validationRule={"string"}
                    />
                    <DatePicker attribute="dob" title="DOB"
                        variant="standard" serverPattern="DD-MM-YYYY"
                    ></DatePicker>
                    <RadioGroup attribute="gender" title="Gender"
                        options={{ M: 'Male', F: 'Female' }} />
                    <ServerLookup attribute="userType.id" title="User Type"
                        displayAttribute="userType.userType"
                        storeOptions={{ endPoint: LookupEndPoint.userType }} required
                        lookupOptions={{ idAttribute: 'id', displayAttribute: 'userType' }} />
                    <TextField attribute="phoneNumber"
                        title="Phone Number"
                        validationRule={"mobilePhone"}
                        errorMessage={{
                            rule: 'Invalid Phone Number'
                        }}
                    />
                    <TextField attribute="email"
                        title="Email"
                        validationRule={"email"}
                        required={true}
                        errorMessage={{
                            rule: 'Invalid Email'
                        }}
                    />
                    <TextField attribute="address"
                        title="Address"
                        validationRule={"string"}
                    />
                    <TextField attribute="homeCustom"
                        title="Home Custom"
                        validationRule={"string"}
                    />
                    <ServerLookup attribute="homeMenu.id" title="Home Menu"
                        displayAttribute="homeMenu.name" placeHolder="Select Home Menu"
                        storeOptions={{ endPoint: MenuLookupEndPoint.menuApi }}
                        lookupOptions={{ idAttribute: 'id', displayAttribute: 'name' }} />
                </FieldGroupContainer>
            </div>
        </EditForm>
    </div>
}

export default UserEditPage;