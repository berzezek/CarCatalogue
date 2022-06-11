<template>
  <div class="container">
    <h3 class="text-center">Product fields</h3>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">Title</th>
          <th scope="col">Value</th>
          <th scope="col">Unit</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="field in product_fields" :key="field.id">
          <td>{{ field.category_field.name }}</td>
          <td>{{ field.value }}</td>
          <td v-if="field.category_field.unit === null">-</td>
          <td v-else>{{ field.category_field.unit }}</td>
        </tr>
      
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  name: 'product-fields',
  props: {
    id: {
      type: [Number, String],
      required: true
    }
  },
  data() {
    return {
      product_fields: [],
      category_id: this.$props.id,
    }
  },
  methods: {
    getProductFields() {
      axios.get(`fields/${this.category_id}/`).then(response => {
        this.product_fields = response.data;
      });
    }
  },
  mounted() {
    this.getProductFields();
  },
  
}
</script>
<style>

  
</style>