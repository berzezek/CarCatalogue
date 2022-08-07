import { createStore } from 'vuex'
import productsGet from '@/store/modules/products/productsGet'

const store = createStore({
    modules: {
      productsGet,
    },
})

export default store

