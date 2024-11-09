import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { StoreFactoryContext } from '@palmyralabs/rt-forms';
import AppStoreFactory from './wire/StoreFactory.ts';
import { ThemeBlue } from '@palmyralabs/template-stine/ThemeBlue';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <>
      <StoreFactoryContext.Provider value={AppStoreFactory} >
        <ThemeBlue />
        <App />
        <ToastContainer limit={1} pauseOnFocusLoss={false}/>
      </StoreFactoryContext.Provider>
  </>
)