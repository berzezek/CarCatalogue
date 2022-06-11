<template>
  <div class="container mt-5 content">
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <MDBCol v-for="product in products" :key="product.id">
        <product-card 
          :title="product.name"
          :description="product.description"
          :id="product.id"
        />
      </MDBCol>
    </MDBRow>
    <router-link :to='{ name: "product-create", params: {id: this.$route.params.id} }'>
      <button class="btn btn-success my-3 ms-3">Add Product</button>
    </router-link>
  </div>

</template>

<script>
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import ProductCard from "@/components/product/ProductCard.vue";
  import axios from 'axios';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      ProductCard
    },
    data() {
      return {
        products: []
      }
    },
    methods: {
      getProducts() {
        axios.get(`products/${this.$route.params.id}/`).then(response => {
          this.products = response.data;
        });
      }
    },
    mounted() {
      this.getProducts();
    },
  };
</script>