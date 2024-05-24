import { PalmyraGrid, PalmyraStoreFactory, StringFormat, topic } from "palmyra-rui";

import { ISummaryGridInput } from "../../Types";
import { useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";

interface IDrawerGridInput extends ISummaryGridInput {
    customizer?: any,
    gridRef?: any,
    errorText?: any,
    customButton?: any,
    title?: any
}

function SummaryEditGrid(props: IDrawerGridInput) {
    const fields = props.fields;
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });

    const navigate = useNavigate();
    const editTopic = props.pageName + "/editPage";
    const newTopic = props.pageName + "/newPage";
    const refreshTopic = props.pageName + "/refresh";
    const idKey = props.options.idProperty || 'id';
    const gridRef: any = props.gridRef || useRef(null);

    const actionOptions = {
        onClick: {
            topic: editTopic
        },
        newRecord: {
            topic: newTopic
        }
    }

    useEffect(() => {
        //@ts-ignore
        var editPageHandle = topic.subscribe<any>(editTopic, (topicName, data) => {
            data.id = data[idKey];
            navigate(StringFormat('edit/{id}', data));
        });
        //@ts-ignore
        var newPageHandle = topic.subscribe(newTopic, (topicName, data) => {
            navigate(StringFormat('new', data));
        });

        var refreshHandle = topic.subscribe(refreshTopic, (_topicName) => {
            console.log('refresh called', gridRef.current)
            if (gridRef.current)
                gridRef.current.refresh();
        })

        return () => {
            topic.unsubscribe(editPageHandle);
            topic.unsubscribe(newPageHandle);
            topic.unsubscribe(refreshHandle);
        }
    }, [idKey, fields]);

    return (
        <div className='grid-renderer-container'>
            {/* <div className="grid-renderer-header-container">
                <div className="grid-renderer-header">
                    {props?.title}
                </div>
                <div>
                    {props.headerLeftContent}
                </div>
            </div> */}
            <div className="palmyra-grid-container summary-edit-grid">
                <PalmyraGrid columns={fields} customizer={props.customizer} exportOptions={props.exportOptions}
                    actions={actionOptions} pagination={props.pagination} title={props.title}
                    endPoint={props.options.endPoint} ref={gridRef} customButton={props.customButton}
                    layoutParams={{}} storeFactory={storeFactory} densityOption={props.densityOptions}/>
            </div>
        </div>
    );
}
export default SummaryEditGrid;