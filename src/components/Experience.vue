<script>
export default {
  props: {
    experienceList: {
      type: Array,
      default: () => [],
    },
  },
  data: () => ({
    title: 'Experience',
    prefix: '-',
  }),
  computed: {
    isNarrowViewpoint() {
      return this.$vuetify.breakpoint.smAndDown;
    },
  },
  methods: {
    isLastExperience(index) {
      return index === this.experienceList.length - 1;
    },
  },
};
</script>

<template>
  <ResumeSection :title="title">
    <v-timeline :dense="isNarrowViewpoint" class="pt-0 mt-6">
      <v-timeline-item
        v-for="(experience, i) in experienceList"
        :key="i"
        small
        fill-dot
        color="#008060"
        :class="{ 'pa-0': isLastExperience(i) }"
      >
        <template #opposite>
          <h3 v-text="experience.dates" class="secondaryText" />
        </template>
        <div>
          <v-row no-gutters align="baseline" class="mb-4">
            <v-col cols="auto">
              <h3 v-text="experience.title" class="colorText" />
              <h4 v-text="experience.companyName" />
            </v-col>
            <v-spacer />
            <h4
              v-if="isNarrowViewpoint"
              v-text="experience.dates"
              class="lightText"
            />
          </v-row>
          <p
            v-for="(duty, i) in experience.duties"
            :key="i"
            v-text="`${prefix} ${duty}`"
          />
          <p v-text="experience.footer" class="font-italic" />
        </div>
      </v-timeline-item>
    </v-timeline>
  </ResumeSection>
</template>
