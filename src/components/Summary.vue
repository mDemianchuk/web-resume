<script>
export default {
  props: {
    text: {
      type: String,
      default: '',
    },
  },
  data: () => ({
    title: 'Summary',
  }),
};
</script>

<template>
  <ResumeSection :title="title">
    <v-row>
      <v-col>
        <span>{{ text }}</span>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
