import { PalmyraForm, PalmyraStoreFactory, usePalmyraNewForm } from "palmyra-rui";
import { IFormNewInput } from "../../Types";
import { useState } from "react";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { useNavigate } from "react-router-dom";
import { toast } from 'react-toastify';


function NewForm(props: IFormNewInput) {

    const navigate = useNavigate();
    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });

    //@ts-ignore
    const pageName = props.pageName;
    const errorText = props.errorText;

    const { data, saveData, formRef } = usePalmyraNewForm({
        storeFactory, endPoint: props.options.endPoint,
        formListener: props.formListener
    })


    const showServerErrorToast = () => {
        toast.error("Something went wrong Please try again later.. ")
    }
    const showUniqueErrorToast = () => {
        if (errorText) {
            toast.error(errorText);
        } else {
            toast.error("Data Already Exit");
        }
    };

    const saveFormData = () => {
        saveData().then((_d: any) => {
            return navigate('../' + pageName);
        }).catch((e) => {
            if (e.response && e.response.status === 400) {
                showUniqueErrorToast()
            } else if (e.response && e.response.status === 500) {
                showServerErrorToast()
            }
        });
    }
    const handleKeyPress = (event: any) => {
        if (event.ctrlKey && event.key === 's') {
            event.preventDefault();
            if (isValid) {
                saveFormData();
            } else {
                // show sweet alert
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
                            <u style={{width:'5px'}}>S</u>ave
                        </Button>
                    </div>
                </div>
                <PalmyraForm formData={data} mode="new" onValidChange={setValid}
                    customizer={props.customizer} ref={formRef} storeFactory={storeFactory}>
                    {props.children}
                </PalmyraForm>
            </form>
        </div>
    );
}
export default NewForm;

