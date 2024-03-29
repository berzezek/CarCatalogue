import axios from "axios";
export default {
  state: () => ({
    product: [],
  }),
  actions: {
    async getProduct(ctx, id) {
      await axios.get(`product/${id}/`)
        .then(response => {
          const product = response.data;
          console.log(product);
          ctx.commit('updateProduct', product);
        });

    }
  },
  mutations: {
    updateProduct(state, product) {
      state.product = product;
    },
    
  },
  getters: {
    allProduct(state) {
      return state.product
    }
  }
}