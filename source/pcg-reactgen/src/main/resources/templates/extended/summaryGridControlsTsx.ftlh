import { ExportDataButton, FilterButton, IDataGridDefaultControlConfig, QuickSearch } from "@palmyralabs/rt-forms-mui";
import { Button } from "@mui/material";
import { Add } from '@mui/icons-material';

interface IGridControlOption extends IDataGridDefaultControlConfig {

}
interface IOptions extends IGridControlOption {
    onNewClick?: any
}
const SummaryGridControls = (props: any) => {
    const { getPluginOptions, ...o } = props;
    const pluginOptions: IOptions = getPluginOptions ? getPluginOptions() : {};
    const handleNewClick = pluginOptions.onNewClick ? pluginOptions.onNewClick : () => props.newRecord();

    return (<>
        {o.quickSearch && <QuickSearch width="200" queryRef={o.queryRef}
            columns={o.columns} {...pluginOptions.quickSearch} />}
        <FilterButton {...o} />
        {pluginOptions.export?.visible &&
            <ExportDataButton exportOption={{ csv: 'CSV' }}
                visible={pluginOptions.export?.visible} disabled={pluginOptions.export?.disabled}
                queryRef={o.queryRef} {...pluginOptions.export} />}
        {(pluginOptions.add?.visible !== false) &&
            <Button onClick={handleNewClick} {...pluginOptions.add} className="py-action-button">
                <Add />
                Add</Button>}
    </>);
}

export { SummaryGridControls }