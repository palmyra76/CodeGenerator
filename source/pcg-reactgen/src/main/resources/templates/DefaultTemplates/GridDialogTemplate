import { Close } from '@mui/icons-material';

interface DialogGridInput {
    onClose?: any,
    Child?: any,
    childProps?: Record<any, any>,
    dialogeTitle?: any
}
const GridDialog = (props: DialogGridInput) => {
    const onClose = props.onClose;
    const Child = props.Child;
    const childProps = props.childProps || {};
    const dialogTitle = props.dialogeTitle;

    const ChildPorps = { ...childProps, onClose };
    return (
        <div>
            <div className='grid-dialog-header-container'>
                <div className='grid-dialog-header-left-container'>
                    <span className='grid-dialog-header-text'>{dialogTitle}</span>
                </div>
                <div className='grid-dialog-header-right-container'>
                    <Close onClick={onClose} className='grid-dialog-header-close-icon' />
                </div>
            </div>
            <div className='grid-dialog-content-container'>
                <Child {...ChildPorps} />
            </div>
        </div>
    )
}

export default GridDialog
