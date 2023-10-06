<script>
export default {
  props: {
    name: {
      type: String,
      default: '',
    },
    title: {
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
      <h2 class="text-lowercase">{{ name }}</h2>
    </v-row>
    <v-row justify="center" class="colorText" no-gutters>
      <h2 class="text-lowercase">{{ title }}</h2>
    </v-row>
    <v-row justify="center">
      <v-col v-for="(item, i) in contactOptions" :key="i" cols="auto">
        <a :href="item.url">
          <v-icon left class="headingText">{{ item.icon }}</v-icon>
          {{ item.text }}
        </a>
      </v-col>
    </v-row>
  </v-container>
</template>
