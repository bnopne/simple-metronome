<template>
  <main class="App">
    <div class="PlaybackControlBlock">
      <stop-button v-on="playbackListeners" v-if="isPlaying"></stop-button>
      <play-button v-on="playbackListeners" v-else></play-button>
    </div>
    <div class="TempoControlBlock">
      <tempo-input></tempo-input>
    </div>
    <div class="TimeSignatureControlBlock">
      <time-signature-input></time-signature-input>
    </div>
    <player></player>
  </main>
</template>

<script>
  import PlayButton from './buttons/PlayButton.vue';
  import StopButton from './buttons/StopButton.vue';
  import TempoInput from './inputs/TempoInput.vue';
  import TimeSignatureInput from './inputs/TimeSignatureInput.vue';
  import Player from './Player.vue';

  import { EVENT_NAMES } from '../constants';

  export default {
    components: {
      'play-button': PlayButton,
      'stop-button': StopButton,
      'tempo-input': TempoInput,
      'time-signature-input': TimeSignatureInput,
      'player': Player,
    },

    data: () => ({
      isPlaying: false,
      timeSignature: {
        beats: 4,
        beatDuration: 4,
      },
      tempo: 120,
    }),

    computed: {
      playbackListeners() {
        return Object.assign(
          {},
          this.$listeners,
          {
            [EVENT_NAMES.START_METRONOME]: () => {
              this.onStartMetronome();
            },
            [EVENT_NAMES.STOP_METRONOME]: () => {
              this.onStopMetronome();
            }
          }
        )
      }
    },

    methods: {
      onStartMetronome() {
        this.isPlaying = true;
      },
      onStopMetronome() {
        this.isPlaying = false;
      },
    },
  }
</script>

<style>
  .App {
    background-color: #C5C3C6;
    width: 250px;
    height: 375px;
    padding: 40px 10px 60px 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
  }
</style>
