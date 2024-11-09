:root {
    --primary-fontsize: 1.5em;
    --secondary-fontsize: 0.9em;
    --left-menu-fontsize: 1.01em;

    --card-box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
}

/* -- Mantine Css -- */
.MuiDrawer-docked {
    z-index: 1 !important;
}

.mantine-Modal-title,
.mantine-Drawer-title {
    font-weight: bold !important;
    font-size: 18px !important;
}

.py-dataGrid-header-text {
    letter-spacing: initial;
}

/* --page not found-- */

.page-not-found-container {
    position: fixed;
    height: 100vh;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    text-align: center;
    align-items: center;
    display: flex;
    justify-content: center;
}

.page-not-found-container .btn-container {
    margin-top: 1em;
}

.error-404 {
    font-size: 3.5vw;
    color: rgba(var(--dark-bgcolor-rgb), 0.35);
}

.error-404-text {
    font-size: 1.5vw;
    color: rgba(var(--dark-bgcolor-rgb), 0.55);
}

.text-view-label {
    text-align: left;
    color: rgba(var(--dark-bgcolor-rgb), 0.55);
}

.text-view-field-container {
    width: 100%;
}

.text-view-value {
    margin-top: 5px;
}

.topbar {
    box-shadow: none !important;
    border: 2px solid rgb(220, 220, 220, 1);
    height: 64px !important;
}

.grid-container,
.grid-container-mt {
    background-color: var(--secondary-text-color);
    border-radius: 10px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
}

.grid-container-mt {
    margin-top: 1em;
    padding: 1em;
}

.base-grid-container {
    padding: 10px;
}

.add-icon {
    font-size: 24px !important;
}

.MuiButton-startIcon {
    margin-right: 0 !important;
}

/* text style h series */
.h2 {
    font-size: 1.5em;
}

.h3 {
    font-size: 1em;
    font-weight: 600;
}

.h4 {
    font-size: 0.8em;
    color: var(--dark-bgcolor);
    font-weight: bold;
}

/* --Sweet Alert -- */
.swal2-timer-progress-bar {
    background-color: var(--error-color) !important;
}

.custom-header {
    background-color: #007bff;
    color: var(--default-bgcolor);
    padding: 10px;
    text-align: start;
    font-size: 22px;
    font-family: sans-serif;
    border-top-right-radius: 5px;
    border-top-left-radius: 5px;
}

.custom-text {
    margin-top: 10px;
    font-size: 20px;
    color: #474747 !important;
    font-family: sans-serif;
}

.custom-btn {
    margin: 0;
    background-color: #007bff !important;
    color: var(--default-bgcolor);
}

.custom-icon {
    color: var(--default-bgcolor);
}

.custom-width {
    width: 400px !important;
}

.MuiPaginationItem-root.Mui-selected {
    border-radius: 7px;
}

.grid-renderer-container .grid-footer .MuiInput-input.MuiSelect-select,
.card-pagination .MuiInput-input.MuiSelect-select {
    border: 1.2px solid #80808047;
    padding: 5px 0px 5px 5px;
    padding-right: 25px !important;
    border-radius: 2px;
    background-color: var(--default-bgcolor);
}

.MuiInput-input.MuiSelect-select::after {
    border-bottom: none !important;
}

.MuiInput-root::after,
.MuiInput-root::before {
    border-bottom: 1px solid #dedede !important;
}

.MuiFormLabel-asterisk {
    color: var(--error-color) !important;
}

.topbar-avathar {
    display: flex;
    margin-left: auto;
    padding: 1px 20px 0px 20px;
    gap: 10px;
    align-items: center;
    vertical-align: middle;
    cursor: pointer;
}

.filled-button:active,
.secondary-filled-button:active,
.cancel-filled-button:active,
.default-filled-button:active {
    transform: scale(0.98);
}

.status-button,
.filled-button,
.add-img-button {
    border-radius: 5px !important;
    gap: 5px !important;
    font-size: 14px !important;
    text-transform: none !important;
    cursor: pointer;
}

.secondary-filled-button {
    border-radius: 5px !important;
    gap: 5px !important;
    font-size: 14px !important;
    cursor: pointer;
    text-transform: none !important;
}

.cancel-filled-button {
    border-radius: 5px !important;
    gap: 5px !important;
    font-size: 14px !important;
    cursor: pointer;
    text-transform: none !important;
}

.cancel-oulined-button {
    border-radius: 5px !important;
    gap: 5px !important;
    font-size: 14px !important;
    border: 1px solid !important;
    cursor: pointer;
    text-transform: none !important;
}

.default-filled-button {
    border-radius: 5px !important;
    gap: 8px !important;
    font-size: 14px !important;
    cursor: pointer;
    text-transform: none !important;
    border: 1px solid var(--border-color) !important;
}

.outlined-button {
    border-radius: 5px !important;
    font-size: 14px !important;
    gap: 8px !important;
    border: 1px solid !important;
    text-transform: none !important;
    cursor: pointer;
}

.outlined-button:hover {
    box-shadow: none !important;
}

.button-icon {
    font-size: 16px !important;
    margin-left: 0px !important;
    vertical-align: middle !important;
    cursor: pointer !important;
}

.disabled-button {
    border-radius: 5px !important;
    gap: 5px !important;
    text-transform: none !important;
    cursor: not-allowed;
}

/* -- Grid Dialog-- */
.grid-dialog .MuiDialog-paper {
    min-width: 800px !important;
}

.grid-dialog-header-right-container {
    text-align: end;
    background-color: var(--cancel-btn-bgcolor);
    color: var(--cancel-btn-color);
    padding: 5px 5px 0 5px;
    border-radius: 5px;
    text-align: end;
}

.grid-dialog-header-text {
    font-weight: bold;
    font-size: 18px;
}

