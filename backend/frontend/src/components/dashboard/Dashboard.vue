<template>
  <div class="container">
    
    <div class="dashboard" v-show="isAuthenticated"> 
      <h2>{{ username }}</h2>
      <button class="btn btn-success" @click="logout">Logout</button>
    </div>
    <div v-cloak v-show="!isAuthenticated">
      <Login />
    </div>
  </div>
  
</template>

<script>
import Login from '@/components/login/Login.vue';
import axios from 'axios';
export default {
  components: {
    Login
  },
  
  data() {
    return {
      isAuthenticated: false,
      username: ''
    }
  },
  methods: {
    logout() {
      axios.post(`auth/token/logout/`, {
        headers: {
          'Authorization': `Token ${localStorage.getItem('token')}`
        }
      })
      .catch(e => {
        console.log(e);
        if (e.response.status === 401) {
          localStorage.setItem('token', null);
          this.isAuthenticated = false;
        }
      });
    },
    getUser() {
      axios.get(`auth/users/me/`, {
        headers: {
          'Authorization': `Token ${localStorage.getItem('token')}`
        }
      })
      .catch(e => {
      })
      .then(response => {
        console.log(response);
        if (response.status === 200) {
          this.isAuthenticated = true;
          this.username = response.data.username;
          this.$router.push('/dashboard-view')
        }
      })
    }
  },
  mounted() {
    this.getUser()
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