<template>
  <div class="container">
    <carousel :items-to-show="1">
      <slide v-for="slide in images" :key="slide.id">
        <MDBCardImg
          :src="slide.image"
          top
        />
      </slide>

      <template #addons>
        <navigation />
        <pagination />
      </template>
    </carousel>
    
  </div>
</template>

<script>
import axios from 'axios'
import 'vue3-carousel/dist/carousel.css';
import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel';
import { MDBCardImg } from "mdb-vue-ui-kit";

export default {
  name: 'product-detail',
  components: {
    Carousel,
    Slide,
    Pagination,
    Navigation,
    MDBCardImg
  },
  data() {
    return {
      images: [],
    }
  },
  props: {
    id: {
      type: [Number, String],
      required: true,
    }
  },
  methods: {
    getImages() {
      axios.get(`images/${this.$props.id}/`).then(response => {
        this.images = response.data
      })
    }
  },
  mounted() {
    this.getImages()
  }

 
}
</script>
<style scoped>
  .content {
    padding: 10rem 1rem 10rem 1rem;
    background-color: red;
  }

  img {
    width: 100%;
  }


</style>
