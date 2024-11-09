import { DataGridPluginOptions } from "@palmyralabs/rt-forms";
import { ExportDataButton, FilterButton, IDataGridDefaultControlConfig, QuickSearch } from "@palmyralabs/rt-forms-mui";
import { Add } from '@mui/icons-material';
import { Button } from "@mui/material";

interface IOptions extends IDataGridDefaultControlConfig {
    onNewClick?: any
}
const DataGridControls = (props: DataGridPluginOptions) => {
    const { getPluginOptions, ...o } = props;
    const pluginOptions: IOptions = getPluginOptions ? getPluginOptions() : {};
    const handleNewClick = pluginOptions.onNewClick ? pluginOptions.onNewClick : () => { };

    return (<>
        {o.quickSearch && <QuickSearch width="200" queryRef={o.queryRef}
            columns={o.columns} {...pluginOptions.quickSearch} />}
        <FilterButton {...o} />
        <ExportDataButton exportOption={{ csv: 'CSV' }}
            visible={pluginOptions.export?.visible} disabled={pluginOptions.export?.disabled}
            queryRef={o.queryRef} {...pluginOptions.export} />
        {(pluginOptions.add?.visible !== false) &&
            <Button onClick={handleNewClick} {...pluginOptions.add} className="py-action-button">
                <Add />
                Add</Button>}
    </>);
}

export { DataGridControls }