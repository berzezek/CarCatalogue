<template>  
  <div class="flex-column content container">
    <div>
      <image-carousel :id="this.$route.params.id" />
    </div>
    <div>
      <product-fields :id="this.$route.params.id" class="my-5" />
    </div>
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
