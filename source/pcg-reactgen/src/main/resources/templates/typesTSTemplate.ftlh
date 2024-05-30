import { ColumnDefinition, IEndPoint, IExportOptions, IFormCustomizer } from "palmyra-rui"

interface IPageInput {
    title?: string,
    pageName: string,
    errorText?: any
}

interface IOptions {
    endPoint: IEndPoint,
    queryOptions?: {
        filter?: any
    },
    endPointVars?: Record<string, any>
    idProperty?: string
}

interface IFormEditInput extends IPageInput {
    options: IOptions,
    id: string,
    children?: any,
    customizer?: IFormCustomizer,
    onDataRefresh?: (data: any) => void
}


interface IFormNewInput extends IPageInput {
    options: IOptions,
    children?: any,
    id?: string,
    customizer?: IFormCustomizer,
    formListener?: any
}

interface IFormViewInput extends IPageInput {
    options: IOptions,
    id: string,
    children: any
}

interface ISummaryGridInput extends IPageInput {
    options: IOptions,
    fields: ColumnDefinition[],
    pagination?: number[],
    exportOptions?: IExportOptions,
    densityOptions?: any
}

export type { IPageInput, IFormEditInput, IFormNewInput, IFormViewInput, ISummaryGridInput }