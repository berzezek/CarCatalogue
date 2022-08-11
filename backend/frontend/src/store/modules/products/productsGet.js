import axios from "axios";
export default {
  state: () => ({
    products: [],
    page_count: 1,
    products_count: 1,
    paginator_page_size: 1
  }),
  actions: {
    async getProducts(ctx, page = 1) {
      await axios.get(`products-all/?page=${page}`)
        .then(response => {
          const products = response.data.result;
          const page_count = response.data.page_count;
          const products_count = response.data.products_count;
          const paginator_page_size = response.data.paginator_page_size;
          ctx.commit('updateProducts', products);
          ctx.commit('updatePage', page_count);
          ctx.commit('updateProductCount', products_count);
          ctx.commit('updatePaginatorPageSize', paginator_page_size);
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
    updatePaginatorPageSize(state, paginator_page_size) {
      state.paginator_page_size = paginator_page_size
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
    allPaginatorPageSize(state) {
      return state.paginator_page_size
    },
  }
}