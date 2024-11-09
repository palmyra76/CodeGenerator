import { ColumnDefinition } from "@palmyralabs/rt-forms";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { SummaryGrid } from "@palmyralabs/template-stine";
import { SummaryGridControls } from "../../../components/gridControl/SummaryGridControls";

const UserPage = () => {

  const fields: ColumnDefinition[] = [
    {
      attribute: "displayName",
      name: "Display Name",
      label: "User Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "firstName",
      name: "First Name",
      label: "First Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "lastName",
      name: "Last Name",
      label: "Last Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "gender",
      name: "gender",
      label: "Gender",
      options: { M: 'Male', F: 'Female' },
      sortable: true,
      type: "select"
    },
    {
      attribute: "dob",
      name: "dob",
      label: "DOB",
      type: "date",
      displayPattern: 'DD-MM-YYYY'
    },
    {
      attribute: "userType.userType",
      name: "userType",
      label: "Role",
      type: "string"
    },
    {
      attribute: "email",
      name: "email",
      label: "Email",
      type: "string"
    },
    {
      attribute: "phoneNumber",
      name: "phoneNumber",
      label: "Phone Number",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "address",
      name: "address",
      label: "Address",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    }
  ];

  const pageName = "userManagement";

  return (
    <div className="grid-container">
      <SummaryGrid exportOptions={{ csv: 'Export CSV', pdf: 'Export PDF' }}
        columns={fields} pageName={pageName}
        title="USER MANAGEMENT" DataGridControls={SummaryGridControls}
        options={{ endPoint: ServiceEndpoint.userManagement.users.restApi }} />
    </div>
  )
}

export default UserPage;
