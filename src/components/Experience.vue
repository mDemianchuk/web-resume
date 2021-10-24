<script>
export default {
  props: {
    title: {
      type: String,
      default: '',
    },
    experienceList: {
      type: Array,
      default: () => [],
    },
  },
};
</script>

<template>
  <v-row>
    <v-col>
      <v-row no-gutters>
        <strong>{{ title }}</strong>
      </v-row>
      <v-timeline>
        <v-timeline-item
          v-for="(experience, i) in experienceList"
          :key="i"
          small
        >
          <template v-slot:opposite>
            <h2>{{ experience.dates }}</h2>
            <h2 :class="`headline font-weight-light mb-4`">
              {{ experience.title }}: {{ experience.companyName }}
            </h2>
          </template>
          <div>
            <p v-for="i in 4" :key="i">
              Lorem ipsum dolor sit amet, no nam oblique veritus. Commune
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
    </v-col>
  </v-row>
</template>
