<template>
  <my-loader v-if="isLoading" class="block-in-center" />
  <div class="container mt-5 content" v-else>
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <MDBCol v-for="product in products" :key="product.id">
        <product-card 
          :title="product.name"
          :description="product.description"
          :id="product.id"
          :price="product.price_in_USD"
          :createdAt="product.created_at"
        />
      </MDBCol>
    </MDBRow>
  </div>

</template>

<script>
  import MyLoader from '@/components/loader/MyLoader.vue';
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import ProductCard from "@/components/product/ProductCard.vue";
  import axios from 'axios';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      ProductCard,
      MyLoader
    },
    data() {
      return {
        products: [],
        isLoading: true,
      }
    },
    methods: {
      getProducts() {
        axios.get(`products/${this.$route.params.id}/`).then(response => {
          this.products = response.data;
          this.isLoading = false;
        });
      }
    },
    mounted() {
      this.getProducts();
    },
  };
</script>