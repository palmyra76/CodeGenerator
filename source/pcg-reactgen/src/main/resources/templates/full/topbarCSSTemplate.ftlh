.topbar {
  background-color:var(--topbar-bgcolor) !important;
  color: var(--topbar-color) !important;
}

/* .topbar-avathar {
  display: flex;
  margin-left: auto;
  padding: 1px 20px 0px 20px;
  gap: 10px;
  width: auto;
  align-items: center;
  vertical-align: middle;
  cursor: pointer;
} */

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
  background-color: var(--dropdown-bgcolor);
  color:var(--dropdown-color);
  box-shadow: var(--dropdown-boxshadow);
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
  background-color: var(--dropdown-list-hover-bgcolor);
  border-radius: 3px;
}
