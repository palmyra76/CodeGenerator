:root {
    /** Do not modify the below configuration, modify the above elements only for theming */

    --identify-color: var(--primary-color);

    --primary-bgcolor-rgb: var(--primary-color-rgb);
    --primary-bgcolor: var(--primary-color);
    --secondary-bgcolor-rgb: var(--secondary-color-rgb);
    --secondary-bgcolor: var(--secondary-color);
    --default-bgcolor-rgb: var(--default-color-rgb);
    --default-bgcolor: var(--default-color);
    --disable-bgcolor-rgb: var(--disabled-color-rgb);
    --disable-bgcolor: var(--disabled-color);
    --dark-bgcolor-rgb: var(--dark-color-rgb);
    --dark-bgcolor: var(--dark-color);

    --primary-text-color-rgb: var(--primary-color-rgb);
    --primary-text-color: var(--primary-color);
    --secondary-text-color-rgb: var(--default-color-rgb);
    --secondary-text-color: var(--default-color);
    --default-text-color-rgb: var(--dark-color-rgb);
    --default-text-color: var(--dark-color);
    --disable-text-color-rgb: var(--disabled-color-rgb);
    --disable-text-color: var(--disabled-color);

    --primary-input-text-color-rgb: var(--primary-color-rgb);
    --primary-input-text-color: var(--primary-color);
    --secondary-input-text-color-rgb: var(--default-color-rgb);
    --secondary-input-text-color: var(--default-color);
    --default-input-text-color-rgb: var(--dark-color-rgb);
    --default-input-text-color: var(--dark-color);
    --disable-input-text-color-rgb: var(--disabled-color-rgb);
    --disable-input-text-color: var(--disabled-color);

    --primary-border-color-rgb: var(--primary-color-rgb);
    --primary-border-color: var(--primary-color);
    --secondary-border-color-rgb: var(--disabled-color-rgb);
    --secondary-border-color: var(--disabled-color);
    --default-border-color-rgb: var(--dark-color-rgb);
    --default-border-color: var(--dark-color);
    --disable-border-color-rgb: var(--disabled-color-rgb);
    --disable-border-color: var(--disabled-color);

    --default-link-color-rgb: var(--dark-color-rgb);
    --default-link-color: var(--dark-color);
    --disable-link-color-rgb: var(--disabled-color-rgb);
    --disable-link-color: var(--disabled-color);

    /**  App Specific configuration starts - used in few places / exception items */
    --dashboard-heading-text-color: var(--dark-bgcolor);
    --dashboard-container-boxshadow: rgba(var(--dark-bgcolor-rgb), 0.15) 0px 1px 2px 0px, rgba(var(--dark-bgcolor-rgb), 0.15) 0px 1px 3px 1px;
    --dashboard-container-bgcolor: var(--default-bgcolor);
    --dashboard-header-icon-bgcolor: rgb(120, 75, 255, 0.2);
    --dashboard-header-icon-color: rgb(120, 75, 255);
    --card-header-bgcolor: rgb(189, 221, 236);

    --cancel-btn-bgcolor: rgba(255, 0, 0, 0.08);
    --cancel-button-bgcolor: var(--default-bgcolor);
    --cancel-btn-color: rgba(255, 0, 0, 1);
    --default-btn-bgcolor: var(--default-bgcolor);
    --default-btn-color: var(--dark-bgcolor);
    --secondary-btn-bgcolor: rgba(246, 129, 13, 0.1);
    --secondary-btn-color: rgb(246, 129, 13);
    /**  App Specific configuration end - used in few places / exception items */

    --body-bgcolor: rgba(var(--body-bgcolor-rgb), 1);

    --accordion-section-header-bgcolor: linear-gradient(90deg, rgba(var(--primary-bgcolor-rgb), 0.2) 60%, rgba(247, 247, 247, 1) 100%);

    --palmyra-grid-table-head-bgcolor: rgba(var(--primary-bgcolor-rgb), 0.15);

    --drawer-form-header-text-color: var(--disable-text-color);

    --filled-btn-bgcolor: rgba(var(--primary-bgcolor-rgb), 0.85);
    --filled-btn-text-color: var(--secondary-text-color);
    --filled-btn-hover-bgcolor: var(--primary-bgcolor);
    --filled-btn-hover-text-color: var(--secondary-text-color);

    --outlined-btn-bgcolor: var(--default-bgcolor);
    --outlined-btn-hover-bgcolor: var(--primary-bgcolor);
    --outlined-btn-hover-text-color: var(--secondary-text-color);
    --outlined-btn-text-color: var(--primary-text-color);
    --outlined-btn-border-color: var(--primary-border-color);

    --disabled-btn-bgcolor: rgba(var(--disable-bgcolor-rgb), 0.2);
    --disabled-btn-text-color: rgba(var(--disable-bgcolor-rgb), 0.5);

    --form-field-label-color: rgba(var(--default-text-color-rgb), 0.6);
    --form-field-data-color: var(--default-text-color);

    --sidebar-icon-color: rgba(var(--sidebar-text-color-rgb), 1);
    --sidebar-title-color: rgba(var(--sidebar-text-color-rgb), 1);
    --sidebar-bgcolor: rgba(var(--sidebar-bgcolor-rgb), 1);
    --sidebar-color: rgba(var(--sidebar-text-color-rgb), 0.45);
    --sidebar-footer-color: rgba(var(--sidebar-text-color-rgb), 0.4);
    --sidebar-hover-list-bgcolor: rgba(var(--sidebar-text-color-rgb), 0.02);
    --sidebar-hover-list-color: rgba(var(--sidebar-text-color-rgb), 1);
    --sidebar-select-list-bgcolor: rgba(var(--sidebar-text-color-rgb), 0.05);
    --sidebar-select-list-color: rgba(var(--sidebar-text-color-rgb), 1);
    --sidebar-select-list-border-color: rgba(var(--sidebar-text-color-rgb), 1);

    --topbar-bgcolor: var(--default-bgcolor);
    --topbar-color: var(--default-text-color);
    --avathar-name-color: var(--secondary-text-color);
    /** One-time configuration,  no need to change per theme */

    --primary-header-bg: linear-gradient(90deg, rgba(var(--secondary-bgcolor-rgb), 0.35) 0%, rgba(var(--default-bgcolor-rgb), 0.045) 50%);
    --secondary-header-bgcolor: rgba(var(--primary-bgcolor-rgb), 0.045);

    /* consider opaque from primary-input-text-color */
    --dropdown-boxshadow-color: rgba(var(--default-text-color-rgb), 0.15);
    --primary-boxshadow-color: rgba(var(--default-border-color-rgb), 0.03);
    /* consider opaque from primary-border-color */

    --dropdown-bgcolor: var(--secondary-text-color);
    --dropdown-color: var(--default-text-color);
    --dropdown-list-hover-color: var(--primary-bgcolor);
    --dropdown-boxshadow: 5px 9px 18px 1px var(--dropdown-boxshadow-color);
    --dropdown-list-hover-bgcolor: rgba(var(--secondary-bgcolor-rgb), 0.12);
    --accent-btn-bgcolor: var(--default-bgcolor);
    --accent-btn-text-color: var(--default-text-color);
    --accent-btn-hover-bgcolor: var(--primary-bgcolor);
    --accent-btn-hover-text-color: var(--secondary-text-color);
    --accent-btn-border-color: var(--primary-border-color);
    --accent-btn-boxshadow: var(--accent-boxshadow-color-first) 0px 1px 8px 0px, var(--accent-boxshadow-color-second) 0px 1px 2px 0px;

    --card-border-color: var(--status-unregister-border-color);
    --card-bgcolor: var(--default-bgcolor);
    --card-boxshadow: var(--primary-boxshadow-color) 0px 1px 1px, var(--primary-boxshadow-color) 0px 2px 2px, var(--primary-boxshadow-color) 0px 4px 4px, var(--primary-boxshadow-color) 0px 8px 8px, var(--primary-boxshadow-color) 0px 16px 16px;
    --card-header-color: var(--default-text-color);
    --card-content-color: var(--default-text-color);
    --card-download-btn-bgcolor: rgba(var(--primary-bgcolor-rgb), 0.85);
    --card-download-btn-text-color: var(--secondary-text-color);

    --header-bgcolor: var(--primary-header-bg);
    --header-color: var(--default-text-color);
    --border-color: rgba(var(--secondary-border-color-rgb), 0.2);

    --login-page-bg: var(--default-bgcolor);
    --login-box-bgcolor: rgba(var(--default-bgcolor-rgb), 0.95);
    --login-box-boxshadow: var(--primary-boxshadow-color) 0px 7px 29px 0px;
    --copyright-color: rgba(var(--default-text-color-rgb), 0.55);
    --login-btn-bgcolor: rgba(var(--primary-bgcolor-rgb), 0.75);
    --login-btn-hover-bgcolor: var(--primary-bgcolor);
    --login-btn-color: var(--secondary-text-color);
    --signin-btn-boxshadow: 3px 4px 10px rgba(var(--default-border-color-rgb), 0.25);
    --login-header-color: var(--default-text-color);
    --login-sub-header-color: rgba(var(--disable-text-color-rgb), 0.96);
    --login-copyright-color: rgba(var(--default-text-color-rgb), 0.55);
    --login-textfield-bgcolor: rgba(var(--default-input-text-color-rgb), 0.05);
    --login-textfield-color: var(--default-input-text-color);
    --login-textfield-border-color: rgba(var(--default-input-text-color-rgb), 0.01);
}