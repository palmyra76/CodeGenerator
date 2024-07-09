import { Dialog, DialogContent, ClickAwayListener } from "@mui/material";
import { Close, WarningAmber } from '@mui/icons-material';
import { Button } from "@mui/material";
import { getDialogAndEndpoint } from "./DeleteDialogContent";
import AppStoreFactory from "../wire/StoreFactory";
import { toast } from "react-toastify";
import { ServiceEndpoint } from "../../config/ServiceEndpoints";
import { StringFormat } from "palmyra-rui";

interface DataItem {
    endPoint: string;
    attributes: Record<string, string>;
    typeName: string;
}

interface DialogInput {
    isOpen?: any;
    onClose?: any;
    userData?: any;
    applicationData?: any
    groupData?: any;
    onDelete: Function;
    id?: any;
}

function DeleteConfirmDialog(props: DialogInput) {
    const openDialog = props.isOpen;
    const closeDialog = props.onClose;
    const userData = props.userData;
    const groupData = props.groupData;
    const onDelete = props.onDelete;
    const id = props.id;
    const storeFactory = AppStoreFactory;

    const groupByUserEndPoint = ServiceEndpoint.aclmgmt.GroupsByUser.deleteApi;
    const userByGroupEndPoint = ServiceEndpoint.aclmgmt.UsersByGroup.deleteApi;

    const dataItem: DataItem | undefined = userData ? {
        endPoint: StringFormat(groupByUserEndPoint, { groupId: userData.groupId, userId: userData.userId }),
        attributes: { "User Name": userData.loginName },
        typeName: 'User'
    } : groupData ? {
        endPoint: StringFormat(userByGroupEndPoint, { userId: groupData.userId, groupId: groupData.groupId }),
        attributes: { "Group Name": groupData.groupName },
        typeName: 'Group'
    } : undefined;

    const { endPoint, typeName, content } = getDialogAndEndpoint(dataItem);

    const successfullDeleteToast = () => {
       toast.success(`${r"${typeName}"} Deleted Successfully`);
    }

    const handleDelete = () => {
        storeFactory.getFormStore({}, endPoint, id)
            .remove({})
            .then((_d: any) => {
                onDelete();
                successfullDeleteToast();
                closeDialog();
            })
    }

    const handleKeyClose = (event: any) => {
        if (event.keyCode === 27) {
            closeDialog();
        }
    }
    return (
        <div >
            <Dialog open={openDialog} onClose={closeDialog} onKeyDown={handleKeyClose}
                PaperProps={{
                    sx: {
                        width: 'auto', minWidth: '500px', height: 'auto', borderRadius: '15px'
                    }
                }}>
                <ClickAwayListener onClickAway={closeDialog}>
                    <>
                        <div className="dialog-header-container">
                            <div className="dialog-header-text-container">
                                <div>Confirm !</div>
                            </div>
                            <div className="dialog-header-icon-container" onClick={closeDialog}>
                                <Close className="dialog-cancel-icon" />
                            </div>
                        </div>
                        <DialogContent>
                            <div className="dialog-confirm-text">
                                <WarningAmber className="dialog-warn-icon" />
                                Are you sure you want to delete this {typeName} ?
                            </div>
                            <div>
                                {content}
                            </div>
                            <div className="dialog-btn-container">
                                <Button onClick={handleDelete}
                                    className='filled-button'
                                    disableRipple>
                                    Yes
                                </Button>
                                <Button
                                    className='cancel-filled-button'
                                    disableRipple onClick={closeDialog}>
                                    No
                                </Button>
                            </div>
                        </DialogContent>
                    </>
                </ClickAwayListener>
            </Dialog>
        </div>
    );
}
export default DeleteConfirmDialog;