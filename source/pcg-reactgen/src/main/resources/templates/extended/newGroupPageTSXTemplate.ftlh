import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { FieldGroupContainer, RadioGroup, TextField } from "../../../components/form";
import { ISaveForm, PalmyraNewForm } from "@palmyralabs/rt-forms";
import { useRef, useState } from "react";
import { Button } from "@mui/material";
import { Close, Done } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { IPageInput } from "../../../templates/Types";
import { showServerErrorToast } from "../../../wire/errorToast";

const NewGroupPage = (props: IPageInput) => {
    const formRef = useRef<ISaveForm>();
    const navigate = useNavigate();
    const [isValid, setValid] = useState<boolean>(false);

    const apiEndPoint = ServiceEndpoint.aclmgmt.group;

    const handleSaveData = () => {
        formRef.current.saveData().then(() => {
            navigate('../' + props.pageName);
        })
    }
    const goToGroupGrid = () => {
        navigate('../' + props.pageName);
    }

    return (
        <div className="user-form-container">
            <div className='form-header-container' >
                <div className="form-header-text">New Group</div>
                <div className="form-header-btn-container">
                    <Button onClick={goToGroupGrid}
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
                        Save
                    </Button>
                </div>
            </div>
            <PalmyraNewForm endPoint={apiEndPoint} ref={formRef} onValidChange={setValid}
                onSaveFailure={showServerErrorToast}>
                <div className="palmyra-form-field-container-wrapper">
                    <FieldGroupContainer columns={2}>
                        <TextField attribute="name" title="Group"
                            validRule={"string"}
                            required={true} autoFocus
                            length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                        <RadioGroup attribute="active" title="Status"
                            options={[
                                { value: 1, label: 'Active' },
                                { value: 0, label: 'Disabled' }
                            ]} defaultValue={1} />
                        <TextField attribute="description"
                            title="Description" colspan={2}
                            validRule={"string"}
                            length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                    </FieldGroupContainer>
                </div>
            </PalmyraNewForm>
        </div>
    )
}

export default NewGroupPage;