<template lang="">
  <div class="mt-5 container">
    <h2 class="text-center mt-5">Add image</h2>
    <form @submit.prevent enctype="multipart/form-data">

      <div class="input-group mb-3">
        <!-- <label class="input-group-text" @click="imageUpload">Upload</label> -->
        <input type="file" class="form-control" id="inputGroupFile01" @input="imageUpload" />
      </div>

      <div>
        <button type="" class="btn btn-primary me-3" @click="addImage">Add image</button>
        <button type="submit" class="btn btn-primary" @click="fieldAdd">Next</button>
      </div>

    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "image-add",
  data() {
    return {
      selectImage: null,
    };
  },
  methods: {
    imageUpload(e) {
      this.selectImage = e.target.files[0];
    },
    async addImage() {
      let fd = new FormData();
      fd.append("image", this.selectImage, this.selectImage.name);
      fd.append("product", this.$route.params.id);
      await axios
        .post(`images/${this.$route.params.id}/`, fd, {
          headers: {
            Authorization: `Token ${window.localStorage.token}`,
          },
        })
        .then((response) => {
          if (response.status === 201) {
            alert("Image added");
          }
        });
    },
    fieldAdd() {
      this.$router.push({
        name: "field-add",
        params: { id: this.$attrs.id, category_id: this.$route.params.category_id },
      });
    },
  },
};
</script>
<style lang="">
</style>