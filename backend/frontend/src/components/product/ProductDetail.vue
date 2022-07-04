<template>  
  <div class="flex-column content container">
    <div>
      <image-carousel :id="this.$route.params.id" />
    </div>
    <div>
      <product-fields :id="this.$route.params.id" class="my-5" />
    </div>
  </div>
  <div class="d-flex justify-content-center my-3">
    <button class="btn btn-success" @click="$router.push({ path: '/products-all' })">Back</button>
  </div>
  
   
</template>

<script>
import ProductFields from '@/components/product/ProductFields.vue';
import ImageCarousel from '@/components/imageProduct/ImageCarousel.vue';
export default {
  name: 'product-detail',
  data() {
    return {
    }
  },
  components: {
    ImageCarousel,
    ProductFields
  },
}
</script>
<style scoped>
</style>
