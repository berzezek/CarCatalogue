<template>
  <div>
    <div v-for="field in product_fields" :key="field.id" class="">
      <div class="d-flex w-md-50">
        <div class="name col-xl-4 text-capitalize">
          <b>{{ field.category_field.name }}</b>
        </div>
        <div class="field-value col-xl-4">
          <b>{{ field.value }}
            <span v-if="field.category_field.unit">
              ({{ field.category_field.unit }})
            </span></b>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "product-fields",
  props: {
    id: {
      type: [Number, String],
      required: true,
    },
  },
  data() {
    return {
      product_fields: [],
      category_id: this.$props.id,
    };
  },
  methods: {
    getProductFields() {
      axios.get(`fields/${this.category_id}/`).then((response) => {
        this.product_fields = response.data;
      });
    },
  },
  mounted() {
    this.getProductFields();
  },
  computed: {
    accountInUSD() {
      let price = Math.floor(this.price);
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
    },
    capitalizeFirstLetter(obj) {
      return obj.map((obj) => {
        obj.value.capitilize();
      });
    },
  },
};
</script>
<style lang="scss" scoped>
.my-hr {
  margin: 0.2em;
  margin-left: 10%;
  width: 80%;
  border-width: 0px;
}
b {
  color: rgb(85, 82, 82);
}
</style>