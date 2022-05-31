<template>
  <MDBRow :cols="['1', 'md-3']" class="g-3">
    <MDBCol v-for="subCategory in subCategories" :key="subCategory.id">
      <subcategory-card 
        :title="subCategory.name"
        :imgSrc="subCategory.image"
        :imgAlt="subCategory.name"
        :description="subCategory.description"
        :id="subCategory.id"
      />
    </MDBCol>
  </MDBRow>
</template>

<script>
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import SubcategoryCard from "@/components/subcategory/SubcategoryCard.vue";
  import axios from 'axios';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      SubcategoryCard
    },
    data() {
      return {
        subCategories: []
      }
    },
    methods: {
      getSubCategories() {
        axios.get(`subcategories/${this.$route.params.id}/`).then(response => {
          this.subCategories = response.data;
        });
      }
    },
    mounted() {
      this.getSubCategories();
    },
  };
</script>