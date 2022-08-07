import axios from 'axios';
export default {
  actions: {
    async signIn(login) {
      await axios.post(`auth/token/login/`, login).then(response => {
        if (response.status === 200) {
          alert('Success')
          localStorage.setItem('token', response.data.auth_token);
        } else {
          alert('Something wrong')
        }
      })
    }
  },
  mutations: {},
  getters: {}, 
  state: {}
}