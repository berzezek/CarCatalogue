<template>
  <!-- Footer-->
  <footer class="footer bg-black small text-center text-white-50">
    <div class="container px-4 px-lg-5" @click="dashboardPush">
      Copyright &copy; LcMotorsKorea 2022
    </div>
  </footer>
</template>

<script>
export default {
  methods: {

    dashboardPush() {
      this.$router.push('/dashboard')
    }
  },
  mounted() {
  },
};
</script>

<style>
@import "@/css/styles.css";
</style>