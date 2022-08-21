<template>
  <div class="card p-1">
    <router-link
      :to="{
        name: 'product-detail',
        params: { id: this.$props.id, price: this.$props.price },
      }"
    >
      <image-product :id="id" class="image-product"/>
    </router-link>

    <div class="container" @mouseover="showDescription" @mouseleave="showTitle">
      <div class="mt-2">
        <h4 v-if="!show && !!carDescription">
          <b>{{ carDescription }}</b>
        </h4>

        <h4 v-else>
          <b>{{ carTitle }}</b>
        </h4>
        <p>{{ accountInUSD }} $</p>
      </div>
    </div>
  </div>
</template>  

<script>
import ImageProduct from "@/components/imageProduct/ImageProduct.vue";
export default {
  components: {
    ImageProduct,
  },
  data() {
    return {
      carTitle: this.$props.title,
      carDescription: this.$props.description,
      show: true,
    };
  },
  props: {
    id: {
      type: Number,
    },
    imgCat: {
      type: String,
      default:
        "https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg",
    },
    imgTop: {
      type: Boolean,
      default: true,
    },
    imgAlt: {
      type: String,
      default: "MDB Team",
    },
    title: {
      type: String,
      default: "Card title",
    },
    text: {
      type: String,
      default: "",
    },
    footerText: {
      type: String,
      default: "Last updated 3 mins ago",
    },
    description: {
      type: String,
      default: "",
    },
    price: {
      type: [Number, String],
    },
    createdAt: {
      type: String,
      default: "",
    },
  },
  computed: {
    accountInUSD() {
      let price = Math.floor(this.price);
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
    },
  },

  methods: {
    showDescription() {
      // setTimeout(() => {
      this.show = false;
      // }, 300)
    },
    showTitle() {
      // setTimeout(() => {
      this.show = true;
      // }, 300)
    },
  }
};
</script>

<style scoped>

.card {
  background-color: #efefef;
  border: none
}

@media (max-width: 767px) {
  .card {
    /* border: 2px solid #636363; */
  }
}

.image-product {
  border-radius: 20px;
}

.card:hover {
  /* create shadow with transitions */
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  transition: 0.6s;
}

.slide-fade-enter-active {
  transition: all 0.3s ease-out;
}

.slide-fade-leave-active {
  transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(20px);
  opacity: 0;
}
</style>