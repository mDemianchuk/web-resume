<script>
export default {
  props: {
    schoolList: {
      type: Array,
      default: () => [],
    },
  },
  data: () => ({
    title: 'Education',
    prefix: '-',
  }),
};
</script>

<template>
  <ResumeSection :title="title">
    <v-row v-for="(school, i) in schoolList" :key="i" class="mb-8">
      <v-col>
        <v-row no-gutters align="baseline" class="mb-4">
          <v-col cols="auto">
            <h3 v-text="school.degree" />
            <h3 v-text="school.name" class="secondaryText" />
          </v-col>
          <v-spacer />
          <h3 v-text="school.dates" class="lightText" />
        </v-row>
        <ul class="pa-0 pl-2">
          <li
            v-for="(achievement, i) in school.achievements"
            :key="i"
            v-text="achievement"
            class="pa-1"
          />
        </ul>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
