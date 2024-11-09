import { useParams } from "react-router-dom";
import { useState } from "react";
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import { Box } from '@mui/material';
import { IPageInput } from "../../../templates/Types";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { TabPanel } from "../../../components/tabs/TabPanel";
import ViewGroupForm from "./ViewGroupForm";
import UserPage from "./groupUser/UserPage";
import { TreeMenuEditor } from "../../../components/form";
import AppStoreFactory from "../../../wire/StoreFactory";
import { StringFormat } from "@palmyralabs/ts-utils";

const ViewGroupPage = (props: IPageInput) => {
    const [value, setValue] = useState<any>(0);
    const params: any = useParams();
    const store = AppStoreFactory;

    const MenuEndPoint = StringFormat(ServiceEndpoint.aclmgmt.menuApi.aclMenuEditorApi, { groupId: params.id });

    const handleChange = (_event: React.SyntheticEvent, newValue: number) => {
        setValue(newValue);
    };

    return (
        <div>
            <Box>
                <Tabs value={value} onChange={handleChange} aria-label="basic tabs example" className="user-tabs">
                    <Tab label="General" className="user-tab" disableRipple />
                    <Tab label="Users" className="user-tab" disableRipple />
                </Tabs>
            </Box>
            <Box sx={{ width: '100%' }}>
                <TabPanel value={value} index={0}>
                    <div className="user-form-container" >
                        <ViewGroupForm groupId={params.id} pageName={props.pageName} />
                    </div>
                    <div className="user-form-container" >
                        <div className="header-container">Menu List</div>
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