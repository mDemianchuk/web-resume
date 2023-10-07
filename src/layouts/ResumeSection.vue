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
    <v-row no-gutters class="my-6">
      <h2 class="accentText text-lowercase font-weight-bold">{{ title }}</h2>
    </v-row>
    <slot />
  </v-container>
</template>
