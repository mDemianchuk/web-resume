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
  <v-row>
    <v-col>
      <v-row no-gutters>
        <h1>{{ title }}</h1>
      </v-row>
      <v-row no-gutters>
        <span>{{ text }}</span>
      </v-row>
    </v-col>
  </v-row>
</template>
