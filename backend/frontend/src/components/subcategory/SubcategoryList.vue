<template>
  <div class="content container">
      <MDBRow :cols="['1', 'md-3']" class="g-3">
      <MDBCol v-for="subCategory in subCategories" :key="subCategory.id">
        <subcategory-card 
          :title="subCategory.name"
          :imgSrc="subCategory.image"
          :imgAlt="subCategory.name"
          :description="subCategory.description"
          :id="subCategory.id"
          :subCategoryLength="subCategory.lenght"
        />
      </MDBCol>
    </MDBRow>
    <div class="container">
      <button class="btn btn-primary mt-5" @click="addSubCategory">Add new subcategory</button>
      <fields-list :id="this.$route.params.id" class="mt-5"/>
      <field-create :id="this.$route.params.id" class="mt-5"/>
    </div>
    
  </div>

</template>

<script>
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
    },
    data() {
      return {
        subCategories: []
      }
    },
    methods: {
      async getSubCategories() {
        await axios.get(`subcategories/${this.$route.params.id}/`).then(response => {
          this.subCategories = response.data;
        });
      },
      async addSubCategory() {
        console.log("working");
        this.$router.push(`/subcategory-create/${this.$route.params.id}`);
      }
    },
    
    mounted() {
      this.getSubCategories();
    },
  };
</script>

<style>
  
</style>