import { createApp } from 'vue'
import App from './App.vue'
// import 'mdb-vue-ui-kit/css/mdb.min.css';
import axios from 'axios';
import { createRouter, createWebHistory } from 'vue-router';

import Home from '@/components/Home.vue';
import CategoryList from '@/components/category/CategoryList.vue';
import SubcategoryList from '@/components/subcategory/SubcategoryList.vue';
import ProductList from '@/components/product/ProductList.vue';

axios.defaults.baseURL = 'http://localhost:8000/api/v1/';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'home', component: Home },
    { path: '/categories', name: 'categories', component: CategoryList },
    { path: '/subcategories/:id', name: 'subcategories', component: SubcategoryList , props: true },
    { path: '/products/:id', name: 'products', component: ProductList , props: true },
  ]
});


createApp(App)
.use(router, axios)
.mount('#app')
