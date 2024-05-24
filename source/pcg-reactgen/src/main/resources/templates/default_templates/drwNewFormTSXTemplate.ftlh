import { PalmyraForm, PalmyraStoreFactory, usePalmyraNewForm } from "palmyra-rui";
import { IFormNewInput } from "../../Types";
import { FC, useRef, useState } from "react";
import { Done, Close } from '@mui/icons-material';
import { Button } from "@mui/material";
import { IFormletInput } from "../grid/SummaryDrawerGrid";
import { toast } from 'react-toastify';

interface IDrawerNewInput extends IFormNewInput {
    onSave: Function
    onClose: () => void,
    FORMLET: FC<IFormletInput>,
    errorText?: any
}

function NewForm(props: IDrawerNewInput) {
    const errorText = props.errorText;
    const onClose = props.onClose;
    const FORMLET = props.FORMLET;
    const [isValid, setValid] = useState<boolean>(false);
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });
    const action = useRef<string>('none');

    const formListener: any = {
        //@ts-ignore
        onSaveSuccess: function (data: any): void {
            if (action.current == 'new') {
                props.onSave(true, true, {})
            } else
                props.onSave(true, false, {});
        },
        onSaveFailure: function (e: any): void {
            console.error('Error while saving', e);
        },
        onChange: function (): void {
        }
    };
    //@ts-ignore
    const pageName = props.pageName;

    const { data, saveData, formRef } = usePalmyraNewForm({
        formListener, initialData: {},
        storeFactory, endPoint: props.options.endPoint
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

    const saveForm = (a: string) => {
        action.current = a;
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
        if (event.ctrlKey && event.key === 'b') {
            event.preventDefault();
            if (isValid) {
                saveForm('new');
            }
        }
        if (event.ctrlKey && event.key === 's') {
            event.preventDefault();
            if (isValid) {
                saveForm('close');
            }
        }
    };
    return (
        <div className='drawer-form-container'>
            <div className='drawer-form-header-container'>
                <div>{props.title}</div>
            </div>
            <form onKeyDown={handleKeyPress}>
                <PalmyraForm formData={data} mode="new" onValidChange={setValid}
                    customizer={props.customizer} ref={formRef} storeFactory={storeFactory}>
                    <FORMLET formData={{}} />
                </PalmyraForm>
                <div className="drawer-form-btn-container">
                    <Button tabIndex={-1}
                        className='cancel-filled-button'
                        onClick={onClose}>
                        <Close className="button-icon" />
                        Cancel
                    </Button>
                    <Button disabled={!isValid}
                        className={!isValid ? 'disabled-button save-new-btn' : 'filled-button save-new-btn'}
                        onClick={() => saveForm('new')}>
                        <Done className="button-icon" />
                        <u style={{width:'5px'}}>S</u>ave & New
                    </Button>
                    <Button disabled={!isValid}
                        className={!isValid ? 'disabled-button save-close-btn' : 'filled-button save-close-btn'}
                        onClick={() => saveForm('close')}>
                        <Done className="button-icon" />
                        <u style={{width:'5px'}}>S</u>ave & Close
                    </Button>
                </div>
            </form>
        </div>
    );
}
export default NewForm;