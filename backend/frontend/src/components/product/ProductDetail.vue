<template>  
  <div>
    <image-carousel :id="this.$route.params.id" />
    <prouduct-fields :id="this.$route.params.id" class="my-5" />
  </div>
   
</template>

<script>
import ProuductFields from './ProuductFields.vue';
import ImageCarousel from '@/components/imageProduct/ImageCarousel.vue';
export default {
  name: 'product-detail',
  data() {
    return {
    }
  },
  components: {
    ImageCarousel,
    ProuductFields
  },
}
</script>
<style scoped>
</style>
