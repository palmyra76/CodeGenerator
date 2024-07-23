import { CellGetter, ColumnDefinition, GridCustomizer, IPageQueryable, StringFormat, gridColumnCustomizer, topic } from "palmyra-rui";
import { useRef, useState } from "react";
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import { DeleteOutline } from '@mui/icons-material';
import DeleteConfirmDialog from "../../../../components/dialog/DeleteConfirmDialog";
import { IPageInput } from "../../../../templates/Types";
import UserGroupGrid from "./UserGroupGrid";
import { SummaryDialogGrid } from "palmyra-template";
import AppStoreFactory from "../../../../components/wire/StoreFactory";

interface UserPageInput extends IPageInput {
    userId?: number
}
const UsersGroup = (props: UserPageInput) => {
    const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false);
    const [data, setData] = useState<any>({});
    const gridRef = useRef<IPageQueryable>(null);

    const userId = props.userId;
    const apiEndPoint = StringFormat(ServiceEndpoint.aclmgmt.UsersByGroup.restApi, { userId: userId });
    const store = AppStoreFactory;

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
            title: "Group",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "displayName",
            name: "displayName",
            title: "User Name",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "loginName",
            name: "loginName",
            title: "Login Name",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "active",
            name: "active",
            title: "Active",
            type: 'string',
            cellRenderer: statusRenderer
        },
        {
            attribute: "action",
            name: "action",
            title: "Action",
            type: 'string'
        }
    ];

    const gridRefresh = () => {
        if (gridRef.current) {
            gridRef.current.refresh();
        }
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
    const gridCustomizer: GridCustomizer = gridColumnCustomizer(customConfig);
    return (
        <div className="user-group-grid">
            <SummaryDialogGrid
                storeFactory={store} Child={UserGroupGrid} dialogeTitle='Group List'
                childProps={{ userId, gridRefresh }} defaultParams={{ filter: { active: 1 } }}
                fields={fields} pageName={props.pageName} customizer={gridCustomizer}
                title="USER GROUPS" gridRef={gridRef} minWidth="800px"
                options={{ endPoint: apiEndPoint, endPointVars: { userId: props.userId } }} />

            <DeleteConfirmDialog groupData={data} onDelete={onDelete}
                isOpen={showDeletePopup} onClose={() => { setShowDeletePopup(false) }} />
        </div>
    )
}

export default UsersGroup;