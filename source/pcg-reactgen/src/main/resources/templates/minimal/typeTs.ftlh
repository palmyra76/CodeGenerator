import { FC } from "react"

interface IViewHandler {
    options: IOptions,
    Component: FC
}

interface IEditHandler {
    options: IOptions,
    Component: FC
}

interface INewHandler {
    options: IOptions,
    Component: FC
}

interface IGridHandler {
    options: IOptions
}

interface IOptions {
    endPoint: string,
    idProperty: string,
    title: string
}

export type { IEditHandler, IViewHandler, INewHandler, IGridHandler, IOptions }