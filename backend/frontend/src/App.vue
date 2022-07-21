<script setup>
  import MyNavbar from '@/views/MyNavbar.vue'
  import MyFooter from '@/views/MyFooter.vue'
</script>

<template>
  <my-navbar />
    <div class="flex justify-content-center">
      <router-view />
    </div>
      
  <!-- <my-footer class="my-footer"/> -->
</template>

<style>

  .my-footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    margin-top: 200px;
  }

  body {
    background-color: rgb(48, 49, 63) !important;
  }

  .content {
    padding-top: 5rem;
  }

</style>
