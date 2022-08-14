<template lang="">
  <div class="mt-5 container">
    <h2 class="text-center">Add Product</h2>
    <form @submit.prevent enctype="multipart/form-data">
      <div class="mb-3">
        <label for="exampleInputSubCategory" class="form-label">Subcategory *</label>
        <div class="d-flex">
          <select class="form-select w-50 me-5" aria-label="Default select example" v-model="product.subcategory">
            <!-- <option selected disabled>Choose subcategory</option> -->
            <option v-for="subCategory in allSubCategories" :key="subCategory.id" :value="subCategory.id">{{ subCategory.name }}</option>
          </select>
          <h3 class="text-success text-center" @click="addSubCategory">+</h3>
        </div>

      </div>
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Name *</label>
        <input type="text" 
          class="form-control" 
          id="exampleInputName" 
          aria-describedby="nameHelp" 
          v-model="product.name"
          placeholder="Enter name"
        >
        <!-- <div id="nameHelp" class="form-text">Please create name for a product</div> -->
      </div>

      <div class="mb-3">
        <label for="exampleFormControlTextarea1">Description</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="product.description" placeholder="Enter description"></textarea>
      </div>
      <div class="mb-3">
        <label for="exampleInputPrice" class="form-label">Price *</label>
        <input type="number" 
          class="form-control" 
          id="exampleInputPrice"
          aria-describedby="priceHelp" 
          v-model="product.price_in_USD"
          placeholder="Enter price in USD"
        >
        <!-- <div id="priceHelp" class="form-text text-secondary">Price in USD</div> -->
      </div>


      <button type="submit" class="btn btn-primary" @click="addProduct">Next</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {
      product: {
        name: "",
        description: "",
        price_in_USD: "",
        subcategory: "",
      },
    };
  },
  methods: {
    ...mapActions({
      getSubCategories: "subCategoryGet/getSubCategories",
    }),
    addProduct() {
      if (
        this.product.name !== "" &&
        this.product.subCategory !== "" &&
        this.product.price_in_USD !== ""
      ) {
        axios
          .post(`products/${this.product.subcategory}/`, this.product, {
            headers: {
              Authorization: `Token ${window.localStorage.token}`,
            },
          })
          .catch((error) => {
            if (error.response.status === 401) {
              this.$router.push("/dashboard");
            }
          })
          .then((response) => {
            console.log(response.data.id);
            if (response.status === 201) {
              alert(response.statusText);
              this.$router.push({
                name: "image-add",
                params: {
                  id: response.data.id,
                  category_id: this.$attrs.id,
                },
              });
            }
          });
      } else {
        alert("Please fill fields with *");
      }
    },
    addSubCategory() {
      console.log("add subcategory");
      this.$router.push({
        name: "subcategory-create",
        params: { id: this.$route.params.id },
      });
    },
  },
  computed: {
    ...mapGetters({
      allSubCategories: "subCategoryGet/allSubCategories",
    }),
  },
  mounted() {
    this.getSubCategories(this.$route.params.id);
  },
};
</script>
<style lang="scss" scoped>
.form-text {
  color: #000000;
}
</style>
