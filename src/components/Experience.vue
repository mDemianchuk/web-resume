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
      <v-row
        no-gutters
        v-for="(experience, index) in experienceList"
        :key="index"
      >
        <span>{{ experience.title }}: {{ experience.text }}</span>
      </v-row>
    </v-col>
  </v-row>
</template>
