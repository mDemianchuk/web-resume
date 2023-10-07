<script>
export default {
  props: {
    firstName: {
      type: String,
      default: '',
    },
    lastName: {
      type: String,
      default: '',
    },
    middleName: {
      type: String,
      default: '',
    },
    summary: {
      type: String,
      default: '',
    },
    contactOptions: {
      type: Array,
      default: () => [],
    },
  },
};
</script>

<template>
  <v-container class="text-center">
    <v-row justify="center" no-gutters>
      <h1 class="text-lowercase">
        {{ firstName }}
        <span class="secondaryText">{{ `[${middleName}] ` }}</span>
        <span class="accentText">{{ lastName }}</span>
      </h1>
    </v-row>
    <v-row justify="center" no-gutters class="mt-4">
      <span>{{ summary }}</span>
    </v-row>
    <v-row justify="center">
      <v-col v-for="(item, i) in contactOptions" :key="i" cols="auto">
        <a :href="item.url" class="secondaryText">
          <v-icon left class="headingText">{{ item.icon }}</v-icon>
          {{ item.text }}
        </a>
      </v-col>
    </v-row>
  </v-container>
</template>
