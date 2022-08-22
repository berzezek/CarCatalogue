<template>
  <div class="login hidden">
    <form @submit.prevent>
      <h3>Sign in</h3>
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Login</label>
        <input
          type="text"
          class="form-control"
          id="exampleInputName"
          v-model="login.username"
        />
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input
          type="password"
          class="form-control"
          id="exampleInputPassword1"
          v-model="login.password"
        />
      </div>
      <button type="submit" class="btn btn-primary" @click="signIn">
        Submit
      </button>
    </form>
  </div>
</template>

<script>
import {mapActions} from "vuex";
export default {
  name: "Login",

  data() {
    return {
      login: {
        username: "",
        password: "",
      },
    };
  },

  methods: {
    ...mapActions(['signInPost']),
    signIn() {
      this.signInPost(this.login)
    }
  },
  mounted() {
  },
};
</script>

<style lang="scss" scoped>

h3 {
  text-transform: uppercase;
  text-align: center;
}
</style>