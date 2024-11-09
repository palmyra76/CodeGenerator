import { ExportDataButton, FilterButton, IDataGridDefaultControlConfig, QuickSearch } from "@palmyralabs/rt-forms-mui";
import { Button } from "@mui/material";
import { Add } from '@mui/icons-material';

const PopupGridControls = (props: any) => {
    const { getPluginOptions, ...o } = props;
    const pluginOptions: IDataGridDefaultControlConfig = getPluginOptions ? getPluginOptions() : {};

    return (<>
        {o.quickSearch && <QuickSearch width="200" queryRef={o.queryRef}
            columns={o.columns} {...pluginOptions.quickSearch} />}
        <FilterButton {...o} />
        {pluginOptions.export?.visible &&
            <ExportDataButton exportOption={{ csv: 'CSV' }}
                visible={pluginOptions.export?.visible} disabled={pluginOptions.export?.disabled}
                queryRef={o.queryRef} {...pluginOptions.export} />}
        <Button disableRipple className="py-action-button" onClick={() => props.setFormData({})}
            {...pluginOptions.add}>
            <Add />
            Add</Button>
    </>);
}

export { PopupGridControls }