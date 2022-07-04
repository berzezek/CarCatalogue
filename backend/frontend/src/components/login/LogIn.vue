<template>
<div class="login">
    <form @submit.prevent class="">
    <div class="mb-3">
      <label for="exampleInputName" class="form-label">Login</label>
      <input type="text" class="form-control" id="exampleInputName" />
    </div>
    <div class="mb-3">
      <label for="exampleInputPassword1" class="form-label">Password</label>
      <input type="password" class="form-control" id="exampleInputPassword1">
    </div>
    <button type="submit" class="btn-sm btn-primary">Submit</button>
  </form>
</div>

</template>

<script>
import axios from 'axios'
export default {
  name: 'Login',
  
}

</script>

<style>
  .login {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 75%;
  }

</style>