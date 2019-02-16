<template>
  <audio ref="click" src="./click.wav"></audio>
</template>

<script>
  export default {
    created() {
      this.audioContext = new window.AudioContext();
    }
  }
</script>

<style>

</style>
