import { Button } from "@mui/material";
import { ArrowBack, BorderColor } from '@mui/icons-material';
import { useNavigate, useParams } from "react-router-dom";
import { IPageInput } from "../../../templates/Types";
import { FieldGroupContainer, PalmyraViewForm } from "@palmyralabs/rt-forms";
import { OptionsView, TextView } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";

interface FormInput extends IPageInput {
    groupId?: any
}
const ViewGroupForm = (props: FormInput) => {
    const params: any = useParams();
    const navigate = useNavigate();
    const groupId = props.groupId;
    const pageName = props.pageName;

    const apiEndPoint = ServiceEndpoint.aclmgmt.group;

    const goToEditForm = () => {
        navigate('../' + pageName + '/edit/' + params.id);
    }
    const goToGroupGrid = () => {
        navigate('../' + pageName);
    }
    return (
        <div>
            <div className='form-header-container view-form' >
                <div>View Group</div>
                <div className="form-header-btn-container">
                    <Button onClick={goToGroupGrid}
                        className='filled-button'
                        disableRipple >
                        <ArrowBack className='button-icon' />
                        Back
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
                <PalmyraViewForm endPoint={apiEndPoint} id={groupId}>
                    <FieldGroupContainer columns={2}>
                        <TextView attribute="name"
                            title="Group" />
                        <OptionsView attribute="active" title="status"
                            options={{ 1: 'Active', 0: 'De-Active' }} />
                        <TextView attribute="description"
                            title="Description" />
                    </FieldGroupContainer>
                </PalmyraViewForm>
            </div>
        </div>
    )
}

export default ViewGroupForm;
