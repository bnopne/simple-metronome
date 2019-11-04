<template>
  <div class="metronome">
    <audio ref="strongClick" src="./resources/strongClick.wav"></audio>
    <audio ref="click" src="./resources/click.wav"></audio>
  </div>
</template>

<script>
  import { mapState } from 'vuex';
  import { get } from 'lodash';

  export default {
    data() {
      return {
        currentBeat: 0,
        timeoutId  : null,
      };
    },

    computed: mapState({
      isPlaying  : state => get(state, 'isPlaying'),
      beatsPerBar: state => get(state, ['timeSignature', 'beatsPerBar']),
      tempo      : state => get(state, 'tempo'),
    }),

    methods: {
      tick() {
        const {
          strongClick,
          click,
        } = this.$refs;

        const audioElement = this.currentBeat === 0 ? strongClick : click;
        this.currentBeat = (this.currentBeat + 1) % this.beatsPerBar;
        this.playClick(audioElement);
      },

      playClick(audioElement) {
        audioElement.pause();
        audioElement.currentTime = 0;
        audioElement.play();
      },

      play() {
        const onTimeout = () => {
          this.tick();
          this.timeoutId = setTimeout(onTimeout, Math.ceil((1000 * 60) / this.tempo));
        }

        onTimeout();
      },

      stop() {
        clearTimeout(this.timeoutId);
        this.timeoutId = null;
      },
    },

    watch: {
      isPlaying(value, prevValue) {
        if (value && !prevValue) {
          this.play();
        }

        if (!value && prevValue) {
          this.stop();
        }
      },
    },
  }
</script>

<style>
  .metronome {
    display: none;
  }
</style>
