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
    <v-timeline
      :align-top="isNarrowViewpoint"
      :dense="isNarrowViewpoint"
      class="pt-0"
    >
      <v-timeline-item
        v-for="(experience, i) in experienceList"
        :key="i"
        small
        fill-dot
        color="#337744"
        :class="isLastExperience(i) ? 'pa-0' : 'mb-10'"
      >
        <template #opposite>
          <h3 v-text="experience.dates" class="lightText" />
        </template>
        <div>
          <v-row
            no-gutters
            align="baseline"
            :class="{ 'mb-4': !isNarrowViewpoint }"
          >
            <v-col cols="auto">
              <h3 v-text="experience.title" />
              <h3 v-text="experience.companyName" class="secondaryText" />
            </v-col>
          </v-row>
          <h4
            v-if="isNarrowViewpoint"
            v-text="experience.dates"
            class="lightText mb-4"
          />
          <ul class="pa-0 pl-2">
            <li
              v-for="(duty, i) in experience.duties"
              :key="i"
              v-text="duty"
              class="pa-1"
            />
          </ul>
          <h4 class="mt-6 mb-2">{{ experience.tagName }}:</h4>
          <v-chip
            v-for="(tag, i) in experience.tags"
            :key="i"
            v-text="tag"
            class="font-weight-medium ma-1 accentSecondary"
          />
        </div>
      </v-timeline-item>
    </v-timeline>
  </ResumeSection>
</template>
