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
        <v-row no-gutters align="baseline" class="mb-4">
          <v-col cols="auto">
            <h4 v-text="project.name" />
          </v-col>
          <v-spacer />
          <a :href="project.link.url">
            <v-icon class="headingText" left small>mdi-link-variant</v-icon>
            <span v-text="project.link.text" />
          </a>
        </v-row>
        <p v-text="project.description" />
        <p v-text="project.footer" class="font-italic" />
      </v-col>
    </v-row>
  </ResumeSection>
</template>
