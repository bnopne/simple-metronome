<template>
  <button v-on:click="onClick" class="PlayButton">
    <div class="PlaySign"></div>
  </button>
</template>

<script>
  import { SET_IS_PLAYING } from '../../store';

  export default {
    methods: {
      onClick() {
        this.$store.commit({ type: SET_IS_PLAYING, isPlaying: true });
      }
    }
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

  .PlaySign {
    width: 0;
    height: 0;
    transform: translateX(12%);
    border-top: 60px solid transparent;
    border-bottom: 60px solid transparent;
    border-left: 90px solid #CDACA1;
  }
</style>
