import { Button } from "@mui/material";
import { BorderColor } from '@mui/icons-material';
import { useNavigate, useParams } from "react-router-dom";
import { IPageInput } from "../../../templates/Types";

interface FormInput extends IPageInput {
    groupDetail?: any
}
const ViewGroupForm = (props: FormInput) => {
    const params: any = useParams();
    const navigate = useNavigate();

    const group = props.groupDetail;
    const pageName = props.pageName;

    const goToEditForm = () => {
        navigate('../' + pageName + '/edit/' + params.id);
    }

    const groupStatus = group.active == 1 ? 'Active' : 'De-Active';


    return (
        <div>
            <div className='form-header-container view-form' >
                <div>View Group</div>
                <div className="form-header-btn-container">
                    <Button
                        className='outlined-button'
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
                            Group
                        </div>
                        <div className="user-view-form-data">
                            {group.name}
                        </div>
                    </div>
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Description
                        </div>
                        <div className="user-view-form-data">
                            {group.description}
                        </div>
                    </div>
                </div>
                <div className="user-view-form-right-container">
                    <div className="user-view-form-detail">
                        <div className="user-view-form-label">
                            Status
                        </div>
                        <div className="user-view-form-data">
                            {groupStatus}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default ViewGroupForm;
