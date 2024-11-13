import { useRef, useState } from "react";
import { IPageInput } from "../../../../templates/Types";
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";
import { DeleteOutline } from '@mui/icons-material';
import GroupUserGrid from "./GroupUserGrid";
import DeleteConfirmDialog from "../../../../components/dialog/DeleteConfirmDialog";
import { CellGetter, ColumnDefinition, GridCustomizer, IPageQueryable, useGridColumnCustomizer } from "@palmyralabs/rt-forms";
import { StringFormat } from "@palmyralabs/ts-utils";
import { PalmyraGrid } from "@palmyralabs/rt-forms-mui";
import { Dialog } from "@mui/material";
import { DataGridControls } from "../../../../components/gridControl/DataGridControls";

interface UserPageInput extends IPageInput {
  groupId?: number
}

const UserPage = (props: UserPageInput) => {

  const gridRef = useRef<IPageQueryable>(null);
  const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false);
  const [data, setData] = useState<any>({});
  const [open, setOpen] = useState<boolean>(false);

  const groupId = props.groupId;
  const endPoint = StringFormat(ServiceEndpoint.aclmgmt.GroupsByUser.restApi, { groupId: groupId });

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
    },
    {
      attribute: "groupName",
      name: "groupName",
      label: "Group Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "action",
      name: "action",
      label: "Action",
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
    gridRef.current.refresh();
  }

  const onDelete = () => {
    gridRefresh()
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

  const gridCustomizer: GridCustomizer = useGridColumnCustomizer(customConfig);
  const getPluginOptions = (): any => {
    return { export: { visible: false }, onNewClick: () => setOpen(true) }
  }
  return (
    <div className="user-group-grid">
      <PalmyraGrid defaultParams={{ filter: { active: 1 } }} DataGridControls={DataGridControls}
        columns={fields} customizer={gridCustomizer}
        title="USERS GROUPS" ref={gridRef} endPoint={endPoint} getPluginOptions={getPluginOptions} />

      <Dialog open={open} onClose={() => setOpen(false)}
        title="Group Dialog">
        <GroupUserGrid groupId={groupId} gridRefresh={gridRefresh} onClose={() => setOpen(false)} />
      </Dialog>

      <DeleteConfirmDialog userData={data} onDelete={onDelete}
        isOpen={showDeletePopup} onClose={() => { setShowDeletePopup(false) }} />
    </div>
  )
}

export default UserPage;
