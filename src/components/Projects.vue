<script>
export default {
  props: {
    title: {
      type: String,
      default: '',
    },
    projectList: {
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
      <v-row no-gutters v-for="(project, i) in projectList" :key="i">
        <span>{{ project.title }}: {{ project.text }}</span>
      </v-row>
    </v-col>
  </v-row>
</template>
