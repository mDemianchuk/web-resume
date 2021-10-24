<template>
  <v-app>
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<style lang="scss">
@import '@design';

body,
#app {
  color: $color-text;
  background-color: #f6f6f7;
  font-family: $body-font-family;
}

.headingText {
  color: $color-heading-text !important;
}

.secondaryText {
  color: $color-secondary-text;
}

.lightText {
  color: $color-light-text;
}

.linkText {
  color: $color-link-text !important;
  font-weight: 500;
}
</style>
