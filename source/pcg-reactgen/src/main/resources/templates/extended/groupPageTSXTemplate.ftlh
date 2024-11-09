import { useRef } from "react";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { ColumnDefinition, GridCustomizer, IPageQueryable, useGridColumnCustomizer } from "@palmyralabs/rt-forms";
import { SummaryGrid } from "@palmyralabs/template-stine";
import { SummaryGridControls } from "../../../components/gridControl/SummaryGridControls";

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

  const fields: ColumnDefinition[] = [
    {
      attribute: "name",
      name: "group",
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
    },
    {
      attribute: "active",
      name: "active",
      label: "Status",
      type: 'string',
      cellRenderer: statusRenderer
    }
  ];

  const gridCustomizer: GridCustomizer = useGridColumnCustomizer({});
  const pageName = 'group';

  return (
    <div className="grid-container">
      <SummaryGrid DataGridControls={SummaryGridControls}
        columns={fields} pageName={pageName}
        title="GROUPS" gridRef={gridRef} customizer={gridCustomizer}
        options={{ endPoint: apiEndPoint }} />
    </div>
  )
}

export default GroupPage;