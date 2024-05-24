import { CheckboxGridEnhancer, ColumnDefinition, GridCustomizer, IGridEnhancer, IPageQueryable, StringFormat, gridColumnCustomizer } from "palmyra-rui";
import { useRef } from "react";
import SummaryGrid from "../../../../templates/default/grid/SummaryGrid";
import { Button } from '@mui/material';
import { Done } from '@mui/icons-material';
import axios from 'axios';
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";

interface IUserGroupGrid {
    userId: number,
    onClose?: () => void,
    gridRefresh?: () => void
}

const UserGroupGrid = (props: IUserGroupGrid) => {
    const gridRef = useRef<IPageQueryable>(null);
    const gridEnhancer: IGridEnhancer = CheckboxGridEnhancer();

    const userId = props.userId;
    const onClose: any = props.onClose;
    const refresh: any = props.gridRefresh;

    const groupLooupEndpoint = ServiceEndpoint.aclmgmt.UsersByGroup.lookup.restApi;
    const apiEndPoint = StringFormat(groupLooupEndpoint, { userId: userId });
    const aclGroupApi = '/api/palmyra' + StringFormat(ServiceEndpoint.aclmgmt.UsersByGroup.restApi, { userId });

    const fields: ColumnDefinition[] = [
        {
            attribute: "name",
            name: "name",
            title: "Group",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "description",
            name: "description",
            title: "Description",
            searchable: true,
            quickSearch: true,
            type: "string"
        }
    ];

    const handleSave = () => {
        const selectedGroupId = gridEnhancer.getSelectedIds();
        const groupId = Object.keys(selectedGroupId)
            .map(key => parseInt(key, 10))

        const requestBody = groupId.map(id => ({
            groupId: id
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
                    title="GROUPS" gridRef={gridRef} customizer={gridCustomizer}
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

export default UserGroupGrid;