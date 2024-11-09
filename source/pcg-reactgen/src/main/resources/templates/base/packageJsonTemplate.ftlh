{
  "name": "${projectName}",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc && vite build",
    "lint": "eslint . --ext ts,tsx --report-unused-disable-directives --max-warnings 0",
    "preview": "vite preview"
  },
  "dependencies": {
    "@emotion/react": "^11.13.0",
    "@emotion/styled": "^11.13.0",
    "@mui/material": "^5.16.6",
    "@mui/x-tree-view": "^7.3.1",
    "@palmyralabs/palmyra-wire": "^1.1.0",
    "@palmyralabs/rt-forms": "github:palmyralabs/rt-forms",
    "@palmyralabs/rt-forms-mui": "github:palmyralabs/rt-forms-mui",
    "@palmyralabs/template-stine": "github:palmyralabs/rt-template-stine",
    "@palmyralabs/ts-utils": "github:palmyralabs/ts-utils",
    "moment": "^2.30.1",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-toastify": "^10.0.5",
    "sweetalert2": "^11.10.8"
  },
  "devDependencies": {
    "@types/react": "^18.2.66",
    "@types/react-dom": "^18.2.22",
    "@typescript-eslint/eslint-plugin": "^7.2.0",
    "@typescript-eslint/parser": "^7.2.0",
    "@vitejs/plugin-react": "^4.2.1",
    "eslint": "^8.57.0",
    "eslint-plugin-react-hooks": "^4.6.0",
    "eslint-plugin-react-refresh": "^0.4.6",
    "typescript": "^5.2.2",
    "vite": "^5.2.0"
  }
}