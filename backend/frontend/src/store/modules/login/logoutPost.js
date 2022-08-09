import router from '@/router/router'
import axios from 'axios';
export default {
  actions: {
    async logoutPost() {
      await axios.post(`auth/token/logout/`, {
        headers: {
          'Authorization': `Token ${localStorage.token}`
        }
      })
      .catch(e => {
        if (e.response.status === 401) {
          localStorage.removeItem('token');
          alert('LOGOUT');
          router.push('/dashboard')
        }
      });
    },
  },
  mutations: {
    isAuth() {
      this.$store.isAuthenticate = false;
    }
  },
  getters: {},
  state: {}
}