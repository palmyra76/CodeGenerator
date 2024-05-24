import { PalmyraForm, PalmyraStoreFactory, usePalmyraEditForm } from "palmyra-rui";
import { IFormEditInput } from "../../Types";
import { FC, useState } from "react";
import { Done, Close } from '@mui/icons-material';
import { Button } from "@mui/material";
import { IFormletInput } from "../grid/SummaryDrawerGrid";
import { toast } from 'react-toastify';

interface IDrawerEditInput extends IFormEditInput {
    onSave: Function
    onClose: () => void
    FORMLET: FC<IFormletInput>
    errorText?: any
}

function EditForm(props: IDrawerEditInput) {
    const errorText = props.errorText;
    const onClose = props.onClose
    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });
    const formListener: any = {
        //@ts-ignore
        onSaveSuccess: function (data: any): void {
            props.onSave();
        },
        onSaveFailure: function (e: any): void {
            console.error('Error while saving', e);
        },
        onChange: function (): void {
        }
    };
    //@ts-ignore
    const pageName = props.pageName;

    const { data, saveData, formRef } = usePalmyraEditForm({
        formListener,
        storeFactory,
        endPoint: props.options.endPoint,
        id: props.id
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
        const s = saveData();
        s.then((_d: any) => {

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
            }
        }
    };

    const FORMLET = props.FORMLET;

    return (
        <div className='drawer-form-container'>
            <div className='drawer-form-header-container'>
                <div>{props.title}</div>
            </div>
            <form onKeyDown={handleKeyPress}>
                <PalmyraForm formData={data} mode="edit" onValidChange={setValid}
                    customizer={props.customizer} ref={formRef} storeFactory={storeFactory}>
                    <FORMLET formData={data} />
                </PalmyraForm>
                <div className="drawer-form-btn-container">
                    <Button
                        className='cancel-filled-button'
                        onClick={onClose} tabIndex={-1}>
                        <Close className="button-icon" />
                        Cancel
                    </Button>
                    <Button disabled={!isValid}
                        className={!isValid ? 'disabled-button' : 'filled-button'}
                        onClick={saveFormData}>
                        <Done className="button-icon" />
                        <u style={{ width: '5px' }}>S</u>ave
                    </Button>
                </div>
            </form>
        </div>
    );
}
export default EditForm;