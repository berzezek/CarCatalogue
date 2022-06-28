import { createRouter, createWebHistory } from 'vue-router';

import Home from '@/components/page/Home.vue';
import CategoryList from '@/components/category/CategoryList.vue';
import CategoryCreate from '@/components/category/CategoryCreate.vue';

import SubcategoryList from '@/components/subcategory/SubcategoryList.vue';
import SubcategoryCreate from '@/components/subcategory/SubcategoryCreate.vue';

import ProductList from '@/components/product/ProductList.vue';
import ProductAll from '@/components/product/ProductAll.vue';
import ProductCreate from '@/components/product/ProductCreate.vue';
import ProductDetail from '@/components/product/ProductDetail.vue';

import ImageAdd from '@/components/imageProduct/ImageAdd.vue';
import FieldAdd from '@/components/product/FieldAdd.vue';

import Dashboard from '@/components/dashboard/Dashboard.vue';


const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'home', component: Home },
    { path: '/categories', name: 'categories', component: CategoryList },
    { path: '/category-create', name: 'category-create', component: CategoryCreate },
  
    { path: '/subcategories/:id', name: 'subcategories', component: SubcategoryList , props: true },
    { path: '/subcategory-create/:id', name: 'subcategories-create', component: SubcategoryCreate , props: true },

    { path: '/products/:id', name: 'products', component: ProductList , props: true },
    { path: '/products-all/', name: 'products-all', component: ProductAll },
    { path: '/product-create/:id', name: 'product-create', component: ProductCreate , props: true },
    { path: '/product-detail/:id', name: 'product-detail', component: ProductDetail, props: true },

    { path: '/image-add/:id', name: 'image-add', component: ImageAdd, props: true },

    { path: '/field-add/:id', name: 'field-add', component: FieldAdd, props: true },

    { path: '/dashboard', name: 'dashboard', component: Dashboard },

  ] 
});

export default router;