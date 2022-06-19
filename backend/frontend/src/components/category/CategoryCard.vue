<template>
<router-link :to='{ name: "subcategories", params: { id: id } }'>
  <MDBCard class="h-100">
    <MDBCardImg
      :src="imgSrc"
      top
      :alt="imgAlt"
    />
    <MDBCardBody>
      <MDBCardTitle>{{ title }}</MDBCardTitle>
      <MDBCardText>
        {{ description }}
      </MDBCardText>
    </MDBCardBody>
  </MDBCard>
</router-link>
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
      id: {
        type: Number,
      },
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
      description: {
        type: String,
        default: ""
      }
    },
  };
</script>
