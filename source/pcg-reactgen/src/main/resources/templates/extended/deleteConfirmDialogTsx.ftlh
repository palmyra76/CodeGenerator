import { Dialog, DialogContent, ClickAwayListener } from "@mui/material";
import { Close, WarningAmber } from '@mui/icons-material';
import { Button } from "@mui/material";
import { getDialogAndEndpoint } from "./DeleteDialogContent";
import { toast } from "react-toastify";
import AppStoreFactory from "../../wire/StoreFactory";

interface DialogInput {
    isOpen?: any;
    onClose?: any;
    data?: any;
    userData?: any;
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

    const handleKeyClose = (event: any) => {
        if (event.keyCode === 27) {
            closeDialog();
        }
    }

    const { endPoint, dialogData, content } = getDialogAndEndpoint(userData, groupData);

    const successfullDeleteToast = () => {
        if (userData) {
            toast.success('User Deleted Successfully');
        } else if (groupData) {
            toast.success('Group Deleted Successfully');
        }
    }

    const handleDelete = () => {
        storeFactory.getFormStore({}, endPoint, id)
            .remove({})
            .then((_d: any) => {
                onDelete();
                successfullDeleteToast();
                closeDialog()
            })
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
                                Are you sure you want to delete this {dialogData} ?
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