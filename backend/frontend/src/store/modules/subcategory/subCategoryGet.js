import axios from "axios";
export default {
  state: () => ({
    subCategories: [],
  }),
  actions: {
    async getSubCategories(ctx, category) {
      await axios.get(`subcategories/${category}/`).then(response => {
        const subCategories = response.data
        ctx.commit('updateSubCategories', subCategories);
      });
      
    }
  },
  mutations: {
    updateSubCategories(state, subCategories) {
      state.subCategories = subCategories;
    }
  },
  getters: {
    allSubCategories(state) {
      return state.subCategories
    }
  },
  namespaced: true
}