import { useRef } from "react";
import { CheckboxGridEnhancer, ColumnDefinition, GridCustomizer, IGridEnhancer, IPageQueryable, StringFormat, gridColumnCustomizer } from "palmyra-rui";
import { Button } from '@mui/material';
import { Done } from '@mui/icons-material';
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import axios from 'axios';
import SummaryGrid from "../../../../templates/default/grid/SummaryGrid";

interface IGroupUserGrid {
    groupId: number,
    onClose?: any
    gridRefresh?: any
}

const GroupUserGrid = (props: IGroupUserGrid) => {
    const gridRef = useRef<IPageQueryable>(null);
    const groupId = props.groupId;
    const onClose = props.onClose;
    const refresh = props.gridRefresh;

    const gridEnhancer: IGridEnhancer = CheckboxGridEnhancer();
    const userLooupEndpoint = ServiceEndpoint.aclmgmt.GroupsByUser.lookup.restApi;
    const apiEndPoint = StringFormat(userLooupEndpoint, { groupId: groupId });

    const fields: ColumnDefinition[] = [
        {
            attribute: "displayName",
            name: "displayName",
            title: "User Name",
            sortable: true,
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "loginName",
            name: "loginName",
            title: "Login Name",
            sortable: true,
            searchable: true,
            quickSearch: true,
            type: "string"
        }
    ];

    const aclGroupApi = '/api/palmyra' + StringFormat(ServiceEndpoint.aclmgmt.GroupsByUser.restApi, { groupId: groupId });

    const handleSave = () => {
        const selectedUserId = gridEnhancer.getSelectedIds();
        const userId = Object.keys(selectedUserId)
            .map(key => parseInt(key, 10))

        const requestBody = userId.map(id => ({
            userId: id
        }));

        axios.post(aclGroupApi, requestBody).then((_res) => {
            onClose();
            refresh();
        })
    }
    
    const gridCustomizer: GridCustomizer = { ...gridColumnCustomizer({}), ...gridEnhancer };
    const pageName = 'group'

    return (
        <div className="user-group-grid">
            <div className="user-dialog-group-grid">
                <SummaryGrid
                    fields={fields} pageName={pageName} disableViewTopic
                    title="GROUP USERS" gridRef={gridRef} customizer={gridCustomizer}
                    options={{ endPoint: apiEndPoint }} />
            </div>
            <div>
                <div className="user-group-grid-btn-container">
                    <Button className={'filled-button'} disableRipple onClick={handleSave}>
                        <Done className="button-icon" />
                        Save
                    </Button>
                </div>
            </div>
        </div >
    )
}

export default GroupUserGrid;