.grid-dialog-content-container {
    padding: 10px;
}

.acl-menu-editor .tree-node-group {
    padding-left: 15px;
}

.user-group-grid {
    padding: 1em;
}

.user-group-grid-btn-container {
    text-align: end;
    padding: 2em 0 0 0;
}

/* --Library Style-- */

/* -- Taps & TapPanel userManagement & groups -- */
.user-tabs {
    gap: 50px !important;
}

.tab-header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.MuiTabs-flexContainer {
    gap: 5px !important;
}

.user-tab {
    min-height: 2vh !important;
    color: #716f6f !important;
    border-top-right-radius: 15px !important;
    border-top-left-radius: 5px !important;
    font-size: 16px !important;
    text-transform: capitalize !important;
    transition: background-color 0.3s ease;
}

.user-tab:hover {
    color: var(--default-bgcolor) !important;
    background-color: rgba(7, 80, 175, 0.596) !important;
}

.MuiTab-root.Mui-selected {
    color: var(--filled-btn-bgcolor) !important;
    background-color: var(--default-bgcolor) !important;
    border: 1.1px solid rgba(128, 128, 128, 0.284);
    border-bottom: none;
}

.MuiTabs-indicator {
    background-color: var(--filled-btn-bgcolor) !important;
}

/* -- Form -- */
.header-container {
    padding: 0.8em;
    font-size: 1.3em;
}

.form-container {
    padding: 10px;
    background-color: var(--secondary-text-color);
    border-radius: 10px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
}

.form-header-container {
    display: flex;
    justify-content: space-between;
    font-size: 20px;
    padding: 10px 10px 20px 10px;
}

.form-header-text {
    color: rgba(var(--dark-bgcolor-rgb), 1);
}

.form-header-btn-container {
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: end;
    gap: 10px;
}

.form-btn-container {
    display: flex;
    align-items: center;
    gap: 10px;
    justify-content: end;
    padding: 1.5em 0.5em;
}

.form-header-text {
    width: 50% !important;
    text-align: start !important;
}

.form-button-container {
    width: 50% !important;
    text-align: end !important;
}

/* -- Grid -- */
.header-content-text {
    color: var(--dark-bgcolor);
    font-weight: bold;
}

.grid-action-icon {
    color: rgba(var(--dark-bgcolor-rgb), 0.5);
}

/* -- Drawer --  */
.search-drawer .MuiDrawer-paper {
    width: 30%;
}

.drawer-form-container {
    align-items: end;
    margin-top: 10px;
    padding: 10px;
}

.drawer-form-container .rule-drawer-btn-container {
    padding: 20px 5px 10px 0px;
    display: flex;
    justify-content: end;
    gap: 10px;
}

.drawer-form-header-container {
    display: flex;
    align-items: center;
    padding: 5px;
    justify-content: space-between;
    font-size: 21px;
    margin-bottom: 10px;
}

.drawer-form-header {
    font-size: 19px;
}

.drawer-form-btn-container {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-top: 25px;
}

/* --Dialoge-- */
.dialog-container {
    min-width: 500px !important;
}

.dialog-btn {
    background-color: rgb(102, 124, 146) !important;
}

.dialog-btn:hover {
    background-color: rgb(53, 70, 87) !important;
}

.param-dialoge-box .MuiDialog-paper {
    min-width: 450px !important;
}

.dialog-header-container {
    display: flex;
    padding: 20px;
    justify-content: space-between;
    width: auto;
}

.dialog-header-text-container {
    width: 50%;
    font-weight: bold;
    font-size: 1.2em;
}

.dialog-header-icon-container {
    text-align: end;
    background-color: var(--cancel-btn-bgcolor);
    color: var(--cancel-btn-color);
    padding: 5px 5px 0 5px;
    border-radius: 5px;
}

.dialog-cancel-icon {
    cursor: pointer;
}

.dialog-header-border {
    border: 1px solid;
}

.dialog-content-container {
    padding: 20px;
}

.dialog-footer-btn-container {
    text-align: end;
    padding: 15px;
    padding-right: 40px;
}

.dialog-confirm-text {
    font-size: 17px;
    display: flex;
    align-items: center;
    gap: 20px;
}

.dialog-warn-icon {
    font-size: 28px !important;
    margin-left: 0px !important;
    vertical-align: middle !important;
    color: var(--warning-color);
}

.dialog-data-content {
    padding: 20px 0 0 50px;

}

.dialog-data-content-field {
    display: flex;
    align-items: center;
    gap: 10px;
    justify-content: space-around;
}

.dialog-data-content-field-label {
    width: 100%;
}

.dialog-data-content-field-data {
    width: 100%;
}

.dialog-btn-container {
    display: flex;
    align-items: center;
    gap: 10px;
    justify-content: end;
    padding: 40px 10px 10px 0;
}

.reset-pwd-dialog .dialog-header-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px 15px 0px 15px;
}

.reset-pwd-dialog .dialog-content {
    margin: 20px 20px 30px 20px;
}

.reset-pwd-dialog .dialog-header-text {
    text-align: left;
    font-size: 18px;
    font-weight: bold;
}

.reset-pwd-form-container {
    margin-top: 0px;
}

.reset-pwd-form-btn-container {
    display: flex;
    align-items: center;
    justify-content: end;
    gap: 10px;
    margin-top: 30px;
    text-align: center;
    padding: 0 20px 20px 0;
}

/* -- User Page -- */

.user-form-container {
    margin-top: 10px;
    background-color: var(--default-bgcolor);
    border-radius: 10px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
}

.user-form-container .acl-menu-editor {
    padding: 0 10px 10px 10px;
}

.user-form-container .grid-renderer-container {
    border-radius: 10px;
}