<script>
export default {
  props: {
    name: {
      type: String,
      default: '',
    },
    contactOptions: {
      type: Array,
      default: () => [],
    },
  },
};
</script>

<template>
  <v-container class="text-center">
    <v-row justify="center" no-gutters>
      <h1>{{ name }}</h1>
    </v-row>
    <v-row>
      <v-col
        v-for="(item, i) in contactOptions"
        :key="i"
        cols="12"
        lg="3"
        md="3"
        sm="6"
      >
        <v-icon left class="headingText">{{ item.icon }}</v-icon>
        <span>{{ item.text }}</span>
      </v-col>
    </v-row>
  </v-container>
</template>
