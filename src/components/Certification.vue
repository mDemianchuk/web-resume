<script>
export default {
  props: {
    certificationList: {
      type: Array,
      default: () => [],
    },
  },
  data: () => ({
    title: 'Certifications',
  }),
};
</script>

<template>
  <ResumeSection :title="title">
    <v-row v-for="(certification, i) in certificationList" :key="i">
      <v-col>
        <v-row no-gutters align="end" class="mb-4">
          <v-col cols="auto">
            <h4>
              <a v-if="certification.url" :href="certification.url">
                <v-icon class="headingText" left small>mdi-link-variant</v-icon>
                <span v-text="certification.name" class="headingText" />
              </a>
              <span v-else v-text="certification.name" class="headingText" />
            </h4>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </ResumeSection>
</template>
