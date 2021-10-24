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
  <v-container>
    <v-row no-gutters>
      <h1>{{ title }}</h1>
    </v-row>
    <v-row v-for="(project, i) in projectList" :key="i">
      <v-col>
        <strong>{{ project.name }}</strong>
        <br />
        <span>{{ project.description }}</span>
        <br />
        <router-link to="" class="linkText">Link</router-link>
      </v-col>
    </v-row>
  </v-container>
</template>
