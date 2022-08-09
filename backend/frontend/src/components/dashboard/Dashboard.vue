<template>
  <div class="container">
    <Login />
  </div>
  
</template>

<script>
import {mapActions, mapGetters} from 'vuex';
import Login from '@/components/login/Login.vue';
export default {
  components: {
    Login
  },
  methods: {
    ...mapActions(['getUser']),
    isAuth() {
      if (this.currIsAuthenticate) {
        this.$router.push('/dashboard-view')
      }
    }
  },
  computed: {
    ...mapGetters(['currIsAuthenticate'])
  },
  mounted() {
    this.getUser();
    this.isAuth();
  },
  
}

</script>

<style lang="scss" scoped>

  .dashboard {
    margin: 200px,;
  }

  .btn {
    text-transform: uppercase;
  }

</style>