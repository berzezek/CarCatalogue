<script setup>
  import MyNavbar from '@/components/MyNavbar.vue'
  import MyFooter from '@/components/MyFooter.vue'
</script>

<template>
  <my-navbar />
  <my-footer />
</template>

<style>
  #app {
    font-family: Roboto, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    overflow-x: hidden;
    max-width: 100%;
  }

  my-navbar {
    margin-bottom: 200px;
  }

  footer {
    position: relative;
    margin-top: 200px;
    left: 0;
    bottom: 0;
    background-color: #f5f5f5;
  }
</style>
