import axios from "axios";
export default {
  state: () => ({
    productsForSearch: [],
  }),
  actions: {
    async getProductsForSearch(ctx) {
      await axios.get(`products-all-for-search/`)
        .then(response => {
          const productsForSearch = response.data;
          ctx.commit('updateProductsForSearch', productsForSearch);
        });

    }
  },
  mutations: {
    updateProductsForSearch(state, productsForSearch) {
      state.productsForSearch = productsForSearch;
    }
  },
  getters: {
    allProductsForSearch(state) {
      return state.productsForSearch
    }
  }
}