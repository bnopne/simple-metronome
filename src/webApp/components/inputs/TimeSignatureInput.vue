<template>
  <div class="TimerSignatureInput">
    <div class="TitleBlock">
      Time Signature
    </div>
    <div class="InputBlock">
      <numeric-input></numeric-input>
      <div class="TimerSignatureInputDivider">/</div>
      <numeric-input></numeric-input>
    </div>
  </div>
</template>

<script>
  import NumericInput from './NumericInput.vue';

  export default {
    components: {
      'numeric-input': NumericInput,
    },
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
