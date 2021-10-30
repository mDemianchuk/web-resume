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
    <v-row v-for="(school, i) in schoolList" :key="i">
      <v-col>
        <v-row no-gutters align="baseline" class="mb-4">
          <v-col cols="auto">
            <h3 v-text="school.degree" class="colorText" />
            <h4 v-text="school.name" />
          </v-col>
          <v-spacer />
          <h4 v-text="school.dates" class="lightText" />
        </v-row>
        <p
          v-for="(achievement, i) in school.achievements"
          :key="i"
          v-text="`${prefix} ${achievement}`"
        />
      </v-col>
    </v-row>
  </ResumeSection>
</template>
