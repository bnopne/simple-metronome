<template>
  <div class="Metronome">
    <audio ref="strongClick" src="./resources/strongClick.wav"></audio>
    <audio ref="click" src="./resources/click.wav"></audio>
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
      'beatsPerBar',
      'beatDuration',
      'tempo',
      'isPlaying'
    ],

    data() {
      return {
        currentBeat: 0,
      };
    },

    computed: {
      interval() {
        return Math.floor((60 * 1000) / this.$props.tempo);
      },
      tickListeners() {
        return Object.assign(
          {},
          this.$listeners,
          {
            [EVENT_NAMES.TICK]: () => {
              this.onTick();
            },
          }
        );
      }
    },

    methods: {
      onTick() {
        const {
          strongClick,
          click,
        } = this.$refs;

        const {
          beatsPerBar,
        } = this.$props;

        const audioElement = this.currentBeat === 0 ? strongClick : click;
        this.currentBeat = (this.currentBeat + 1) % beatsPerBar;
        this.playClick(audioElement);
      },

      playClick(audioElement) {
        audioElement.pause();
        audioElement.currentTime = 0;
        audioElement.play();
      }
    }
  }
</script>

<style>
  .Metronome {
    display: none;
  }
</style>
