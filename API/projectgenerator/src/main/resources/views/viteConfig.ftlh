import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    <#if proxyApi>
    proxy: {
      "/api": "${proxyApiUrl}"
    },
    </#if>
    open: true,
    port: 5000
  }
});