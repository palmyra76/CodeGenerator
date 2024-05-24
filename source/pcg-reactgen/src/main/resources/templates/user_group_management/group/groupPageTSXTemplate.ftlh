import { ColumnDefinition, GridCustomizer, IPageQueryable, gridColumnCustomizer } from "palmyra-rui";
import { useRef } from "react";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import SummaryGrid from "../../../templates/default/grid/SummaryGrid";

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

  // const FormLet: FC = () => <>
  //   <div className="palmyra-form-field-container-wrapper">
  //     <FieldGroupContainer >
  //       <TextField attribute="name"
  //         title="Group"
  //         validationRule={"string"}
  //         required={true} autoFocus
  //         length={{ min: 3, message: "Minimum of 3 letters" }}
  //       />
  //       <RadioGroup attribute="active" title="Status"
  //         options={{ 1: 'Active', 0: 'Disabled' }} />
  //       <TextField attribute="description"
  //         title="Description" colspan={2}
  //         validationRule={"string"}
  //         length={{ min: 3, message: "Minimum of 3 letters" }}
  //       />
  //     </FieldGroupContainer>
  //   </div>

  // </>

  const gridCustomizer: GridCustomizer = gridColumnCustomizer({});
  const pageName = 'group'
  return (
    <div className="user-group-grid">
      <SummaryGrid
        fields={fields} pageName={pageName}
        title="GROUPS" gridRef={gridRef} customizer={gridCustomizer}
        options={{ endPoint: apiEndPoint }} />
    </div>
  )
}

export default GroupPage;