import { PalmyraForm, PalmyraStoreFactory, usePalmyraEditForm } from "palmyra-rui";
import { IFormEditInput } from "../../Types";
import { useEffect, useState } from "react";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { useNavigate } from "react-router-dom";
import { toast } from 'react-toastify';


function EditForm(props: IFormEditInput) {

    const navigate = useNavigate();
    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });

    const pageName = props.pageName;

    const { data, saveData, formRef } = usePalmyraEditForm({
        storeFactory,
        endPoint: props.options.endPoint,
        id: props.id
    })

    useEffect(()=>{
        if(props.onDataRefresh){
            props.onDataRefresh(data);
        }
    }, [data])

    const showServerErrorToast = () => {
        toast.error("Something went wrong Please try again later.. ")
    }

    const saveFormData = () => {
        const s = saveData();
        s.then((_d: any) => {
            navigate('../' + pageName);
        }).catch((e) => {
            if (e.response && e.response.status === 500) {
                showServerErrorToast()
            }
        });

    }

    const handleKeyPress = (event: any) => {
        if (event.ctrlKey && event.key === 's') {
            event.preventDefault();
            if (isValid) {
                saveFormData();
            }
        }
    };

    return (
        <div className='form-container'>
            <form onKeyDown={handleKeyPress}>
                <div className='form-header-container'>
                    <div>{props.title}</div>
                    <div className="form-header-btn-container">
                        <Button
                            className='cancel-filled-button'
                            disableRipple onClick={() => window.history.back()}>
                            <Close className="button-icon" />
                            Cancel
                        </Button>
                        <Button disabled={!isValid}
                            className={!isValid ? 'disabled-button' : 'filled-button'}
                            disableRipple onClick={saveFormData}>
                            <Done className="button-icon" />
                            <u style={{ width: '5px' }}>S</u>ave
                        </Button>
                    </div>
                </div>
                <PalmyraForm customizer={props.customizer} formData={data} mode="edit"
                    onValidChange={setValid} ref={formRef} storeFactory={storeFactory}>
                    {props.children}
                </PalmyraForm>
            </form>
        </div >
    );
}
export default EditForm;

