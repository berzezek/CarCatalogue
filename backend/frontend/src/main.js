import { createApp } from 'vue'
import App from './App.vue'
import axios from 'axios';
import router from '@/router/router';
import VueAwesomePaginate from "vue-awesome-paginate";
import "vue-awesome-paginate/dist/style.css";
import "@fancyapps/ui/dist/fancybox.css";

axios.defaults.baseURL = 'http://localhost:8000/api/v1/';
// axios.defaults.baseURL = 'https://lcmotorskorea.com/api/v1/';

createApp(App)
.use(router)
.use(VueAwesomePaginate)
.mount('#app')
