import { useParams } from "react-router-dom";
import { useRef } from "react";
import { FieldGroupContainer, RadioGroup, TextField, TreeMenuEditor } from "../../../components/form";
import { ServiceEndpoint } from "../../../config/ServiceEndpoints";
import { IPageInput } from "../../../templates/Types";
import MenuForm from "../../../templates/default/form/MenuForm";
import AppStoreFactory from "../../../wire/StoreFactory";
import { StringFormat } from "@palmyralabs/ts-utils";

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
                                title="Group" validRule={"string"}
                                required={true} autoFocus
                                length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                            <RadioGroup attribute="active" title="Status"
                                options={[
                                    { value: 1, label: 'Active' },
                                    { value: 0, label: 'De-Active' }
                                ]} />
                            <TextField attribute="description"
                                title="Description" colspan={2}
                                validRule={"string"}
                                length={{ min: 3, errorMessage: "Minimum of 3 letters" }} />
                        </FieldGroupContainer>
                    </div>
                </MenuForm>
            </div>
            <div className="user-form-container">
                <div className="header-container">Edit Menu List</div>
                <div className="acl-menu-editor">
                    <TreeMenuEditor storeFactory={store} endPoint={MenuEndPoint} groupId={params.id}
                        ref={treeRef} fineGrained />
                </div>
            </div>
        </div>
    )
}

export default EditGroupPage;