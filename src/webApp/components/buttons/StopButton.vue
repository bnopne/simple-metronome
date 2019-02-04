<template>
  <button class="PlayButton">
    <div class="StopSign"></div>
  </button>
</template>

<script>
  export default {

  }
</script>

<style>
  .PlayButton {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-self: center;
    background-color: #4C5C68;
    width: 200px;
    height: 200px;
    border-style: none;
    border-radius: 50%;
  }

  .StopSign {
    width: 100px;
    height: 100px;
    background-color: #CDACA1;
  }
</style>
