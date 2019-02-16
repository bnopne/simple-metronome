<template>
  <div class="TempoInput">
    <div class="TempoInputTitle">BPM</div>
    <numeric-input value="tempo"></numeric-input>
  </div>
</template>

<script>
  import NumericInput from './NumericInput.vue';

  export default {
    props: ['tempo'],

    components: {
      'numeric-input': NumericInput,
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
