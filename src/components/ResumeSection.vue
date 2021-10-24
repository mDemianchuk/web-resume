<script>
export default {
  props: {
    title: {
      type: String,
      default: '',
    },
  },
};
</script>

<template>
  <v-container>
    <v-row no-gutters>
      <h2>{{ title }}</h2>
    </v-row>
    <slot />
  </v-container>
</template>
