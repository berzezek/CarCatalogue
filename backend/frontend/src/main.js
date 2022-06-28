import { createApp } from 'vue'
import App from './App.vue'
import axios from 'axios';
import router from '@/components/router/router';


axios.defaults.baseURL = 'http://localhost:8000/api/v1/';
// axios.defaults.baseURL = 'https://lcmotorskorea.com/api/v1/';

createApp(App)
.use(router, axios)
.mount('#app')
