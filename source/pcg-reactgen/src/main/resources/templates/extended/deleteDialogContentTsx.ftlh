interface DataItem {
    endPoint: string;
    attributes: Record<string, string>;
    typeName: string;
}

interface DialogData {
    endPoint: string;
    typeName: string;
    content: JSX.Element | null;
}

export function getDialogAndEndpoint(dataItem?: DataItem): DialogData {
    const content = dataItem ? (
        <div className="dialog-data-content">
            {Object.entries(dataItem.attributes).map(([label, value], index) => (
                <div className="dialog-data-content-field" key={index}>
                    <span className="dialog-data-content-field-label">{label}:</span>
                    <div className="dialog-data-content-field-data">{value}</div>
                </div>
            ))}
        </div>
    ) : null;

    let endPoint = dataItem ? dataItem.endPoint : '/defaultEndpoint';

    return { endPoint, typeName: dataItem?.typeName ?? 'default', content };
}