import { PalmyraGrid, PalmyraStoreFactory, topic } from "palmyra-rui";
import { ISummaryGridInput } from "../../Types";
import { FC, useEffect, useRef, useState } from "react";
import { Drawer } from '@mui/material';
import NewForm from "../drawer/NewForm";
import EditForm from "../drawer/EditForm";
import WidthConfig from "../../../config/WidthConfig";

interface IFormletInput {
    formData: any
}

interface IDrawerGridInput extends ISummaryGridInput {
    EditFormlet: FC,
    NewFormlet: FC<IFormletInput>,
    customizer?: any,
    gridRef?: any,
    errorText?: any,
    customButton?: any,
    title?: any
}

function SummaryDrawerGrid(props: IDrawerGridInput) {
    const storeFactory = new PalmyraStoreFactory({ baseUrl: "/api/palmyra" });
    const viewTopic = props.pageName + "/viewPage";
    const newTopic = props.pageName + "/newPage";
    const refreshTopic = props.pageName + "/refresh";
    const title: any = props.title;
    const formattedTitle = (title === title.toUpperCase())
        ? capitalizeWords(title.toLowerCase())
        : title;

    function capitalizeWords(str: string): string {
        return str.replace(/\b\w/g, match => match.toUpperCase());
    }

    const [data, setData] = useState<any>({});
    const [drawerOpen, setDrawerOpen] = useState<boolean>(false);
    const drawerWidth = WidthConfig.drawerWidth.width;
    const referenceCount = useRef<number>(0);

    const EditFormlet = props.EditFormlet;
    const NewFormlet = props.NewFormlet;
    const gridRef: any = props.gridRef || useRef(null);

    const actionOptions = {
        onClick: {
            topic: viewTopic
        },
        newRecord: {
            topic: newTopic
        }
    };

    useEffect(() => {
        var viewPageHandle = topic.subscribe(viewTopic, (_topicName, data) => {
            setData(data);
            setDrawerOpen(true);
        });

        var refreshHandle = topic.subscribe(refreshTopic, (_topicName) => {
            console.log('refresh called', gridRef.current)
            if (gridRef.current)
                gridRef.current.refresh();
        });

        var newPageHandle = topic.subscribe(newTopic, (_topicName, data) => {
            setData(data);
            setDrawerOpen(true);
        });
        return () => {
            topic.unsubscribe(viewPageHandle);
            topic.unsubscribe(newPageHandle);
            topic.unsubscribe(refreshHandle);
        }

    }, [data]);


    const closeDrawer = (refreshGrid: boolean, open: boolean = false, data?: any) => {
        setDrawerOpen(open);
        referenceCount.current += 1;
        setData(data);
        if (refreshGrid) {
            gridRef.current.refresh();
        }
    }

    const handleClose = () => {
        closeDrawer(false);
    }

    return (<>
        <div className='grid-renderer-container'>
            {/* <div className="grid-renderer-header">{props?.title}</div> */}
            <div className="palmyra-grid-container summary-drawer-grid">
                <PalmyraGrid title={title} columns={props.fields} endPoint={props.options.endPoint} pagination={props.pagination}
                    actions={actionOptions} ref={gridRef} customizer={props.customizer} customButton={props.customButton}
                    layoutParams={{}} storeFactory={storeFactory} exportOptions={props.exportOptions} densityOption={props.densityOptions}/>
            </div>
        </div>
        <Drawer anchor="right" PaperProps={{ sx: { width: drawerWidth } }}
            open={drawerOpen} onClose={() => closeDrawer(false)}>
            {drawerOpen ?
                (data?.id ?
                    <EditForm onSave={(refresh = true, drawerOpen = false, data?: any) => closeDrawer(refresh, drawerOpen, data)} id={data.id} onClose={handleClose}
                        options={props.options} pageName={props.pageName} FORMLET={EditFormlet}
                        title={"Edit " + formattedTitle} key={(referenceCount.current + 5) + ''}>

                    </EditForm> :
                    <NewForm onSave={(refresh = true, drawerOpen = false, data?: any) => closeDrawer(refresh, drawerOpen, data)} onClose={handleClose}
                        options={props.options} pageName={props.pageName} FORMLET={NewFormlet}
                        title={"New " + formattedTitle} errorText={props.errorText} key={(referenceCount.current + 2) + ''} >
                    </NewForm>)
                : <div>props?.title</div>}
        </Drawer>
    </>
    );
}

export type { IFormletInput }
export default SummaryDrawerGrid;