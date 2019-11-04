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
  import { mapState } from 'vuex';
  import { get } from 'lodash';

  import { SET_TIME_SIGNATURE } from '../../store';
  import NumericInput from './NumericInput.vue';

  export default {
    components: {
      'numeric-input': NumericInput,
    },

    computed: mapState({
      beatDuration: state => get(state, ['timeSignature', 'beatDuration']),
      beatsPerBar : state => get(state, ['timeSignature', 'beatsPerBar']),
    }),

    methods: {
      onInputBeatsPerBar(value) {
        this.$store.commit({
          type        : SET_TIME_SIGNATURE,
          beatsPerBar : value,
          beatDuration: this.beatDuration,
        });
      },
      onInputBeatDuration(value) {
        this.$store.commit({
          type        : SET_TIME_SIGNATURE,
          beatsPerBar : this.beatsPerBar,
          beatDuration: value,
        });
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
