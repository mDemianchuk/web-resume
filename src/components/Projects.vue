<script>
export default {
  props: {
    projectList: {
      type: Array,
      default: () => [],
    },
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
        <v-row no-gutters>
          <h4 v-text="project.name" class="mb-4" />
        </v-row>
        <v-row no-gutters>
          <span v-text="project.description" />
        </v-row>
        <v-row no-gutters justify="end">
          <a :href="project.link.url">
            <v-icon class="headingText" left small>mdi-link-variant</v-icon>
            <span v-text="project.link.text" />
          </a>
        </v-row>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
