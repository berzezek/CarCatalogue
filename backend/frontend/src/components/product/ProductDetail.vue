<template>
  <div>
    <div class="center-parent" v-if="show">
      <my-loader class="center-loader" />
    </div>
    <div v-else class="content">
      <image-carousel
        :id="$route.params.id"
        v-if="show"
        @destroy="disableCarousel"
        @ready="disableLoad"
      />
      <div class="container col-md-6 card">
        <div class="img-detail">
          <h3 class="ms-3 mt-2"><b>{{ allProduct.name }}</b></h3>
          <image-product-original
            :id="$route.params.id"
            @click="showCarousel"
          />
        </div>

        <h5 class="text-end me-3 mt-2"><b>{{ accountInUSD }}$</b></h5>
        <div class="product-field">
          <product-fields :id="this.$route.params.id" class="my-3" />
        </div>
      </div>
      <div class="d-flex justify-content-center my-3">
        <button class="btn btn-success" @click="$router.go(-1)">Back</button>
      </div>
    </div>
  </div>
</template>

<script>
import ProductFields from "@/components/product/ProductFields.vue";
import ImageCarousel from "@/components/imageProduct/ImageCarousel.vue";
import ImageProductOriginal from "@/components/imageProduct/ImageProductOrginal.vue";
import MyLoader from "@/components/loader/MyLoader.vue";
import { mapActions, mapGetters } from "vuex";
export default {
  name: "product-detail",
  components: {
    ImageCarousel,
    ProductFields,
    ImageProductOriginal,
    MyLoader,
  },
  data() {
    return {
      show: false,
    };
  },

  watch: {
    show() {
      return this.show;
    },
  },
  methods: {
    ...mapActions(["getProduct"]),
    showCarousel() {
      this.show = true;
    },
    disableCarousel() {
      this.show = false;
    },
    disableLoad() {
      this.show = false;
    },
  },
  computed: {
    ...mapGetters(["allProduct"]),
    accountInUSD() {
      const price = Math.floor(this.allProduct.price_in_USD)
        .toString()
        .replace(/\B(?=(\d{3})+(?!\d))/g, " ");
      return price;
    },
  },
  mounted() {
    this.getProduct(this.$route.params.id);
    console.log(this.allProduct.price_in_USD);
  },
};
</script>
<style lang="scss" scoped>
.img-detail :hover {
  box-shadow: 0 40px 80px 0 rgba(255, 255, 255, 0.5);
  transition: 0.3s;
}

.center-parent {
  z-index: 1;
  display: flex;
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: rgba(144, 143, 160, 0.438);
}

.center-loader {
  margin: auto;
  z-index: 2;
}

.card {
  display: block;
}

@media all and (max-width: 902px) {
  .card {
    display: flex;
  }
}
</style>
