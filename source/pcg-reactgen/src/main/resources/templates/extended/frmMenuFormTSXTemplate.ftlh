import { PalmyraForm, PalmyraStoreFactory, StringFormat } from "palmyra-rui";
import { IFormEditInput } from "../../Types";
import { useEffect, useRef, useState } from "react";
import { Button } from "@mui/material";
import { Done, Close } from '@mui/icons-material';
import { useNavigate } from "react-router-dom";
import { toast } from 'react-toastify';
import axios from 'axios';
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";

interface input extends IFormEditInput {
    treeRef?: any
}

function MenuForm(props: input) {
    const [isValid, setValid] = useState<boolean>(false);
    const [data, setData] = useState();
    const formRef = useRef<any>()
    const navigate = useNavigate();

    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });
    const treeRef = props.treeRef;
    const pageName = props.pageName;
    const endPoint = 'api/palmyra/admin/acl/group/' + props.id;
    const rootMenuApi = 'api/palmyra' + StringFormat(ServiceEndpoint.aclmgmt.menuApi.aclPutMenuEditorApi, { groupId: props.id });
    // const formDataApi = 'api/palmyra' + StringFormat(ServiceEndpoint.aclmgmt.groupById, { id: props.id });

    useEffect(() => {
        if (props.onDataRefresh) {
            props.onDataRefresh(data);
        }
    }, [data])

    useEffect(() => {
        axios.get(endPoint).then((res) => {
            setData(res.data.result);
        })
    }, [endPoint]);

    const showServerErrorToast = () => {
        toast.error("Something went wrong Please try again later.. ")
    }

    const submitValue = () => {
        const rootMenu = treeRef?.current?.getValue();
        const formData = formRef?.current?.getData();
        const request = { ...formData, rootMenu: rootMenu };

        axios
            .put(rootMenuApi, request)
            .then(function () {
                navigate('../' + pageName + '/view/' + props.id);
                toast.success("Data Saved Successfully!.. ");
            })
            .catch(function () {
                showServerErrorToast();
            })
    }

    const handleKeyPress = (event: any) => {
        if (event.ctrlKey && event.key === 's') {
            event.preventDefault();
            if (isValid) {
                submitValue();
            }
        }
    };

    useEffect(() => {
        if (formRef?.current?.isValid) {
            if (formRef.current.isValid()) {
                setValid(true);
            }
        }
    }, [formRef.current])
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
                            disableRipple onClick={submitValue}>
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
export default MenuForm;

