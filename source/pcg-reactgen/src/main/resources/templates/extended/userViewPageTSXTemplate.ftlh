import { useParams } from "react-router-dom";
import { IPageInput } from "../../../templates/Types";
import Tabs from '@mui/material/Tabs';
import Tab from '@mui/material/Tab';
import { Box } from '@mui/material';
import { TabPanel } from "../../../components/tabs/TabPanel";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { useEffect, useState } from "react";
import UserViewForm from "./UserViewForm";
import UsersGroup from "./userGroup/UsersGroup";
import AppStoreFactory from "../../../wire/StoreFactory";
import { StringFormat } from "@palmyralabs/ts-utils";


const UserViewPage = (props: IPageInput) => {
    const [user, setUser] = useState<any>({})
    const [value, setValue] = useState<any>(0)
    const params: any = useParams();
    const store = AppStoreFactory;
    const usersEndPoint = StringFormat(ServiceEndpoint.userManagement.usersById.restApi, { id: params.id });

    const handleChange = (_event: React.SyntheticEvent, newValue: number) => {
        setValue(newValue);
    };

    useEffect(() => {
        const d: any = {};
        store.getFormStore(d, usersEndPoint, '').get({}).then((data) => {
            setUser(data);
        });
    }, [])

    return <div>
        <Box>
            <Tabs value={value} onChange={handleChange} aria-label="basic tabs example" className="user-tabs">
                <Tab label="General" className="user-tab" disableRipple />
                <Tab label="Groups" className="user-tab" disableRipple />
            </Tabs>
        </Box>
        <Box sx={{ width: '100%' }} className="user-form-container">
            <TabPanel value={value} index={0}>
                <UserViewForm userDetail={user} pageName={props.pageName} id={params.id}/>
            </TabPanel>
            <TabPanel value={value} index={1}>
                <div>
                    <UsersGroup userId={params.id} pageName="usersGroup"/>
                </div>
            </TabPanel>
        </Box>
    </div>
}

export default UserViewPage;