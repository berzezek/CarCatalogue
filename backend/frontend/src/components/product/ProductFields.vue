<template>
    <!-- <table class="table table-striped">
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
          <td >-</td>
          <td v-else>{{ field.category_field.unit }}</td>
        </tr>
        <tr>
          <td>price</td>
          <td>USD</td>
          <td>{{ accountInUSD }}</td>
        </tr>
      
      </tbody>
    </table> -->
    <div class="field-name" v-for="field in product_fields" :key="field.id">
      <div class="name">{{ field.category_field.name }}</div>
      <div class="field-volume">
        <div class="">{{ field.value }}</div>
        <div class="">{{ field.category_field.unit }}</div> 
      </div>
      
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
    },
    price: {
      type: [Number, String]
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
  computed: {
      accountInUSD() {
        let formatPrice = new Intl.NumberFormat().format(+this.$props.price)
        return formatPrice
      },
      capitalizeFirstLetter(obj) {
        return obj.map((obj) => {
          obj.value.capitilize()
        })
      }
    }
  
}
</script>
<style>
  .field-name {
    width: 80%;
    margin: auto;
    display: flex;
  }


  
</style>