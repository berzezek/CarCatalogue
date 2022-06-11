<template lang="">
  <div class="mt-5 container">
    <h2 class="text-center">Add field</h2>
    <form @submit.prevent enctype="multipart/form-data">
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Name</label>
        <input type="text" 
          class="form-control" 
          id="exampleInputName" 
          aria-describedby="nameHelp" 
          v-model="field.name"
        >
        <div id="nameHelp" class="form-text">Please create name for a category field</div>
      </div>
      <div class="mb-3">
        <label for="exampleFormControlTextarea1">Unit</label>
        <input class="form-control" id="exampleFormControlTextarea1" v-model="field.unit" />
      </div>

      <button type="submit" class="btn btn-primary" @click="addField">Submit</button>
    </form>
  </div>
</template>
<script>
import axios from 'axios';
export default {
  name: 'field-create',
  props: {
    id: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      field: {
        name: '',
        unit: '',
        category: this.$props.id,
      },
    }
  },
  methods: {
    async addField() {
      await axios.post(`fields-add/${this.$props.id}/`, this.field).then(response => {
        if (response.status === 201) {
          alert("Field added");
        };
      });
    }
  },
}
</script>
<style lang="">
  
</style>