<template>
  <main class="App">
    <div class="PlaybackControlBlock">
      <stop-button v-on="playbackListeners" v-if="isPlaying"></stop-button>
      <play-button v-on="playbackListeners" v-else></play-button>
    </div>
    <div class="TempoControlBlock">
      <tempo-input v-bind:tempo="tempo" v-on="tempoListeners"></tempo-input>
    </div>
    <div class="TimeSignatureControlBlock">
      <time-signature-input
        v-bind:beatsPerBar="beatsPerBar"
        v-bind:beatDuration="beatDuration"
        v-on="timeSignatureListeners"
      ></time-signature-input>
    </div>
    <metronome
      v-bind:isPlaying="isPlaying"
      v-bind:tempo="tempo"
      v-bind:beatsPerBar="beatsPerBar"
    ></metronome>
  </main>
</template>

<script>
  import PlayButton from './buttons/PlayButton.vue';
  import StopButton from './buttons/StopButton.vue';
  import TempoInput from './inputs/TempoInput.vue';
  import TimeSignatureInput from './inputs/TimeSignatureInput.vue';
  import Metronome from './Metronome.vue';

  import { EVENT_NAMES } from '../constants';

  export default {
    components: {
      'play-button': PlayButton,
      'stop-button': StopButton,
      'tempo-input': TempoInput,
      'time-signature-input': TimeSignatureInput,
      'metronome': Metronome,
    },

    data() {
      return {
        isPlaying: false,
        beatsPerBar: 4,
        beatDuration: 4,
        tempo: 120,
      };
    },

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
        );
      },
      tempoListeners() {
        return Object.assign(
          {},
          this.$listeners,
          {
            [EVENT_NAMES.SET_TEMPO]: (tempo) => {
              this.onSetTempo(tempo);
            },
          }
        );
      },
      timeSignatureListeners() {
        return Object.assign(
          {},
          this.$listeners,
          {
            [EVENT_NAMES.SET_BEATS_PER_BAR]: (beatsPerBar) => {
              this.onSetBeatsPerBar(beatsPerBar);
            },
            [EVENT_NAMES.SET_BEAT_DURATION]: (beatDuration) => {
              this.onSetBeatDuration(beatDuration);
            },
          }
        );
      }
    },

    methods: {
      onStartMetronome() {
        this.isPlaying = true;
      },
      onStopMetronome() {
        this.isPlaying = false;
      },
      onSetTempo(tempo) {
        this.tempo = tempo;
      },
      onSetBeatsPerBar(beatsPerBar) {
        this.beatsPerBar = beatsPerBar;
      },
      onSetBeatDuration(beatDuration) {
        this.beatDuration = beatDuration;
      }
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
