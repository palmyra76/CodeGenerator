import { ColumnDefinition } from "palmyra-rui";
import SummaryGrid from "../../../templates/default/grid/SummaryGrid";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { IPageInput } from "../../../templates/Types";

const UserPage = (props: IPageInput) => {

  const fields: ColumnDefinition[] = [
    {
      attribute: "displayName",
      name: "Display Name",
      title: "User Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "firstName",
      name: "First Name",
      title: "First Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "lastName",
      name: "Last Name",
      title: "Last Name",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "gender",
      name: "gender",
      title: "Gender",
      options: { M: 'Male', F: 'Female' },
      sortable: true,
      type: "select"
    },
    {
      attribute: "dob",
      name: "dob",
      title: "DOB",
      type: "date"
    },
    {
      attribute: "userType.userType",
      name: "userType",
      title: "Role",
      type: "string"
    },
    {
      attribute: "email",
      name: "email",
      title: "Email",
      type: "string"
    },
    {
      attribute: "phoneNumber",
      name: "phoneNumber",
      title: "Phone Number",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    },
    {
      attribute: "address",
      name: "address",
      title: "Address",
      searchable: true,
      sortable: true,
      quickSearch: true,
      type: "string"
    }
  ];

  return (
    <div>
      <SummaryGrid
        fields={fields} pageName={props.pageName}
        title="USER MANAGEMENT"
        options={{ endPoint: ServiceEndpoint.userManagement.users.restApi }} />
    </div>
  )
}

export default UserPage;
