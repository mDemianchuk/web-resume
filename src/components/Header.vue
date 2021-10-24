<script>
export default {
  props: {
    name: {
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
  <v-row class="text-center">
    <v-col>
      <v-row justify="center" no-gutters>
        <strong>{{ name }}</strong>
      </v-row>
      <v-row justify="center" no-gutters>
        <v-col
          v-for="(item, i) in contactOptions"
          :key="i"
          cols="12"
          lg="3"
          md="3"
          sm="6"
        >
          <v-icon small left>{{ item.icon }}</v-icon>
          <span>{{ item.text }}</span>
        </v-col>
      </v-row>
    </v-col>
  </v-row>
</template>
