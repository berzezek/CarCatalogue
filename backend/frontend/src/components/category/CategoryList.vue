<template>
  <div v-if="isLoading" class="block-in-center">
    <my-loader/>
  </div>

  <div class="content container" v-else>
    <div> 
      <MDBRow :cols="['1', 'md-3']" class="g-3">
        <MDBCol v-for="category in categories" :key="category.id">
          <transition name="fade">
            <category-card 
              :title="category.name"
              :imgSrc="category.get_thumbnail"
              :imgAlt="category.name"
              :description="category.description"
              :id="category.id"
            />
          </transition>
        </MDBCol>
      </MDBRow>
    </div>
   

  </div>
</template>

<script>
  import MyLoader from '@/components/loader/MyLoader.vue';
  // import 'mdb-vue-ui-kit/css/mdb.min.css';
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import CategoryCard from "@/components/category/CategoryCard.vue";
  import axios from 'axios';
  export default {
    components: {
    MDBCol,
    MDBRow,
    MDBCardGroup,
    CategoryCard,
    MyLoader
},
    data() {
      return {
        categories: [],
        isLoading: true,
      }
    },
    methods: {
      async getCategories() {
        await axios.get('categories/').then(response => {
          this.categories = response.data;
          this.isLoading = false;
        });
      }
    },
    mounted() {
      
      this.getCategories();
      
    },
  };
</script>

<style>
  .content {
    padding: 10rem 1rem 10rem 1rem;
  }

  .block-in-center {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
</style>