import { createStore } from 'vuex';
import productsGet from '@/store/modules/products/productsGet';
import productGet from '@/store/modules/products/productGet';
import productsForSearch from '@/store/modules/products/productsForSearch';
import categoryGet from '@/store/modules/category/categoryGet';
import subCategoryGet from '@/store/modules/subcategory/subCategoryGet';
import loginPost from '@/store/modules/login/loginPost';
import getUser from '@/store/modules/login/userGet';
import logoutPost from '@/store/modules/login/logoutPost';

const store = createStore({
    modules: {
      
      productsGet,
      productGet,
      productsForSearch,
      categoryGet,
      subCategoryGet,
      loginPost,
      getUser,
      logoutPost
    },
})

export default store

