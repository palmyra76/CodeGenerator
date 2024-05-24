import { PalmyraForm, PalmyraStoreFactory, usePalmyraViewForm } from "palmyra-rui";
import { BorderColor, ArrowBack } from '@mui/icons-material';
import { IFormViewInput } from "../../Types";
import { useState } from "react";
import { Button } from "@mui/material";
import { useNavigate } from "react-router-dom";


function ViewForm(props: IFormViewInput) {

    const [_isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });

    const pageName = props.pageName;
    const navigate = useNavigate();

    const { data } = usePalmyraViewForm({
        storeFactory,
        endPoint: props.options.endPoint,
        id: props.id
    })

    const goToEditForm = () => {
        return navigate('../' + pageName + '/edit/' + props.id);
    }

    return (
        <div className='drawer-form-container'>
            <div className='drawer-form-header-container'>
                <div>{props.title}</div>
            </div>
            <PalmyraForm formData={data} mode="view" onValidChange={setValid}
                storeFactory={storeFactory}>
                {props.children}
            </PalmyraForm>
            <div className="drawer-form-btn-container">
                <Button onClick={() => window.history.back()}
                    className='filled-button'
                    disableRipple >
                    <ArrowBack className='button-icon' />
                    Back
                </Button>
                <Button
                    className='filled-button'
                    disableRipple onClick={goToEditForm}>
                    <BorderColor className='outlined-button-icon' />
                    Edit
                </Button>
            </div>
        </div>
    );
}
export default ViewForm;

