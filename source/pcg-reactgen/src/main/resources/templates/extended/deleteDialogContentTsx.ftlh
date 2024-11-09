import { StringFormat } from "@palmyralabs/ts-utils";
import { ServiceEndpoint } from "../../config/ServiceEndpoints";

interface DialogData {
    endPoint: string;
    dialogData: string;
    content: JSX.Element | null;
}
export function getDialogAndEndpoint(userData?: any, groupData?: any): DialogData {
    let content: JSX.Element | null = null;
    let endPoint = '/defaultEndpoint';
    let dialogData = 'default data';

    const groupByUserEndPoint = ServiceEndpoint.aclmgmt.GroupsByUser.deleteApi;
    const userByGroupEndPoint = ServiceEndpoint.aclmgmt.UsersByGroup.deleteApi;

    if (userData?.userId) {
        content = (
            <div className="dialog-data-content">
                <div className="dialog-data-content-field">
                    <span className="dialog-data-content-field-label"> User Name:</span>
                    <div className="dialog-data-content-field-data">{userData.loginName}</div>
                </div>
            </div>
        );
        endPoint = StringFormat(groupByUserEndPoint, { groupId: userData.groupId, userId: userData.userId });
        dialogData = 'user';
    } else if (groupData?.groupId) {
        content = (
            <div className="dialog-data-content">
                <div className="dialog-data-content-field">
                    <span className="dialog-data-content-field-label">Group Name: </span>
                    <div className="dialog-data-content-field-data">{groupData.groupName}</div>
                </div>
            </div>
        );
        endPoint = StringFormat(userByGroupEndPoint, { userId: groupData.userId, groupId: groupData.groupId });
        dialogData = 'group';
    }else{
        content=(
            <>none</>
        )
    }

    return { endPoint: endPoint, dialogData: dialogData, content: content };
}
