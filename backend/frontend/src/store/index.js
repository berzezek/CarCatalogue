import { createStore } from 'vuex';
import productsGet from '@/store/modules/products/productsGet';
import categoryGet from '@/store/modules/category/categoryGet';
import loginPost from '@/store/modules/login/loginPost';
import getUser from '@/store/modules/login/userGet';
import logoutPost from '@/store/modules/login/logoutPost';

const store = createStore({
    modules: {
      productsGet,
      categoryGet,
      loginPost,
      getUser,
      logoutPost
    },
})

export default store

