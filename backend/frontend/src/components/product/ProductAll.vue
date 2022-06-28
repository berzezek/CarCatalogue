<template>
  
  <div v-if="isLoading" class="block-in-center">
    <my-loader/>
  </div>
  <div class="container mt-5 content" v-else>
    <form action="" class="d-flex justify-content-end container" @submit.prevent>
      <input class="form-control sm-2 col-lg-4 mb-3" type="search" placeholder="Search" aria-label="Search"  v-model="searchQuery" />
    </form> 
    

    <MDBRow :cols="['1', 'md-3']" class="g-3">
      <MDBCol v-for="product in searchedProducts" :key="product.id">
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
        searchQuery: ""
      }
    },
    methods: {
      getProducts() {
        axios.get(`products-all/`).then(response => {
          this.products = response.data;
          this.isLoading = false;
        });
      },
      filterByName() {
        console.log($event.target.value)
      }
    },
    mounted() {
      this.getProducts();
    },
    computed: {
      searchedProducts() {
        return this.products.filter((product) =>
          product.name.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
      }
    }
  }
</script>