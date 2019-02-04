<template>
  <div class="tempo-input">
    <div class="tempo-input__title">BPM</div>
    <numeric-input
      v-bind:value="tempo"
      v-on:input="onInput"
    ></numeric-input>
  </div>
</template>

<script>
  import { mapState } from 'vuex';
  import { get } from 'lodash';

  import NumericInput from './NumericInput.vue';
  import { SET_TEMPO } from '../../store';

  export default {
    components: {
      'numeric-input': NumericInput,
    },

    computed: mapState({
      tempo: state => get(state, 'tempo'),
    }),

    methods: {
      onInput(value) {
        this.$store.commit({ type: SET_TEMPO, tempo: value });
      }
    }
  }
</script>

<style>
  .tempo-input {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    width: 110px;
  }

  .tempo-input__title {
    font-size: 18px;
    font-weight: 800;
  }
</style>
