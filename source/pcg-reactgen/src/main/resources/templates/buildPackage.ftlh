{
  "name": ${projectName},
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
    "@mui/x-tree-view": "^7.3.1",
    "chartjs-adapter-date-fns": "^3.0.0",
    "chartjs-adapter-moment": "^1.0.1",
    "moment": "^2.30.1",
    "palmyra-rui": "https://api.github.com/repos/palmyra76/palmyra-rui/tarball",
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