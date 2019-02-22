<template>
  <div></div>
</template>

<script>
  import { EVENT_NAMES } from '../constants';

  export default {
    props: ['isRunning', 'interval'],

    created() {
      this.tickTimeoutId = null;
    },

    methods: {
      tick() {
        this.$emit(EVENT_NAMES.TICK);
      },
      stop() {
        clearTimeout(this.tickTimeoutId);
        this.tickTimeoutId = null;
      },
      start() {
        this.tick();

        this.tickTimeoutId = setTimeout(
          () => { this.start(); },
          this.$props.interval
        );
      }
    },

    watch: {
      isRunning(newValue, oldValue) {
        if (!newValue && oldValue) {
          this.stop();
        }

        if (!oldValue && newValue) {
          this.start();
        }
      }
    }
  }
</script>

<style>

</style>
