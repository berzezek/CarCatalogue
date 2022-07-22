<template>  
<div 
  class="center-parent" 
  v-if="load"
>
  <my-loader class="center-loader"/>
  <!-- <char-loader class="center-loader"/> -->
</div>
<div class="content">
  
  <div class="container col-md-6 card">
    <div class="img-detail">
      <image-product-original :id="$route.params.id" @click="showCarousel" />
    </div>
    
    <image-carousel :id="$route.params.id" v-if="show" @destroy="disableCarousel" @ready="disableLoad" />
    <div>
      <product-fields :id="this.$route.params.id" :price="price" class="my-5" />
    </div>
    
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
  props: {
    price: {
      type: [Number, String]
    }
  },
  components: {
    ImageCarousel,
    ProductFields,
    ImageProductOriginal,
    MyLoader,
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

  .img-detail :hover{
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


</style>
