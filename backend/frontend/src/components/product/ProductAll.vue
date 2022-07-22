<template>
  
  <div v-if="isLoading" class="block-in-center">
    <my-loader/>
  </div>
<div v-else>
  <div class="container mt-5 content" >
    <div class="d-flex justify-content-end sm-2 mb-5 container search-hover">
        <form action=""  @submit.prevent>
            <input class="form-control" type="search" placeholder="Search" aria-label="Search"  v-model="searchQuery" />
        </form>
    </div>
    <div v-if="searchedProducts.length > 0">
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <transition-group name="product-list">
        <MDBCol v-for="product in searchedProducts" :key="product.id">
          <product-card 
            :title="product.name"
            :description="product.description"
            :id="product.id"
            :price="product.price_in_USD"
            :createdAt="product.created_at"
            :imgCat="product.subcategory.get_thumbnail"
          />
        </MDBCol>
      </transition-group>
    </MDBRow>
    </div>
    <div v-else class="content">
      <h3 class="text-center">Nothing found for your request...</h3>
    </div>
  </div>
  <div class="my-3 d-flex justify-content-center" v-if="searchQuery === ''">
    <my-paginate 
    :total-items="paginate.productsCount"
    :current-page="1"
    :items-per-page=6
    :max-pages-shown="paginate.maxPage"
    :hide-prev-next="true"
    @change="changePage"
    />
  </div>

</div>

  
</template>

<script>
  import axios from 'axios';
  import MyLoader from '@/components/loader/MyLoader.vue';
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import ProductCard from "@/components/product/ProductCard.vue";
  
  import MyPaginate from '@/components/paginate/MyPaginate.vue';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      ProductCard,
      MyLoader,
      MyPaginate,
    },
    data() {
      return {
        products: [],
        isLoading: true,
        searchQuery: "",
        paginate: {},
        page: 1
      }
    },
    methods: {
      getProducts() {
        axios.get(`products-all?page=${this.page}`).then(response => {
          this.products = response.data.result;
          this.paginate.maxPage = response.data.page_count;
          this.paginate.productsCount = response.data.products_count.toString();
          this.isLoading = false;
        });
      },
      changePage(page) {
        this.page = page
      },
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
        let max = 0
        this.products.forEach( elem => {
          if ( elem.price > max) {
            max = elem.price
          }
          return max
        })
      },
      accountInUSD(value) {
        console.log(value)
        // let formatPrice = new Intl.NumberFormat().format(value)
        // return formatPrice
      }
    },
    watch: {
      page() {
        this.getProducts();
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

  .product-list-move {
    transition: transform 0.8s ease;
  }

  .search-hover :hover{
    box-shadow: 0 5px 10px 0 rgba(255, 255, 255, 0.5);
    transition: 0.3s;
  }

</style>