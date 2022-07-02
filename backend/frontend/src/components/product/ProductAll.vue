<template>
  
  <div v-if="isLoading" class="block-in-center">
    <my-loader/>
  </div>

<div class="container mt-5 content" v-else>
    <div class="d-flex justify-content-end sm-2 mb-5 container">
        <form action=""  @submit.prevent>
            <input class="form-control" type="search" placeholder="Search" aria-label="Search"  v-model="searchQuery" />
        </form>
    </div>
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <transition-group name="product-list">
        <MDBCol v-for="product in searchedProducts" :key="product.id">
          <product-card 
            :title="product.name"
            :description="product.description"
            :id="product.id"
            :price="product.price_in_USD"
            :createdAt="product.created_at"
          />
        </MDBCol>
      </transition-group>
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
        searchQuery: "",
        maxPrice: 0,
        maximus: ""
      }
    },
    methods: {
      getProducts() {
        axios.get(`products-all/`).then(response => {
          this.products = response.data;
          this.isLoading = false;
        });
      },
      lookThis() {
        console.log('ok')
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
      },
      maxPrice() {
        let max = this.maxPrice
        this.products.forEach( elem => {
          if ( elem.price > max) {
            max = elem.price
          }
          return max
        })
      }
    }
  }
</script>

<style scoped>
  .product-list-item {
  display: inline-block;
  margin-right: 10px;
  }
  .product-list-enter-active,
  .product-list-leave-active {
    transition: all 0.6s ease;
  }
  .product-list-enter-from,
  .product-list-leave-to {
    opacity: 0.5;
    transform: translateY(30px);
  }

  .content {
    padding-top: 5rem;
  }
</style>