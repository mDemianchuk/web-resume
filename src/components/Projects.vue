<script>
export default {
  props: {
    projectList: {
      type: Array,
      default: () => [],
    },
  },
  components: {
    ResumeSection: () => import('@components/ResumeSection'),
  },
  data: () => ({
    title: 'Projects',
  }),
};
</script>

<template>
  <ResumeSection :title="title">
    <v-row v-for="(project, i) in projectList" :key="i">
      <v-col>
        <strong>{{ project.name }}</strong>
        <br />
        <span>{{ project.description }}</span>
        <br />
        <router-link to="" class="linkText">Link</router-link>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
