<template>
  <MDBRow :cols="['1', 'md-3']" class="g-3">
    <MDBCol v-for="category in categories" :key="category.id">
      <category-card 
        :title="category.name"
        :imgSrc="category.image"
        :imgAlt="category.name"
        :description="category.description"
        :id="category.id"
      />
    </MDBCol>
  </MDBRow>
</template>

<script>
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import CategoryCard from "@/components/category/CategoryCard.vue";
  import axios from 'axios';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      CategoryCard
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