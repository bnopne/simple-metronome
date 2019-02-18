<template>
  <div class="TimerSignatureInput">
    <div class="TitleBlock">
      Time Signature
    </div>
    <div class="InputBlock">
      <numeric-input
        v-bind:value="beatsPerBar"
        v-on:input="onInputBeatsPerBar"
      ></numeric-input>
      <div class="TimerSignatureInputDivider">/</div>
      <numeric-input
        v-bind:value="beatDuration"
        v-on:input="onInputBeatDuration"
      ></numeric-input>
    </div>
  </div>
</template>

<script>
  import NumericInput from './NumericInput.vue';
  import { EVENT_NAMES } from '../../constants';

  export default {
    props: ['beatsPerBar', 'beatDuration'],

    components: {
      'numeric-input': NumericInput,
    },

    methods: {
      onInputBeatsPerBar(value) {
        this.$emit(EVENT_NAMES.SET_BEATS_PER_BAR, value);
      },
      onInputBeatDuration(value) {
        this.$emit(EVENT_NAMES.SET_BEAT_DURATION, value);
      },
    }
  }
</script>

<style>
  .TimerSignatureInput {
    width: 150px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
  }

  .TitleBlock {
    font-size: 18px;
    font-weight: 800;
  }

  .InputBlock {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
  }

  .TimerSignatureInputDivider {
    font-size: 29px;
    font-weight: 800;
  }
</style>
