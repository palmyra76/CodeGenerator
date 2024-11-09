import { useRef } from "react";
import { Button } from '@mui/material';
import { Done } from '@mui/icons-material';
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import axios from 'axios';
import { CheckboxGridEnhancer, ColumnDefinition, GridCustomizer, IGridEnhancer, IPageQueryable, useGridColumnCustomizer } from "@palmyralabs/rt-forms";
import { StringFormat } from "@palmyralabs/ts-utils";
import { PalmyraGrid } from "@palmyralabs/rt-forms-mui";

interface IGroupUserGrid {
    groupId: number,
    onClose: () => void,
    gridRefresh?: () => void
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
            label: "User Name",
            sortable: true,
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "loginName",
            name: "loginName",
            label: "Login Name",
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

    const gridCustomizer: GridCustomizer = { ...useGridColumnCustomizer({}), ...gridEnhancer };
    return (
        <div className="user-group-grid">
            <div className="user-dialog-group-grid">
                <PalmyraGrid endPoint={apiEndPoint}
                    columns={fields} title="GROUP USERS" ref={gridRef} customizer={gridCustomizer} />
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