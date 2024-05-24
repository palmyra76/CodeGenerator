import { useParams } from "react-router-dom";
import { FieldGroupContainer } from "palmyra-rui";
import NewForm from "../../../templates/default/form/NewForm";
import { IPageInput } from "../../../templates/Types";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { RadioGroup, TextField } from "../../../components/form";

const NewGroupPage = (props: IPageInput) => {
    const params: any = useParams();
    const apiEndPoint = ServiceEndpoint.aclmgmt.group;
    return (
        <div className="user-form-container">
            <NewForm id={params.id} title="New Group" pageName={props.pageName}
                options={{ endPoint: apiEndPoint }}>
                <div className="palmyra-form-field-container-wrapper">
                    <FieldGroupContainer columns={2}>
                        <TextField attribute="name"
                            title="Group"
                            validationRule={"string"}
                            required={true} autoFocus
                            length={{ min: 3, message: "Minimum of 3 letters" }}
                        />
                        <RadioGroup attribute="active" title="Status"
                            options={[
                                { value: 1, label: 'Active' },
                                { value: 0, label: 'Disabled' }
                            ]} defaultValue={1} />
                        <TextField attribute="description"
                            title="Description" colspan={2}
                            validationRule={"string"}
                            length={{ min: 3, message: "Minimum of 3 letters" }}
                        />
                    </FieldGroupContainer>
                </div>
            </NewForm>
        </div>
    )
}

export default NewGroupPage;