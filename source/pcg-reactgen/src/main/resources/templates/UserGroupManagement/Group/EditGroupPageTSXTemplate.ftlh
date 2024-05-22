import { FieldGroupContainer, StringFormat } from "palmyra-rui";
import { RadioGroup, TextField, TreeMenuEditor } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { IPageInput } from "../../../templates/Types";
import { useParams } from "react-router-dom";
import AppStoreFactory from "../../../components/wire/StoreFactory";
import MenuForm from "../../../templates/default/form/MenuForm";
import { useRef } from "react";

const EditGroupPage = (props: IPageInput) => {
    const params: any = useParams();
    const treeRef = useRef<any>();

    const apiEndPoint = ServiceEndpoint.aclmgmt.group;
    const MenuEndPoint = StringFormat(ServiceEndpoint.aclmgmt.menuApi.aclMenuEditorApi, { groupId: params.id });
    const store = AppStoreFactory;
    return (
        <div>
            <div className="user-form-container">
                <MenuForm id={params.id} title="Edit Group" pageName={props.pageName} options={{ endPoint: apiEndPoint }} treeRef={treeRef}>
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
                                  ]}
                            />
                            <TextField attribute="description"
                                title="Description" colspan={2}
                                validationRule={"string"}
                                length={{ min: 3, message: "Minimum of 3 letters" }}
                            />
                        </FieldGroupContainer>
                    </div>
                </MenuForm>

            </div>
            <div className="user-form-container">
                <div className="acl-menu-editor">
                    <TreeMenuEditor storeFactory={store} endPoint={MenuEndPoint} groupId={params.id}
                        ref={treeRef} fineGrained />
                </div>
            </div>
        </div>
    )
}

export default EditGroupPage;