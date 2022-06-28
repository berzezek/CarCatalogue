<template>
  <div v-if="isLoading" class="block-in-center">
    <my-loader/>
  </div>
  <div class="content container" v-else>
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <MDBCol v-for="subCategory in subCategories" :key="subCategory.id">
        <subcategory-card 
          :title="subCategory.name"
          :imgSrc="subCategory.get_thumbnail"
          :imgAlt="subCategory.name"
          :description="subCategory.description"
          :id="subCategory.id"
        />
      </MDBCol>
    </MDBRow>
  </div>

</template>

<script>
  import MyLoader from '@/components/loader/MyLoader.vue';
  import { MDBCol, MDBRow, MDBCardGroup } from "mdb-vue-ui-kit";
  import SubcategoryCard from "@/components/subcategory/SubcategoryCard.vue";
  import FieldsList from "@/components/categoryFields/FieldsList.vue";
  import FieldCreate from "@/components/categoryFields/FieldCreate.vue";
  import axios from 'axios';
  export default {
    components: {
      MDBCol,
      MDBRow,
      MDBCardGroup,
      SubcategoryCard,
      FieldsList,
      FieldCreate,
      MyLoader
    },
    data() {
      return {
        subCategories: [],
        isLoading: true,
      }
    },
    methods: {
      async getSubCategories() {
        await axios.get(`subcategories/${this.$route.params.id}/`).then(response => {
          this.subCategories = response.data;
          this.isLoading = false;
        });
      }
    },
    
    mounted() {
      this.getSubCategories();
    },
  };
</script>

<style>
  
</style>