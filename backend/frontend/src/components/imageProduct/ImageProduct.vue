<template lang="">
  <MDBCardImg
    :src="image"
    top
  />
</template>
<script>
import { MDBCardImg } from "mdb-vue-ui-kit";

import axios from 'axios'
export default {
    components: {
    MDBCardImg,
  },
  data() {
    return {
      image: null,
    }
  },
  props: {
    id: {
      type: Number,
      required: true,
    }
  },
  methods: {
    getImage() {
      axios.get(`images/${this.$props.id}/`).then(response => {
        try {
          this.image = response.data[0].get_thumbnail;
        } catch (e) {
          this.image = '/media/images/default.jpg';
        }
      })
    }
  },
  mounted() {
    this.getImage()
  }
}
</script>
<style lang="">
  
</style>