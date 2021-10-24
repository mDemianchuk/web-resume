<script>
export default {
  props: {
    title: {
      type: String,
      default: '',
    },
    text: {
      type: String,
      default: '',
    },
  },
};
</script>

<template>
  <v-container>
    <v-row no-gutters>
      <h1>{{ title }}</h1>
    </v-row>
    <v-row>
      <v-col>
        <span>{{ text }}</span>
      </v-col>
    </v-row>
  </v-container>
</template>
