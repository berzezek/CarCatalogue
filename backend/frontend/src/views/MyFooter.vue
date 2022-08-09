<template>
  <!-- Footer-->
  <footer
    class="footer bg-black small text-center text-white-50 d-none"
    ref="myFooter"
  >
    <div class="container px-4 px-lg-5" @click="dashboardPush">
      Copyright &copy; LcMotorsKorea 2022
    </div>
  </footer>
</template>

<script>
export default {
  methods: {
    showFooter() {
			if (location.pathname === '/') {
				const footer = this.$refs.myFooter;
      	footer.classList.remove("d-none");
			} else {
				footer.classList.add("d-none");
			}
      
    },
		dashboardPush() {
			this.$router.push('/dashboard')
		}
  },
  mounted() {
    this.showFooter();
  },
};
</script>

<style>
	@import "@/css/styles.css";
</style>