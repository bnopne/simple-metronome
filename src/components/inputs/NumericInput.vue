<template>
  <input
    class="numeric-input"
    type="number"
    v-bind:value="value"
    v-on:input="$emit('input', $event.target.value)"
  >
</template>

<script>
  export default {
    props: ['value'],
  }
</script>

<style>
  .numeric-input {
    width: 50px;
    padding: 4px;
    background: #DCDCDD;
    border: 2px solid #46494C;
    transition-property: box-shadow;
    transition-duration: 200ms;
  }

  .numeric-input:focus {
    box-shadow: 0px 4px 25px rgba(0, 0, 0, 0.25);
  }
</style>
