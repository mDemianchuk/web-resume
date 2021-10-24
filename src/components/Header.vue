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
  <v-row class="text-center">
    <v-col>
      <v-row justify="center" no-gutters>
        <strong>{{ name }}</strong>
      </v-row>
      <v-row justify="center" no-gutters>
        <v-col v-for="(item, index) in contactOptions" :key="index">
          <v-icon small left>{{ item.icon }}</v-icon>
          <span>{{ item.text }}</span>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
