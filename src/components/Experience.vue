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
};
</script>

<template>
  <ResumeSection :title="title">
    <v-timeline>
      <v-timeline-item
        v-for="(experience, i) in experienceList"
        :key="i"
        small
        fill-dot
        color="#008060"
      >
        <template #opposite>
          <h2>{{ experience.title }}</h2>
          <h3 class="secondaryText">{{ experience.companyName }}</h3>
          <h4 class="lightText">{{ experience.dates }}</h4>
        </template>
        <div>
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
