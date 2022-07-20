<template>
  <div>

  </div>
</template>

<script>
import {Fancybox} from "@fancyapps/ui/src/Fancybox/Fancybox";
import axios from "axios";
export default {
  name: 'product-detail',
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
      console.log('work')
      axios.get(`images/${this.$props.id}/`).then(response => {
        this.images = response.data;
      }).then(() => {
        let newImages = [...this.images].map(obj => ({
          src: obj.image

        }))
        console.log(newImages)
        Fancybox.show(newImages, {});
      }).then(() => {

      })

    },
  },
  mounted() {
    this.getImages()
  }

 
}
</script>
<style scoped>
  .content {
    padding: 10rem 1rem 10rem 1rem;
    background-color: rgb(255, 255, 255);
  }

  img {
    width: 100%;
  }


</style>
