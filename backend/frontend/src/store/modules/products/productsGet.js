import axios from "axios";
export default {
  state: () => ({
    products: [],
    page_count: 1,
    products_count: 1
  }),
  actions: {
    async getProducts(ctx, page = 1) {
      await axios.get(`products-all/?page=${page}`)
        .then(response => {
          const products = response.data.result;
          const page_count = response.data.page_count;
          const products_count = response.data.products_count;
          ctx.commit('updateProducts', products);
          ctx.commit('updatePage', page_count);
          ctx.commit('updateProductCount', products_count);
        });

    }
  },
  mutations: {
    updateProducts(state, products) {
      state.products = products;
    },
    updatePage(state, page_count) {
      state.page_count = page_count
    },
    updateProductCount(state, products_count) {
      state.products_count = products_count
    },
  },
  getters: {
    allProducts(state) {
      return state.products
    },
    allPageCount(state) {
      return state.page_count
    },
    allProductCount(state) {
      return state.products_count
    },
  }
}