<template>
    
      <div class="card">
        <router-link :to="{name: 'product-detail', params: {id: this.$props.id, price: this.$props.price } }">
          <image-product :id="id"/>
        </router-link>
        
          <div class="container" @mouseover="showDescription" @mouseleave="showTitle">
            <div>
              <h4 v-if="!show && !!carDescription"><b>{{ carDescription }}</b></h4>
              
              <h4 v-else><b>{{ carTitle }}</b></h4>
              <p>{{ price }} $</p>             
            </div>
            
          </div> 
        
        
      </div>
    
  
</template>  

<script>
  import { BCard } from 'bootstrap-vue-3';

  import ImageProduct from "@/components/imageProduct/ImageProduct.vue";
  export default {
    components: {
      BCard,
      ImageProduct
    },
    data() {
      return {
        carTitle: this.$props.title,
        carDescription: this.$props.description,
        show: true
      }
    },
    props: {
      id: {
        type: Number
      },
      imgCat: {
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
      price: {
        type: [Number, String]
      },
      createdAt: {
        type: String,
        default: ""
      }
    },

    methods: {
      showDescription() {
        // setTimeout(() => {
          this.show = false
        // }, 300)
        
      },
      showTitle() {
        // setTimeout(() => {
          this.show = true
        // }, 300)
        
      },
    },
    watch: {
      carTitle() {
        console.log('work2');
      }
    }

  };
</script>

<style scoped>
  .card :hover {
    /* Add shadows to create the "card" effect */
    box-shadow: 0 40px 80px 0 rgba(255, 255, 255, 0.5);
    transition: 0.3s;
  }

  .slide-fade-enter-active {
    transition: all 0.3s ease-out;
  }

  .slide-fade-leave-active {
    transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
  }

  .slide-fade-enter-from,
  .slide-fade-leave-to {
    transform: translateX(20px);
    opacity: 0;
  }

</style>