<template>
  <v-app>
    <v-main>
      <Resume />
    </v-main>
  </v-app>
</template>

<script>
export default {
  data: () => ({}),
  components: {
    Resume: () => import('@components/Resume'),
  },
};
</script>
