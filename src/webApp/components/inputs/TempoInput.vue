<template>
  <div class="TempoInput">
    <div class="TempoInputTitle">BPM</div>
    <numeric-input
      v-bind:value="tempo"
      v-on:input="onInput"
    ></numeric-input>
  </div>
</template>

<script>
  import NumericInput from './NumericInput.vue';
  import { EVENT_NAMES } from '../../constants';

  export default {
    props: ['tempo'],

    components: {
      'numeric-input': NumericInput,
    },

    methods: {
      onInput(value) {
        this.$emit(EVENT_NAMES.SET_TEMPO, value);
      }
    }
  }
</script>

<style>
  .TempoInput {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 110px;
  }

  .TempoInputTitle {
    font-size: 18px;
    font-weight: 800;
  }
</style>
