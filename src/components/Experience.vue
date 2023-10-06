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
          <v-row
            no-gutters
            align="baseline"
            :class="{ 'mb-4': !isNarrowViewpoint }"
          >
            <v-col cols="auto">
              <h3 v-text="experience.title" />
              <h4 v-text="experience.companyName" class="secondaryText" />
            </v-col>
          </v-row>
          <h4
            v-if="isNarrowViewpoint"
            v-text="experience.dates"
            class="lightText mb-4"
          />
          <p
            v-for="(duty, i) in experience.duties"
            :key="i"
            v-text="`${prefix} ${duty}`"
          />
          <p v-text="experience.footer" class="font-weight-medium" />
        </div>
      </v-timeline-item>
    </v-timeline>
  </ResumeSection>
</template>
