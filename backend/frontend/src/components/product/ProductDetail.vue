<template>  
<div class="content">
  <div class="container col-md-6">
    <div class="">

      <image-product-original :id="$route.params.id" @click="showCarousel" />
      <image-carousel :id="$route.params.id" v-if="show" @destroy="disableCarousel" @ready="disableLoad" />
      <my-loader v-if="load" class="in-center" />
    </div>
    
    <!-- <div>
      <product-fields :id="this.$route.params.id" class="my-5" />
    </div> -->
    
  </div>
  <div class="d-flex justify-content-center my-3">
    <button class="btn btn-success" @click="$router.push({ path: '/products-all' })">Back</button>
  </div>
</div>

  
   
</template>

<script>
import ProductFields from '@/components/product/ProductFields.vue';
import ImageCarousel from '@/components/imageProduct/ImageCarousel.vue';
import ImageProductOriginal from "@/components/imageProduct/ImageProductOrginal.vue";
import MyLoader from '@/components/loader/MyLoader.vue';
export default {
  name: 'product-detail',
  data() {
    return {
      show: false,
      load: false,
    }
  },
  components: {
    ImageCarousel,
    ProductFields,
    ImageProductOriginal,
    MyLoader
  },
  watch: {
    show() {
      return this.show
    }
  },
  methods: {
    showCarousel() {
      this.show = true;
      this.load = true;
    },
    disableCarousel() {
      this.show = false
    },
    disableLoad() {
      this.load = false;
    }

  }

}
</script>
<style scoped>
  .in-center {
    margin-top: 200px
  }
</style>
