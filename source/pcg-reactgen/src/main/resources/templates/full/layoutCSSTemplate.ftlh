:root {
    --primary-fontsize: 1.5em;
    --secondary-fontsize: 0.9em;
    --left-menu-fontsize: 1.01em;
}

.topbar {
    box-shadow: none !important;
    border: 2px solid rgb(220, 220, 220, 1);
    height: 64px !important;
}

/* --Sweet Alert -- */
.swal2-timer-progress-bar {
    background-color: red !important;
}

.custom-header {
    background-color: #007bff;
    color: #fff;
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
    color: #fff;
}

.custom-icon {
    color: #fff;
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
    background-color: white;
}

.MuiInput-input.MuiSelect-select::after {
    border-bottom: none !important;
}

.MuiInput-root::after,
.MuiInput-root::before {
    border-bottom: 1px solid #dedede !important;
}

.MuiFormLabel-asterisk {
    color: red !important;
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

.avatar {
    font-size: 30px !important;
}

.avathar-name {
    font-size: 1.1rem;
    cursor: pointer;
}

.dropdown-content {
    position: absolute;
    top: 85%;
    right: 0.5%;
    z-index: 1;
    padding: 8px;
    border-radius: 4px;
}

.dropdown-content ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

.dropdown-content li {
    display: flex;
    gap: 10px;
    align-items: center;
    padding: 8px;
    cursor: pointer;
}

.dropdown-content li:hover {
    border-radius: 3px;
}

.filled-button {
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

.grid-filter-content {
    padding: 10px 30px 10px 30px;
}

.grid-dialog-header-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 20px;
}

.grid-dialog-header-left-container {
    width: 50%;
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

.grid-dialog-header-close-icon {
    cursor: pointer;
}

.acl-menu-editor .tree-node-group {
    padding-left: 15px;
}

.user-group-grid .group-grid-custom-btn {
    display: none;
}

.user-group-grid-btn-container {
    text-align: end;
    padding: 10px;
}

.user-dialog-group-grid .grid-add-btn {
    display: none;
}

.user-dialog-group-grid .group-grid-custom-btn {
    display: block;
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
    color: #ffffff !important;
    background-color: rgba(7, 80, 175, 0.596) !important;
}

.MuiTab-root.Mui-selected {
    color: var(--filled-btn-bgcolor) !important;
    background-color: white !important;
    border: 1.1px solid rgba(128, 128, 128, 0.284);
    border-bottom: none;
}

.MuiTabs-indicator {
    background-color: var(--filled-btn-bgcolor) !important;
}

/* -- Form -- */

.form-container {
    padding: 10px;
}

.form-header-container {
    display: flex;
    justify-content: space-between;
    font-size: 20px;
    margin-top: 10px;
    padding: 20px;
    margin-bottom: 15px;
}

.form-header-btn-container {
    width: 50%;
    display: flex;
    align-items: center;
    justify-content: end;
    gap: 10px;
}

.form-header-text {
    width: 50% !important;
    text-align: start !important;
}

.form-button-container {
    width: 50% !important;
    text-align: end !important;
}

/* -- View Form -- */

.user-view-form-container {
    padding: 10px;
}

/* -- Grid -- */
.grid-header-right-content-text {
    color: black;
    font-weight: bold;
}

.MuiTableContainer-root {
    max-height: 75vh;
    overflow: auto;
}

.MuiTableHead-root {
    position: sticky;
    top: 0;
    background-color: rgba(248, 248, 248);
}

.MuiTable-root {
    border-collapse: unset !important;
}

.table-footer {
    position: sticky;
    bottom: 0;
}

.palmyra-grid-container {
    width: 100%;
    /* padding: 20px; */
    margin-top: 10px;
}

/* .summary-drawer-grid .table-row,
.summary-edit-grid .table-row,
.summary-grid .table-row {
    cursor: pointer;
} */
.table-row {
    cursor: pointer !important;
}

.palmyra-grid-container .table-row {
    cursor: default;
}

.palmyra-grid-header-container {
    width: 100%;
    padding: 0px 0px 10px 0px;
    /* margin-bottom: 20px; */
    border-bottom: 1px solid;
}

.palmyra-grid-header-text-container {
    width: 50%;
}

.palmyra-grid-header-btn-container {
    width: 50%;
}

.palmyra-grid-header-text {
    font-size: 18px;
}

.palmyra-grid-table-container {
    width: auto;
    margin-top: 20px;
}

.grid-renderer-header {
    font-weight: lighter;
    border-bottom: 1px solid;
    /* margin-bottom: 20px; */
    padding: 0px 0px 10px 0px;
}

.grid-renderer-container {
    padding: 10px;
    /* margin-top: 5px; */
}

.header-content-text {
    color: black;
    font-weight: bold;
}

/* .grid-action-icon {} */

/* -- Column Sum -- */
.columnsum-container {
    display: block;
    padding: 7px 7px 7px 0;
    justify-content: end;
    gap: 10px;
}

.columnsum-label-text {
    font-weight: lighter;
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
    /* width: 100%; */
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

.cash-transfer-dialog .drawer-form-btn-container {
    padding: 20px;
    margin: 0px;
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
    /* padding-top: 10px; */
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

/* --View Form Style Changes-- */

.view-form .MuiAutocomplete-endAdornment,
.view-form .MuiIconButton-root {
    display: none;
}

.view-form .MuiInput-root::after,
.view-form .MuiInput-root::before,
.view-form .MuiInput-root:hover,
.view-form .MuiInput-root:focus,
.view-form .MuiOutlinedInput-notchedOutline {
    border: none !important;
    border-bottom: none !important;
}

/* -- User Page -- */

/* -- User Page -- */

.user-form-container {
    margin-top: 10px;
    background-color: white;
    border-radius: 10px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
}

.user-form-container .acl-menu-editor {
    padding: 10px;
}

.user-form-container .grid-renderer-container {
    border-radius: 10px;
}

.usermanagement-grid-container .grid-export-btn,
.client-grid-container .grid-export-btn,
.process-allocation-grid-container .grid-export-btn,
.process-grid-container .grid-export-btn,
.user-group-grid .grid-export-btn {
    display: none;
}

/** Dashboard Style **/
.dashboard-container {
    padding: 10px;
}

.dashboard-heading {
    font-weight: bold;
    font-size: 1.2em;
    padding: 20px;
    color: var(--heading-text-color);
}

.dashboard-top-container {
    background-color: var(--dashboard-container-bgcolor);
    box-shadow: var(--dashboard-container-boxshadow);
    border-radius: 5px;
}

.dashboard-chart-container {
    margin-top: 20px;
    display: flex;
    align-items: center;
    gap: 20px;
}

.dashboard-left-chart-container {
    background-color: var(--dashboard-container-bgcolor);
    box-shadow: var(--dashboard-container-boxshadow);
    width: 50%;
    height: 350px;
    padding: 20px;
    border-radius: 5px;
}

.dashboard-right-chart-container {
    background-color: var(--dashboard-container-bgcolor);
    box-shadow: var(--dashboard-container-boxshadow);
    width: 50%;
    height: 350px;
    padding: 20px;
    border-radius: 5px;
}

.dashboard-top-container {
    display: flex;
    justify-content: space-between;
}

.dashboard-lookup-container {
    width: 50%;
}

/** Server Detail Style **/

.server-detail-grid .grid-add-btn {
    display: none;
}


.application-details-card {
    height: 450px;
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
    padding: 10px;
}

.application-details-card-header {
    text-align: center;
    text-transform: capitalize;
}

.count-display-label {
    color: rgba(0, 0, 0, 0.5);
}

.palmyra-chart-container-wrapper{
    height : 290px !important;
}