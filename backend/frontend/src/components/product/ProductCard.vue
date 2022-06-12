<template>
  <div class="container">
      <router-link :to="{name: 'product-detail', params: {id: id } }">
      <MDBCard class="h-100">
        <MDBCardBody>
          <MDBCardTitle>{{ title }}</MDBCardTitle>
          <MDBCardText>
            {{ description }}
          </MDBCardText>
        </MDBCardBody>
        <image-product :id="id"/>
        <MDBCardFooter>
          <small class="text-muted">Last updated 3 mins ago</small>
        </MDBCardFooter>
        
      </MDBCard>
    </router-link>
  </div>
</template>  

<script>
  import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardImg, MDBCardFooter } from "mdb-vue-ui-kit";
  
  import ImageProduct from "@/components/imageProduct/ImageProduct.vue";
  export default {
    components: {
      MDBCard,
      MDBCardBody,
      MDBCardTitle,
      MDBCardText,
      MDBCardImg,
      MDBCardFooter,
      ImageProduct
    },
    props: {
      id: {
        type: Number,
      },
      imgSrc: {
        type: String,
        default:
          "https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg",
      },
      imgTop: {
        type: Boolean,
        default: true
      },
      imgAlt: {
        type: String,
        default: "MDB Team"
      },
      title: {
        type: String,
        default: "Card title"
      },
      text: {
        type: String,
        default: ""
      },
      footerText: {
        type: String,
        default: "Last updated 3 mins ago"
      },
      description: {
        type: String,
        default: ""
      },
    },
  };
</script>

<style scoped>
</style>