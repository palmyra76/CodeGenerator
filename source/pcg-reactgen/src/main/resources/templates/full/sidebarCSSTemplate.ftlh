.sidebar {
    color: var(--sidebar-color);
    background-color: var(--sidebar-bgcolor);
    height: 100vh;
    position: relative;
}

.tree-menu,
.tree-menu-list{
    display: flex !important;
    gap: 20px !important;
    justify-content: space-between;
    padding-left: 10px !important;
}

.sidebar-footer {
    /* padding: 5px; */
    width: 250px;
    position: fixed;
    bottom: 0;
    text-align: center;
}

.sidebar-title {
    display: flex;
    align-items: center;
    font-weight: bold !important;
    font-size: var(--primary-fontsize) !important;
    gap: 5px;
    width: 100% !important;
    color: var(--sidebar-title-color);
}

.sidebar-logo-text {}

.sidebar-logo-subtext {
    font-size: 15px;
    font-weight: 100;
    color: rgba(255, 255, 255, 0.65);
}

.sidebar-title.minimized {
    display: flex;
    align-items: center;
    gap: 25px;
    width: 100% !important;
}

.sidebar-title-menu-icon {
    cursor: pointer;
    color: var(--sidebar-icon-color)
}

.sidebar-header .MuiToolbar-root {
    margin-bottom: 0px;
}

.sidebar-header {
    /* margin-bottom: 20px; */
}

.css-1vxbjdn-MuiToolbar-root {
    margin-bottom: 0px !important;
    padding-left: 16px !important;
}

.sidebar-footer-text {
    color: var(--sidebar-footer-color);
    font-size: 13px;
    font-kerning: normal;
    letter-spacing: 0.05rem;
    bottom: 0;
}

.css-snhrq-MuiStack-root {
    /* width: auto !important; */
}

.MuiTypography-root {
    line-height: 17px !important;
}

/* .sidebar-middle {
    .MuiTreeView-root {
        height: 85vh;
    }

    .MuiTreeItem-content .MuiTreeItem-iconContainer {
        display: none !important;
        width: 0px !important;
        margin: 0 !important;
        padding: 35px 0px 0px 0px !important;
    }

    .MuiTreeItem-content {
        padding: 6px !important;
        padding-left: 15px !important;
    }

    .MuiTreeItem-content:hover {
        background-color: var(--sidebar-hover-list-bgcolor) !important;
        color: var(--sidebar-hover-list-color) !important;
        border-radius: 5px !important;
    }


    .MuiTreeItem-content.Mui-selected {
        background-color: var(--sidebar-select-list-bgcolor) !important;
        color: var(--sidebar-select-list-color) !important;
        border-radius: 5px !important;
    }

    .MuiTreeItem-group {
        margin-left: 35px !important;
    }
} */

.sidebar-middle {
    height: calc(100% - 110px);
    overflow: auto;

    .async-tree-menu-list:hover {
        background-color: rgb(198, 198, 198, 0.1);
        color: white;
    }

    .async-tree-menu-selected-list {
        background-color: rgb(198, 198, 198, 0.3);
        color: white;
    }
}