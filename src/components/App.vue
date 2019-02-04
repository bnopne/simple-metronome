<template>
  <main class="app">
    <div class="app__container">
      <div>
        <stop-button v-if="isPlaying"></stop-button>
        <play-button v-else></play-button>
      </div>
      <div>
        <tempo-input></tempo-input>
      </div>
      <div>
        <time-signature-input></time-signature-input>
      </div>
      <metronome></metronome>
    </div>
  </main>
</template>

<script>
  import { mapState } from 'vuex';
  import { get } from 'lodash';

  import Metronome from './Metronome.vue';
  import PlayButton from './buttons/PlayButton.vue';
  import StopButton from './buttons/StopButton.vue';
  import TempoInput from './inputs/TempoInput.vue';
  import TimeSignatureInput from './inputs/TimeSignatureInput.vue';
  import store from '../store';

  export default {
    store,

    components: {
      'play-button'         : PlayButton,
      'stop-button'         : StopButton,
      'tempo-input'         : TempoInput,
      'time-signature-input': TimeSignatureInput,
      'metronome'           : Metronome,
    },

    computed: mapState({
      isPlaying: state => get(state, 'isPlaying'),
    }),
  }
</script>

<style>
  body {
    margin: 0;
  }

  .app {
    background-color: #C5C3C6;
    width: 100vw;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .app__container {
    width: 250px;
    height: 350px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
  }
</style>
