<template>
  <MDBCard class="h-100">
    <MDBCardBody>
      <MDBCardTitle>{{ title }}</MDBCardTitle>
      <MDBCardText>
        {{ description }}
      </MDBCardText>
    </MDBCardBody>
    <MDBCardImg
      :src="imgSrc"
      top
      :alt="imgAlt"
    />

    <MDBCardFooter>
      <small class="text-muted">Last updated 3 mins ago</small>
    </MDBCardFooter>
  </MDBCard>
</template>  

<script>
  import { MDBCard, MDBCardBody, MDBCardTitle, MDBCardText, MDBCardImg, MDBCardFooter } from "mdb-vue-ui-kit";
  export default {
    components: {
      MDBCard,
      MDBCardBody,
      MDBCardTitle,
      MDBCardText,
      MDBCardImg,
      MDBCardFooter,
    },
    props: {
      imgSrc: {
        type: String,
        default:
          "https://mdbootstrap.com/img/new/standard/city/044.webp"
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