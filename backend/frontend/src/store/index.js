import { createStore } from 'vuex';
import productsGet from '@/store/modules/products/productsGet';
import productsForSearch from '@/store/modules/products/productsForSearch';
import categoryGet from '@/store/modules/category/categoryGet';
import loginPost from '@/store/modules/login/loginPost';
import getUser from '@/store/modules/login/userGet';
import logoutPost from '@/store/modules/login/logoutPost';

const store = createStore({
    modules: {
      productsGet,
      productsForSearch,
      categoryGet,
      loginPost,
      getUser,
      logoutPost
    },
})

export default store

