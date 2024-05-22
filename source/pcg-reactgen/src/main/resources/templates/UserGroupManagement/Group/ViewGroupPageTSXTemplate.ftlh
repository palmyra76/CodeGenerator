import { useParams } from "react-router-dom";
import { StringFormat } from "palmyra-rui";
import { useEffect, useState } from "react";
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import { Box, Button } from '@mui/material';
import { IPageInput } from "../../../templates/Types";
import AppStoreFactory from "../../../components/wire/StoreFactory";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { TabPanel } from "../../../components/tabs/TabPanel";
import ViewGroupForm from "./ViewGroupForm";
import UserPage from "./groupUser/UserPage";
import { TreeMenuEditor } from "../../../components/form";
import { ArrowBack } from '@mui/icons-material';
// import EditGroupPage from "./EditGroupPage";

const ViewGroupPage = (props: IPageInput) => {
    const params: any = useParams();
    const [group, setGroup] = useState<any>({})
    const [value, setValue] = useState<any>(0);
    // const [isEdit, setIsEdit] = useState(false);
    const store = AppStoreFactory;

    const groupEndPoint = StringFormat(ServiceEndpoint.aclmgmt.groupById, { id: params.id });
    const MenuEndPoint = StringFormat(ServiceEndpoint.aclmgmt.menuApi.aclMenuEditorApi, { groupId: params.id });

    const handleChange = (_event: React.SyntheticEvent, newValue: number) => {
        setValue(newValue);
    };

    useEffect(() => {
        const d: any = {};
        store.getFormStore(d, groupEndPoint, '').get({}).then((data) => {
            setGroup(data);
        });
    }, [])

    // const toggleEdit = () => {
    //     setIsEdit(!isEdit);
    // };

    return (
        <div>
            <Box>
                <div className="tab-header-container">
                    <Tabs value={value} onChange={handleChange} aria-label="basic tabs example" className="user-tabs">
                        <Tab label="General" className="user-tab" disableRipple />
                        <Tab label="Users" className="user-tab" disableRipple />
                    </Tabs>
                    <Button onClick={() => window.history.back()}
                        className='filled-button tab-btn-height'
                        disableRipple >
                        <ArrowBack className='button-icon' />
                        Back
                    </Button>
                </div>
            </Box>
            <Box sx={{ width: '100%' }}>
                <TabPanel value={value} index={0}>
                    <div className="user-form-container" >
                        <ViewGroupForm groupDetail={group} pageName={props.pageName} />
                        {/* {isEdit ? (
                            <EditGroupPage  pageName={props.pageName}  />
                        ) : (
                            <ViewGroupForm userDetail={user} pageName={props.pageName} toggleEdit={toggleEdit}/>
                        )} */}
                    </div>
                    <div className="user-form-container" >
                        <div className="acl-menu-editor">
                            <TreeMenuEditor storeFactory={store} endPoint={MenuEndPoint} groupId={params.id}
                                readOnly fineGrained />
                        </div>
                    </div>
                </TabPanel>
                <TabPanel value={value} index={1}>
                    <div className="user-page-grid-in-group user-form-container">
                        <UserPage groupId={params.id} pageName="Usergroup" />
                    </div>
                </TabPanel>
            </Box>
        </div>
    )
}

export default ViewGroupPage;