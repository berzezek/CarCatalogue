import { createApp } from 'vue'
import App from './App.vue'
import axios from 'axios';
import router from '@/router/router';
import store from '@/store';
import VueAwesomePaginate from "vue-awesome-paginate";
import BootstrapVue3 from 'bootstrap-vue-3'
import "vue-awesome-paginate/dist/style.css";
import "@fancyapps/ui/dist/fancybox.css";
// import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css'

// axios.defaults.baseURL = 'http://localhost:8000/api/v1/';
axios.defaults.baseURL = 'https://lcmotorskorea.com/api/v1/';

createApp(App)
.use(router)
.use(store)
.use(VueAwesomePaginate)
.use(BootstrapVue3)
.mount('#app')
