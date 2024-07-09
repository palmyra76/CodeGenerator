import { ColumnDefinition, GridCustomizer, IPageQueryable, gridColumnCustomizer } from "palmyra-rui";
import { useRef } from "react";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { SummaryGrid } from "palmyra-template";
import AppStoreFactory from "../../../components/wire/StoreFactory";

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

const GroupPage = () => {
  const gridRef = useRef<IPageQueryable>(null);
  const apiEndPoint = ServiceEndpoint.aclmgmt.group;
  const store = AppStoreFactory;

  const fields: ColumnDefinition[] = [
    {
      attribute: "name",
      name: "group",
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
    },
    {
      attribute: "active",
      name: "active",
      title: "Status",
      type: 'string',
      cellRenderer: statusRenderer
    }
  ];

  const gridCustomizer: GridCustomizer = gridColumnCustomizer({});
  const pageName = 'group'
  return (
    <div className="user-group-grid">
      <SummaryGrid
        storeFactory={store} fields={fields} pageName={pageName}
        title="GROUPS" gridRef={gridRef} customizer={gridCustomizer}
        options={{ endPoint: apiEndPoint }} />
    </div>
  )
}

export default GroupPage;