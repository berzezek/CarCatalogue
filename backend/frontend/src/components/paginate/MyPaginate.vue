<template>
  <vue-awesome-paginate
    :current-page="1"
    :on-click="onClickHandler"
  />
</template>

<script>
  export default {

    methods: {
      onClickHandler(page) {
        this.$emit('change', page);
      }
    }
  }
</script>

<style lang="scss">
  .pagination-container {
    display: flex;
    column-gap: 10px;
  }
  .paginate-buttons {
    height: 40px;
    width: 40px;
    border-radius: 20px;
    cursor: pointer;
    background-color: rgb(242, 242, 242);
    border: 1px solid rgb(217, 217, 217);
    color: black;
  }
  .paginate-buttons:hover {
    background-color: #d8d8d8;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    transition: 0.6s;
  }
  .active-page {
    background-color: #67c29c;
    border: 1px solid #67c29c;
    color: white;
  }
  .active-page:hover {
    background-color: #67c29c;
  }
</style>