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
          <strong>{{ project.name }}</strong>
        </v-row>
        <v-row no-gutters>
          <span>{{ project.description }}</span>
        </v-row>
        <v-row no-gutters justify="end">
          <a href="">
            <v-icon class="headingText" left small>mdi-link-variant</v-icon>
            <span v-text="'Project Site'" />
          </a>
        </v-row>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
