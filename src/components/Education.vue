<script>
export default {
  props: {
    title: {
      type: String,
      default: '',
    },
    schoolList: {
      type: Array,
      default: () => [],
    },
  },
};
</script>

<template>
  <v-row>
    <v-col>
      <v-row no-gutters>
        <strong>{{ title }}</strong>
      </v-row>
      <v-row no-gutters v-for="(school, i) in schoolList" :key="i">
        <span>{{ school.title }}: {{ school.text }}</span>
      </v-row>
    </v-col>
  </v-row>
</template>
