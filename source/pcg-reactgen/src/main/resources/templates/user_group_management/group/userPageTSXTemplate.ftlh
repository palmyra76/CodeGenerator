import { useRef, useState } from "react";
import { CellGetter, ColumnDefinition, GridCustomizer, IPageQueryable, StringFormat, gridColumnCustomizer, topic } from "palmyra-rui";
import { IPageInput } from "../../../../templates/Types";
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import { DeleteOutline } from '@mui/icons-material';
import GroupUserGrid from "./GroupUserGrid";
import DeleteConfirmDialog from "../../../../components/dialog/DeleteConfirmDialog";
import SummaryDialogGrid from "../../../../templates/default/grid/SummaryDialogGrid";

interface UserPageInput extends IPageInput {
  groupId?: number
}

const UserPage = (props: UserPageInput) => {
  const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false);
  const [data, setData] = useState<any>({});
  const gridRef = useRef<IPageQueryable>(null);

  const groupId = props.groupId;
  const endPoint = StringFormat(ServiceEndpoint.aclmgmt.GroupsByUser.restApi, { groupId: groupId });

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
    },
    {
      attribute: "groupName",
      name: "groupName",
      title: "Group Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "action",
      name: "action",
      title: "Action",
      type: 'string'
    }
  ];

  const customConfig: Record<string, ((d: CellGetter) => CellGetter)> = {
    'action': enhance
  }

  const handleRemove = (event: any, data: any) => {
    setData(data);
    setShowDeletePopup(true);
    event.stopPropagation();
  }

  const gridRefresh = () => {
    if (gridRef.current)
      gridRef.current.refresh();
  }

  const onDelete = () => {
    topic.publish(props.pageName + "/refresh", {});
  }

  function enhance(): CellGetter {
    return (info: any) => {
      const data: any = info.row.original;
      return (
        <div onClick={(e) => handleRemove(e, data)}>
          <DeleteOutline className="grid-action-icon" />
        </div>
      )
    };
  }

  const gridCustomizer: GridCustomizer = gridColumnCustomizer(customConfig);

  return (
    <div className="usermanagement-grid-container">
      <SummaryDialogGrid
        Child={GroupUserGrid} childProps={{ gridRefresh, groupId }}
        customizer={gridCustomizer} defaultParams={{ filter: { active: 1 } }}
        fields={fields} pageName={props.pageName}
        title="GROUP USERS" gridRef={gridRef} minWidth="800px"
        options={{ endPoint: endPoint }} />

      <DeleteConfirmDialog userData={data} onDelete={onDelete}
        isOpen={showDeletePopup} onClose={() => { setShowDeletePopup(false) }} />
    </div>
  )
}

export default UserPage;