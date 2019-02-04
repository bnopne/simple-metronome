<template>
  <main class="App">
    <div class="PlaybackControlBlock">
      <play-button></play-button>
    </div>
    <div class="TempoControlBlock">
      <tempo-input></tempo-input>
    </div>
    <div class="TimeSignatureControlBlock">
      <time-signature-input></time-signature-input>
    </div>
  </main>
</template>

<script>
  import PlayButton from './buttons/PlayButton.vue';
  import StopButton from './buttons/StopButton.vue';
  import TempoInput from './inputs/TempoInput.vue';
  import TimeSignatureInput from './inputs/TimeSignatureInput.vue';

  export default {
    components: {
      'play-button': PlayButton,
      'stop-button': StopButton,
      'tempo-input': TempoInput,
      'time-signature-input': TimeSignatureInput,
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
