<template>
  <div class="content container">
    <div>
      <MDBRow :cols="['1', 'md-3']" class="g-3">
        <MDBCol v-for="category in categories" :key="category.id">
          <transition name="fade">
            <category-card 
              :title="category.name"
              :imgSrc="category.image"
              :imgAlt="category.name"
              :description="category.description"
              :id="category.id"
            />
          </transition>
        </MDBCol>
      </MDBRow>
    </div>
    <div class="mt-5 align-center">
      <router-link to='/category-create' class="btn btn success">Create new category</router-link>
    </div>
    

  </div>
</template>

<script>
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
    },
    data() {
      return {
        categories: []
      }
    },
    methods: {
      getCategories() {
        axios.get('categories/').then(response => {
          this.categories = response.data;
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

  .fade-enter-active, .fade-leave-active {
    transition: opacity .5s;
  }
  .fade-enter, .fade-leave-to /* .fade-leave-active до версии 2.1.8 */ {
    opacity: 0;
  }
</style>