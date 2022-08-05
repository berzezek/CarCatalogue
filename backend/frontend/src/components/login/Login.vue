<template>
  <div class="login hidden" ref="loginFormWrapper">
      <form @submit.prevent>
        <h3>Sign in</h3>
      <div class="mb-3">
        <label for="exampleInputName" class="form-label">Login</label>
        <input type="text" class="form-control" id="exampleInputName" v-model="login.username" />
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" v-model="login.password" />
      </div>
      <button type="submit" class="btn btn-primary" @click="signIn">Submit</button>
    </form>
  </div>

</template>

<script>
import axios from 'axios'
export default {
  name: 'Login',

  data() {
    return {
      login: {
        username: '',
        password: ''
      },
    }
  },

  methods: {
    signIn() {
      axios.post(`auth/token/login/`, this.login).then(response => {
        if (response.status === 200) {
          alert('Success')
          localStorage.setItem('token', response.data.auth_token);
        } else {
          alert('Something wrong')
        }
      })
      .then(this.$router.push('/dashboard'))
    }
  },
  mounted() {
    setTimeout(() => {
      this.$refs.loginFormWrapper.classList.remove('hidden')
    }, 50) 
  },
}

</script>

<style lang="scss" scoped>
  .login {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 25%;
  }

  h3 {
    text-transform: uppercase;
    text-align: center;
  }
  .hidden {
    visibility: hidden;
  }

</style>