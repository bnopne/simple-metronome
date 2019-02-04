<template>
  <button v-on:click="onClick" class="play-button">
    <div class="stop-sign"></div>
  </button>
</template>

<script>
  import { SET_IS_PLAYING } from '../../store';

  export default {
    methods: {
      onClick() {
        this.$store.commit({ type: SET_IS_PLAYING, isPlaying: false });
      }
    }
  }
</script>

<style>
  .play-button {
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

  .stop-sign {
    width: 100px;
    height: 100px;
    background-color: #CDACA1;
  }
</style>
