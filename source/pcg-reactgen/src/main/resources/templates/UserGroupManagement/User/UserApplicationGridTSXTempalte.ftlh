import { CheckboxGridEnhancer, ColumnDefinition, GridCustomizer, IGridEnhancer, IPageQueryable, StringFormat, gridColumnCustomizer } from "palmyra-rui";
import { useRef } from "react";
import SummaryGrid from "../../../../templates/default/grid/SummaryGrid";
import { Button } from '@mui/material';
import { Done } from '@mui/icons-material';
import axios from 'axios';
import { ServiceEndpoint } from "../../../../config/ServiceEndpoints";

interface IUserApplicationGrid {
    userId: number,
    onClose?: () => void,
    gridRefresh?: () => void
}

const UserApplicationGrid = (props: IUserApplicationGrid) => {
    const gridRef = useRef<IPageQueryable>(null);
    const gridEnhancer: IGridEnhancer = CheckboxGridEnhancer();

    const userId = props.userId;
    const onClose = props.onClose;
    const refresh = props.gridRefresh;

    const applocationLooupEndpoint = ServiceEndpoint.userApplicationByUser.lookup.restApi;
    const apiEndPoint = StringFormat(applocationLooupEndpoint, { userId: userId });
    const userApplicationApi = '/api/palmyra' + StringFormat(ServiceEndpoint.userApplicationByUser.restApi, { userId });

    const fields: ColumnDefinition[] = [
        {
            attribute: "name",
            name: "name",
            title: "Application",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "code",
            name: "code",
            title: "Code",
            searchable: true,
            quickSearch: true,
            type: "string"
        },
        {
            attribute: "prefix",
            name: "Prefix",
            title: "Prefix",
            searchable: true,
            quickSearch: true,
            type: "string"
        }
    ];

    const handleSave = () => {
        const selectedApplicationId = gridEnhancer.getSelectedIds();
        const applicationId = Object.keys(selectedApplicationId)
            .map(key => parseInt(key, 10))

        const requestBody = applicationId.map(id => ({
            applicationId: id
        }));

        axios.post(userApplicationApi, requestBody).then((_res) => {
            if (onClose) {
                onClose();
            }
            if (refresh) {
                refresh();
            }
        })
    }

    const gridCustomizer: GridCustomizer = { ...gridColumnCustomizer({}), ...gridEnhancer };
    const pageName = 'group'
    return (
        <div className="user-group-grid">
            <div className="user-dialog-group-grid">
                <SummaryGrid
                    fields={fields} pageName={pageName} disableViewTopic
                    title="APPLICATIONS" gridRef={gridRef} customizer={gridCustomizer}
                    options={{ endPoint: apiEndPoint }} />
            </div>
            <div>
                <div className="user-group-grid-btn-container">
                    <Button className={'filled-button'} disableRipple onClick={handleSave}>
                        <Done className="button-icon" />
                        Save
                    </Button>
                </div>
            </div>
        </div >
    )
}

export default UserApplicationGrid;