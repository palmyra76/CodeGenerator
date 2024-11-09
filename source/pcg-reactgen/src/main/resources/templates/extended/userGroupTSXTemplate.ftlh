import { useRef, useState } from "react";
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import { DeleteOutline } from '@mui/icons-material';
import { IPageInput } from "../../../../templates/Types";
import UserGroupGrid from "./UserGroupGrid";
import DeleteConfirmDialog from "../../../../components/dialog/DeleteConfirmDialog";
import { CellGetter, ColumnDefinition, GridCustomizer, IPageQueryable, useGridColumnCustomizer } from "@palmyralabs/rt-forms";
import { StringFormat, topic } from "@palmyralabs/ts-utils";
import { PalmyraGrid } from "@palmyralabs/rt-forms-mui";
import { DataGridControls } from "../../../../components/gridControl/DataGridControls";
import { Dialog } from "@mui/material";

interface UserPageInput extends IPageInput {
    userId?: number
}

const UsersGroup = (props: UserPageInput) => {
    const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false);
    const [data, setData] = useState<any>({});
    const [open, setOpen] = useState<any>(false);
    const gridRef = useRef<IPageQueryable>(null);

    const userId = props.userId;
    const apiEndPoint = StringFormat(ServiceEndpoint.aclmgmt.UsersByGroup.restApi, { userId: userId });

    const statusRenderer = (data: any) => {
        let type: String;
        switch (data.row.original.active) {
            case 1:
                type = 'Active';
                break;
            case 0:
                type = 'De-Active';
                break;
            default:
                type = 'Unknown';
        }

        return <span>{type}</span>;
    };

    const fields: ColumnDefinition[] = [
        {
            attribute: "groupName",
            name: "groupName",
            label: "Group",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "displayName",
            name: "displayName",
            label: "User Name",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "loginName",
            name: "loginName",
            label: "Login Name",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "active",
            name: "active",
            label: "Active",
            type: 'string',
            cellRenderer: statusRenderer
        },
        {
            attribute: "action",
            name: "action",
            label: "Action",
            type: 'string'
        }
    ];

    const gridRefresh = () => {
        gridRef.current.refresh();
    }

    const customConfig: Record<string, ((d: CellGetter) => CellGetter)> = {
        'action': enhance
    }

    const handleDelete = (event: any, data: any) => {
        setData(data);
        setShowDeletePopup(true);
        event.stopPropagation();
    }

    const onDelete = () => {
        topic.publish(props.pageName + "/refresh", {});
        gridRefresh();
    }

    function enhance(): CellGetter {
        return (info: any) => {
            const data: any = info.row.original;
            return (
                <div onClick={(e) => handleDelete(e, data)}>
                    <DeleteOutline className="grid-action-icon" />
                </div>
            )
        };
    }

    const gridCustomizer: GridCustomizer = useGridColumnCustomizer(customConfig);
    const getPluginOptions = (): any => {
        return { export: { visible: false }, onNewClick: () => setOpen(true) }
    }
    return (
        <div className="user-group-grid">
            <PalmyraGrid defaultParams={{ filter: { active: 1 } }} DataGridControls={DataGridControls}
                columns={fields} customizer={gridCustomizer}
                title="USERS GROUPS" ref={gridRef} endPoint={apiEndPoint} getPluginOptions={getPluginOptions} />

            <Dialog open={open} onClose={close}
                title="Group Dialog"
                >
                <UserGroupGrid userId={userId} gridRefresh={gridRefresh} onClose={close} />
            </Dialog>
            <DeleteConfirmDialog groupData={data} onDelete={onDelete}
                isOpen={showDeletePopup} onClose={() => { setShowDeletePopup(false) }} />
        </div>
    )
}

export default UsersGroup;