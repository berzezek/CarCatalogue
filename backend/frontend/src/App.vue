<script setup>
  import MyNavbar from '@/views/MyNavbar.vue'
  import MyFooter from '@/views/MyFooter.vue'
</script>

<template>
  <div v-cloak>
    <my-navbar />
    <div class="flex justify-content-center">
      <router-view class="router-view" />
    </div>

    <my-footer class="my-footer" v-if="$route.path !== '/dashboard'"/>
    <!-- <my-footer class="my-footer" /> -->
  </div>

</template>

<style lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Poiret+One&display=swap');
.content {
  padding-top: 6rem;
}

[v-cloak] {
  display: none;
}
</style>
