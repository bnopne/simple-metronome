<template>
  <div class="Metronome">
    <audio ref="click" src="./click.wav"></audio>
    <tick-generator v-on="tickListeners" :is-running="isPlaying" :interval="interval"></tick-generator>
  </div>
</template>

<script>
  import TickGenerator from './TickGenerator.vue';
  import { EVENT_NAMES } from '../constants';

  export default {
    components: {
      'tick-generator': TickGenerator,
    },

    props: [
      'timeSignature',
      'tempo',
      'isPlaying'
    ],

    computed: {
      interval() {
        return Math.floor((60 * 1000) / this.$props.tempo)
      },
      tickListeners() {
        return Object.assign(
          {},
          this.$listeners,
          {
            [EVENT_NAMES.TICK]: () => {
              this.$refs.click.play();
            },
          }
        )
      }
    },

    mounted() {
      this.audioContext = new window.AudioContext();
      const player = this.audioContext.createMediaElementSource(this.$refs.click);
      player.connect(this.audioContext.destination);
    }
  }
</script>

<style>
  .Metronome {
    display: none;
  }
</style>
