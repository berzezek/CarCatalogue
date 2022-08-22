<template>
    <ul class="oglavl">
      <li v-for="field in product_fields" :key="field.id">
        <span class="text"><b>{{ field.category_field.name }}</b></span>
        <span class="page"
          ><b>{{ field.value}} </b><span v-if="field.category_field.unit">
            <b>({{ field.category_field.unit }})</b>
          </span></span
        >
      </li>
    </ul>
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

ul.oglavl {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

ul.oglavl li {
  border-bottom: 1px dotted #c2c2c2; /* Необязателен. Здесь задается толщина, тип и цвет точек */
  position: relative;
  padding: 0;
  margin-bottom: 5px; /* Необязателен. Задается для установки расстояния между блоками li */
}

ul.oglavl li span {
  background-color: #fff; /* Это необходимо, чтобы перекрыть точки фоном */
  margin: 0;
}

ul.oglavl li span.text,
ul.oglavl li span.page {
  bottom: -5px; /* Смещаем значимые блоки, чтобы они перекрыли точки */
}

ul.oglavl span.text {
  position: relative;
  text-transform: capitalize;  
  margin-right: 7em; /* Задается чтобы текст не заходил на номера страниц */
  padding-right: 2px; /* Необязателен. Задается чтобы точки не подходили вплотную к концу текста */
}

ul.oglavl span.page {
  position: absolute;
  right: 0;
  padding-left: 2px; /* Необязателен. Задается чтобы точки не подходили вплотную к номерам страниц */
}
</style>