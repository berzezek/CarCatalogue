import { createStore } from 'vuex';
import productsGet from '@/store/modules/products/productsGet';
import categoryGet from '@/store/modules/category/categoryGet';

const store = createStore({
    modules: {
      productsGet,
      categoryGet,
    },
})

export default store

