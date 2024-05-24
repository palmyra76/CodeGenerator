import { PalmyraForm, PalmyraStoreFactory, usePalmyraViewForm } from "palmyra-rui";
import { IFormViewInput } from "../../Types";
import { BorderColor, ArrowBack } from '@mui/icons-material';
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

    const goToGrid = () => {
        return navigate('../' + pageName);
    }

    return (
        <div className='form-container'>
            <div className='form-header-container'>
                <div>{props.title}</div>
                <div className="form-header-btn-container">
                    <Button onClick={goToGrid}
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
            <PalmyraForm formData={data} mode="view" onValidChange={setValid}
                storeFactory={storeFactory}>
                {props.children}
            </PalmyraForm>
        </div>
    );
}
export default ViewForm;

