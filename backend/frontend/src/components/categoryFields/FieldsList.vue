<template lang="">
  <div class="container">
    <h3 class="text-center my-3">Category fields</h3>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">Title</th>
          <th scope="col">Unit</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="field in category_fields" :key="field.id">
          <td><span class="ms-5">{{ field.name }}</span></td>
          <td>{{ field.unit }}</td>
        </tr>
      
      </tbody>
    </table>
  </div>
</template>
<script>
import axios from 'axios'
export default {
  name: 'category-fields',
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      category_fields: [],
    }
  },
  methods: {
    getCategoryFields() {
      axios.get(`fields-add/${this.$props.id}/`).then(response => {
        this.category_fields = response.data;
      });
    },
  },
  mounted() {
    this.getCategoryFields();
  },
  watch: {
    category_fields: function() {
      this.getCategoryFields();
    }
  }
  
}
</script>
<style lang="">
  
</style>