<script setup>
  import MyNavbar from '@/views/MyNavbar.vue'
  import MyFooter from '@/views/MyFooter.vue'
</script>

<template>
<div>
  <my-navbar />
    <div class="flex justify-content-center">
      <router-view class="router-view"/>
    </div>
      
  <my-footer class="my-footer"/>
</div>

</template>

<style lang="scss">

  $main-color: rgba(97, 97, 97, 0.692);


  body {
    background-color: $main-color !important;
  }

  .content {
    padding-top: 6rem;
  }

</style>
