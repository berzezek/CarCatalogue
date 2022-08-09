<template lang="">
  <div class="container mt-5">
    <h3 class="text-center">Add value to product field</h3>
    <form class="form-group" @submit.prevent>
      <div class="mb-3" v-for="field in category_fields" :key="field.id">
        <label class="form-label">{{ field.name }}</label>
        <input type="text" 
          class="form-control" 
          v-model="field.value"
        >
      </div>
      <button type="submit" class="btn btn-primary" @click="addProductField">Complite</button>
    </form>

    
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "field-add",
  data() {
    return {
      category_fields: [],
    };
  },
  methods: {
    getCategoryFields() {
      axios.get(`fields-add/${this.$attrs.id}/`).then((response) => {
        this.category_fields = response.data;
      });
    },
    addProductField() {
      this.category_fields.forEach((field) => {
        let fd = new FormData();
        fd.append("category_field", field.id);
        fd.append("value", field.value);
        fd.append("product", this.$attrs.id);
        axios
          .post(`field-to-product/${this.$attrs.id}/${field.id}/`, fd)
          .then((response) => {
            console.log(response);
          });
      });
    },
  },
  mounted() {
    this.getCategoryFields();
  },
};
</script>
<style lang="">
</style>