import { useRef } from "react";
import { Button } from '@mui/material';
import { Done } from '@mui/icons-material';
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import axios from 'axios';
import { CheckboxGridEnhancer, ColumnDefinition, GridCustomizer, IGridEnhancer, IPageQueryable, useGridColumnCustomizer } from "@palmyralabs/rt-forms";
import { StringFormat } from "@palmyralabs/ts-utils";
import { PalmyraGrid } from "@palmyralabs/rt-forms-mui";

interface IUserGroupGrid {
    userId: number,
    onClose: () => void,
    gridRefresh: () => void
}

const UserGroupGrid = (props: IUserGroupGrid) => {
    const gridRef = useRef<IPageQueryable>(null);
    const gridEnhancer: IGridEnhancer = CheckboxGridEnhancer();

    const userId = props.userId;
    const onClose = props.onClose;
    const refresh = props.gridRefresh;

    const groupLooupEndpoint = ServiceEndpoint.aclmgmt.UsersByGroup.lookup.restApi;
    const apiEndPoint = StringFormat(groupLooupEndpoint, { userId: userId });
    const aclGroupApi = '/api/palmyra' + StringFormat(ServiceEndpoint.aclmgmt.UsersByGroup.restApi, { userId });

    const fields: ColumnDefinition[] = [
        {
            attribute: "name",
            name: "name",
            label: "Group",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "description",
            name: "description",
            label: "Description",
            searchable: true,
            quickSearch: true,
            type: "string"
        }
    ];

    const handleSave = () => {
        const selectedUserId = gridEnhancer.getSelectedIds();
        const groupId = Object.keys(selectedUserId)
            .map(key => parseInt(key, 10))

        const requestBody = groupId.map(id => ({
            groupId: id
        }));

        axios.post(aclGroupApi, requestBody).then((_res) => {
            onClose();
            refresh();
        })
    }

    const gridCustomizer: GridCustomizer = { ...useGridColumnCustomizer({}), ...gridEnhancer };
    return (
        <div className="user-group-grid">
            <div className="user-dialog-group-grid">
                <PalmyraGrid endPoint={apiEndPoint}
                    columns={fields} title="GROUPS" ref={gridRef} customizer={gridCustomizer} />
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