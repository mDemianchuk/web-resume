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
        <h1>{{ title }}</h1>
      </v-row>
      <v-row v-for="(school, i) in schoolList" :key="i">
        <v-col>
          <strong>{{ school.name }}</strong>
          <br />
          <span>{{ school.text }}</span>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
