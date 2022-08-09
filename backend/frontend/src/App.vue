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

    <my-footer class="my-footer" v-if="$route.path === '/'"/>
  </div>

</template>

<style lang="scss">

.content {
  padding-top: 6rem;
}

[v-cloak] {
  display: none;
}
</style>
