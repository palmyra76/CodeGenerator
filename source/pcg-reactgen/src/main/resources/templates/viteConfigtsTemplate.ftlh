import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: { "/api": "http://localhost:8080/" },
    open: true,
    port: 5000,
    host: "0.0.0.0"
  }
})
