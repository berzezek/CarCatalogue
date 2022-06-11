<template lang="">
  <div class="mt-5 container">
    <h2 class="text-center">Add Subcategory</h2>
    <form @submit.prevent enctype="multipart/form-data">
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Name</label>
        <input type="text" 
          class="form-control" 
          id="exampleInputName" 
          aria-describedby="nameHelp" 
          v-model="subcategory.name"
        >
        <div id="nameHelp" class="form-text">Please create name for a subcategory</div>
      </div>
      <div class="input-group mb-3">
        <!-- <label class="input-group-text" @click="imageUpload">Upload</label> -->
        <input type="file" class="form-control" id="inputGroupFile01" @input="imageUpload">
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1">Description</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="subcategory.description"></textarea>
      </div>

      <button type="submit" class="btn btn-primary" @click="addSubcategory">Submit</button>
    </form>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'subcategory-create',
  data() {
    return {
      subcategory: {
        name: '',
        description: '',
      },
      selectImage: null,
    }
  },
  methods: {
    imageUpload(e) {
      this.selectImage = e.target.files[0];
    },
    async addSubcategory() {
      let fd = new FormData();
      fd.append('image', this.selectImage, this.selectImage.name);
      fd.append('name', this.subcategory.name);
      fd.append('description', this.subcategory.description);
      fd.append('category', this.$route.params.id);
      await axios.post(`subcategories/${this.$route.params.id}/`, fd).then(response => {
        this.$router.push(`/subcategories/${this.$route.params.id}`);
      });
    }
  },
  
}
</script>
<style lang="">

</style>