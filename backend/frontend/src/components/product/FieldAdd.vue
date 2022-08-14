<template lang="">
  <div class="container mt-5">
    <h3 class="text-center">Add value to product field</h3>
    <form class="form-group" @submit.prevent>
      <div class="mb-3" v-for="field in category_fields" :key="field.id">
        <label class="form-label"><span class="font-weight-bold text-uppercase">{{ field.name }}</span> <span >{{ field.unit }}</span></label>
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
      axios
        .get(`fields-add/${this.$route.params.category_id}/`)
        .then((response) => {
          this.category_fields = response.data;
        });
    },
    addProductField() {
      this.category_fields.forEach((field) => {
        if (!!field.value) {
          axios
            .post(
              `field-to-product/${field.id}/${this.$route.params.id}/`,
              {
                value: field.value,
                product: this.$route.params.id,
              },
              {
                headers: {
                  Authorization: `Token ${window.localStorage.token}`,
                },
              }
            )
            .then((response) => {
              if (response.status === 201) {
                alert(
                  `Field ${response.data.category_field.name} - ${response.data.value} ${response.data.category_field.unit} added`
                );
                
              }
            });
        }
        this.$router.push({ name: "dashboard-view" });
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