<template>
  <yes-or-not></yes-or-not>
</template>

<script>
import YesOrNot from "./components/YesOrNot.vue";

export default {
  name: "App",
  components: {
    YesOrNot,
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
</style>
