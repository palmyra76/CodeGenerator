.login-page-container {
  height: calc(100vh - 16px);
  display: flex;
  gap: 0px;
  overflow: hidden;
}

.login-box-container {
  position: absolute;
  top: 20%;
  left: 35%;
  align-items: center;
  height: auto;
  text-align: center;
  width: 25%;
  z-index: 1;
  box-shadow: var(--login-box-boxshadow);
  border-radius: 10px;
  background-position: top;
  background-color: var(--login-box-bgcolor);
}

.login-header-container {
  text-align: center;
  margin-top: 10%;
}

.login-header {
  color: var(--login-header-color);
  font-weight: bold;
  font-family: sans-serif;
}

.login-sub-header {
  color: var(--login-sub-header-color);
}

.login-copyright {
  margin-top: 15%;
  font-size: 80%;
  color: var(--login-copyright-color);
  opacity: 0.8;
  text-align: center;
}

.login-container-table {
  text-align: center !important;
  margin-left: 12.5% !important;
  width: 75% !important;
}

.login-container-table td {
  border-bottom: none !important;
  text-align: end;
}

.login-forgot-pwd-link {
  cursor: pointer;
}

.login-textfield {
  width: 100% !important;
  /* display: inline-block !important; */
  background-color: var(--login-textfield-bgcolor) !important;
  color: var(--login-textfield-color) !important;
  border-radius: 10px !important;
  border: none !important;
  box-sizing: border-box !important;
  font-size: 1em !important;
}

.login-container-table .MuiFilledInput-root::before,
.login-container-table .MuiFilledInput-root::after {
  border: none !important;
}

.login-container-table .MuiFilledInput-root {
  background-color: unset !important;
  border: none !important;
  width: 100% !important;
  font-size: large;
}

.login-container-table .MuiFilledInput-root:hover {
  background-color: unset !important;
}

.error-text {
  display: flex;
  gap: 3px;
  color: var(--error-color);
  font-size: 12.5px;
  text-align-last: start;
  width: 100%;
  margin: 1% 0 0 1%;
}

.error-text-icon {
  font-size: 16px !important;
  color: var(--error-color);
}

.login-btn {
  background-color: var(--login-btn-bgcolor) !important;
  width: 100% !important;
  color: var(--login-btn-color) !important;
  font-weight: bold !important;
  border-radius: 10px !important;
  margin-top: 1% !important;
}

.login-btn:hover {
  background-color: var(--login-btn-hover-bgcolor) !important;
}

input:focus {
  outline: none;
}
.custom-alert-container {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 19px;
  justify-content: center;
  line-height: 21px;
  font-weight: normal;
  text-align: left;
}

.warning-icon {
  font-size: 20px;
  fill: var(--warning-color);
  stroke: var(--stroke-color);
}

.swal2-show {
  width: auto;
}

@media only screen and (max-width: 809px) {
  .login-box-container {
    text-align: center;
    left: 50%;
    transform: translateX(-50%);
    width: 90%;
  }
}

@media only screen and (min-width: 810px) and (max-width: 1024px) {
  .login-box-container {
    top: 20%;
    left: 52%;
    z-index: 2;
    transform: translateX(-50%);
    width: 55%;
  }
}
