<script>
export default {
  props: {
    schoolList: {
      type: Array,
      default: () => [],
    },
  },
  components: {
    ResumeSection: () => import('@components/ResumeSection'),
  },
  data: () => ({
    title: 'Education',
  }),
};
</script>

<template>
  <ResumeSection :title="title">
    <v-row v-for="(school, i) in schoolList" :key="i">
      <v-col>
        <strong>{{ school.name }}</strong>
        <br />
        <span>{{ school.text }}</span>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
