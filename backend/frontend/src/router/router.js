import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', name: 'home', component: () => import('@/views/Home.vue') },
    { path: '/categories', name: 'categories', component: () => import('@/components/category/CategoryList.vue') },
    { path: '/category-create', name: 'category-create', component: () => import('@/components/category/CategoryCreate.vue') },
  
    { path: '/subcategories/:id', name: 'subcategories', component: () => import('@/components/subcategory/SubcategoryList.vue') , props: true },
    { path: '/subcategory-create/:id', name: 'subcategory-create', component: () => import('@/components/subcategory/SubcategoryCreate.vue'), props: true },

    { path: '/products-all/', name: 'products-all', component: () => import('@/components/product/ProductAll.vue') },
    { path: '/product-create/:id', name: 'product-create', component: () => import('@/components/product/ProductCreate.vue'), props: true },
    { path: '/product-detail/:id', name: 'product-detail', component: () => import('@/components/product/ProductDetail.vue'), props: true },

    { path: '/image-add/:id', name: 'image-add', component: () => import('@/components/imageProduct/ImageAdd.vue'), props: true },

    { path: '/field-add/:id', name: 'field-add', component: () => import('@/components/product/FieldAdd.vue'), props: true },
    { path: '/field-to-product/:id/:category_id', name: 'field-add', component: () => import('@/components/product/FieldAdd.vue'), props: true },

    { path: '/dashboard', name: 'dashboard', component: () => import('@/components/dashboard/Dashboard.vue') },
    { path: '/dashboard-view', name: 'dashboard-view', component: () => import('@/components/dashboard/DashboardView.vue') },
  ] 
});

export default router;