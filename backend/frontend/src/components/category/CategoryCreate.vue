<template lang="">
  <div class="my-5 container content">
    <h2 class="text-center">Add Category</h2>
    <form @submit.prevent enctype="multipart/form-data">
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Name</label>
        <input type="text" 
          class="form-control" 
          id="exampleInputName" 
          aria-describedby="nameHelp" 
          v-model="category.name"
        >
        <div id="nameHelp" class="form-text">Please create name for a category</div>
      </div>
      <div class="input-group mb-3">
        <!-- <label class="input-group-text" @click="imageUpload">Upload</label> -->
        <input type="file" class="form-control" id="inputGroupFile01" @input="imageUpload">
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1">Description</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="category.description"></textarea>
      </div>

      <button type="submit" class="btn btn-primary" @click="addCategory">Submit</button>
    </form>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'category-add',
  data() {
    return {
      category: {
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
    async addCategory() {
      let fd = new FormData();
      fd.append('image', this.selectImage, this.selectImage.name);
      fd.append('name', this.category.name);
      fd.append('description', this.category.description);
      await axios.post('categories/', fd).then(response => {
        console.log(response.data);
        this.$router.push('/categories');
      });
    }
  },
  
}
</script>
<style scoped>

</style>