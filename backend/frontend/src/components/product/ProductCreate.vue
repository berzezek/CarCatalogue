<template lang="">
  <div class="mt-5 container">
    <h2 class="text-center">Add Product</h2>
    <form @submit.prevent enctype="multipart/form-data">
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Name</label>
        <input type="text" 
          class="form-control" 
          id="exampleInputName" 
          aria-describedby="nameHelp" 
          v-model="product.name"
        >
        <div id="nameHelp" class="form-text">Please create name for a product</div>
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1">Description</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="product.description"></textarea>
      </div>
      <div class="mb-3">
        <label for="exampleInputPrice" class="form-label">Price</label>
        <input type="number" 
          class="form-control" 
          id="exampleInputPrice"
          aria-describedby="priceHelp" 
          v-model="product.price_in_USD"
        >
        <div id="priceHelp" class="form-text">Price in USD</div>
      </div>

      <button type="submit" class="btn btn-primary" @click="addProduct">Next</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      product: {
        name: "",
        description: "",
        price_in_USD: "",
        subcategory: this.$route.params.id,
      },
    };
  },
  methods: {
    addProduct() {
      axios
        .post(`products/${this.$route.params.id}/`, this.product)
        .then((response) => {
          this.$router.push({
            name: "image-add",
            params: { id: response.data.id },
          });
        });
    },
  },
};
</script>
<style lang="">
</style>
