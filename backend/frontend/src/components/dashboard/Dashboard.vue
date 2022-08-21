<template>
  <div class="dashboard">
    <Login />
  </div>
</template>

<script>
import { mapActions, mapGetters } from "vuex";
import Login from "@/components/login/Login.vue";
export default {
  components: {
    Login,
  },
  methods: {
    ...mapActions(["getUser"]),
    isAuth() {
      console.log(this.currIsAuthenticate);
      if (this.currIsAuthenticate) {
        this.$router.push("/dashboard-view");
      }
    },
  },
  computed: {
    ...mapGetters(["currIsAuthenticate"]),
  },
  mounted() {
    this.getUser();
    this.isAuth();
  },
};
</script>

<style lang="scss">
.dashboard {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.btn {
  text-transform: uppercase;
}
</style>