<template>
  <div>
    <audio ref="click" src="./click.wav"></audio>
  </div>
</template>

<script>
  export default {
    props: [
      'timeSignature',
      'tempo',
      'isPlaying'
    ],

    mounted() {
      this.audioContext = new window.AudioContext();
      const player = this.audioContext.createMediaElementSource(this.$refs.click);
      player.connect(this.audioContext.destination);
    },

    watch: {
      async isPlaying() {
        if (this.audioContext.state === 'suspended') {
          await this.audioContext.resume();
        }

        if (!this.$props.isPlaying) {
          clearInterval(this.clickIntervalId);
          return;
        }

        if (this.clickIntervalId) {
          clearInterval(this.clickIntervalId);
        }

        this.clickIntervalId = setInterval(
          () => this.$refs.click.play(),
          Math.floor((60 * 1000) / this.$props.tempo)
        );
      },
    }
  }
</script>

<style>

</style>
