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
    <v-row v-for="(project, i) in projectList" :key="i" class="mb-8">
      <v-col>
        <v-row no-gutters align="end" class="mb-4">
          <v-col cols="auto">
            <h3>
              <a v-if="project.url" :href="project.url">
                <v-icon class="headingText" left small>mdi-link-variant</v-icon>
                <span v-text="project.name" class="headingText" />
              </a>
              <span v-else v-text="project.name" class="headingText" />
            </h3>
          </v-col>
        </v-row>
        <p v-text="project.description" />
        <h4 class="mt-6 mb-2">{{ project.tagName }}:</h4>
        <v-chip
          v-for="(tag, i) in project.tags"
          :key="i"
          v-text="tag"
          class="font-weight-medium ma-1 accentSecondary"
        />
      </v-col>
    </v-row>
  </ResumeSection>
</template>
