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
        <v-row no-gutters align="end" class="mb-4">
          <v-col cols="auto">
            <h4>
              <a v-if="project.url" :href="project.url">
                <v-icon class="headingText" left small>mdi-link-variant</v-icon>
                <span v-text="project.name" class="headingText" />
              </a>
              <span v-else v-text="project.name" class="headingText" />
            </h4>
          </v-col>
        </v-row>
        <p v-text="project.description" />
        <p v-text="project.footer" class="font-weight-medium" />
      </v-col>
    </v-row>
  </ResumeSection>
</template>
