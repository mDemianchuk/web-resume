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
          <v-row no-gutters align="baseline">
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
          <p v-for="i in 4" :key="i">
            - Lorem ipsum dolor sit amet, no nam oblique veritus. Commune
            scaevola imperdiet nec ut, sed euismod convenire principes at. Est
            et nobis iisque percipit, an vim zril disputando voluptatibus, vix
            an salutandi sententiae.
          </p>
          <p>
            <i>Lorem ipsum dolor sit amet, no nam oblique veritus.</i>
          </p>
        </div>
      </v-timeline-item>
    </v-timeline>
  </ResumeSection>
</template>
